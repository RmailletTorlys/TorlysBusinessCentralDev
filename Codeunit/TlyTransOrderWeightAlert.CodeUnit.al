Codeunit 50052 TlyTransOrderWeightAlert
{
    SingleInstance = true;

    var
        LastAlertedDate: Date;
        LastAlertedWeight: Decimal;
        LastFromCode: Code[20];
        LastToCode: Code[20];

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    procedure CheckWeight(var Rec: Record "Transfer Line")
    var
        TransLine: Record "Transfer Line";
        CurrentTotalWeight: Decimal;
        InventorySetup: Record "Inventory Setup";
        TransHeader: Record "Transfer Header";
    begin
        // FIX: Ignore lines with no quantity or no weight to prevent double emails
        if (Rec.Quantity = 0) or (Rec."Net Weight" = 0) then
            exit;

        // Get the header to identify From/To locations
        if not TransHeader.Get(Rec."Document No.") then exit;

        // Exit if basic conditions aren't met
        if (Rec."In-Transit Code" <> 'TR-BRANCH') or (Rec."Shipment Date" = 0D) then
            exit;

        InventorySetup.Get();
        if InventorySetup."Transfer Order Alert Weight" <= 0 then
            exit;

        // Calculate weight for lines with same Date, In-Transit AND Route (From/To)
        TransLine.Reset();
        TransLine.SetRange("Shipment Date", Rec."Shipment Date");
        TransLine.SetRange("In-Transit Code", 'TR-BRANCH');
        TransLine.SetRange("Transfer-from Code", TransHeader."Transfer-from Code");
        TransLine.SetRange("Transfer-to Code", TransHeader."Transfer-to Code");

        if TransLine.FindSet() then
            repeat
                if (TransLine."Document No." = Rec."Document No.") and (TransLine."Line No." = Rec."Line No.") then
                    CurrentTotalWeight += (Rec.Quantity * Rec."Net Weight")
                else
                    CurrentTotalWeight += (TransLine.Quantity * TransLine."Net Weight");
            until TransLine.Next() = 0;

        // Alert if limit exceeded AND it's a new alert for this specific route/date/weight
        if (CurrentTotalWeight > InventorySetup."Transfer Order Alert Weight") and
           ((Rec."Shipment Date" <> LastAlertedDate) or
            (CurrentTotalWeight <> LastAlertedWeight) or
            (TransHeader."Transfer-from Code" <> LastFromCode) or
            (TransHeader."Transfer-to Code" <> LastToCode))
        then begin
            SendWeightEmail(Rec."Shipment Date", CurrentTotalWeight, TransHeader."Transfer-from Code", TransHeader."Transfer-to Code");

            LastAlertedDate := Rec."Shipment Date";
            LastAlertedWeight := CurrentTotalWeight;
            LastFromCode := TransHeader."Transfer-from Code";
            LastToCode := TransHeader."Transfer-to Code";
        end;
    end;

    local procedure SendWeightEmail(ShipDate: Date; Total: Decimal; FromLoc: Code[20]; ToLoc: Code[20])
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        EmailMsg.Create('purchasing@torlys.com',
            StrSubstNo('Daily Weight Alert: %1 to %2 (%3)', FromLoc, ToLoc, ShipDate),
            StrSubstNo('The total weight for transfers from %1 to %2 on %3 has exceeded the limit. Current total: %4 lbs.',
                FromLoc, ToLoc, ShipDate, Format(Total)));
        Email.Send(EmailMsg);
    end;
}
