// codeunit 50052 TlyTransOrderWeightAlert
// {
//     SingleInstance = true;

//     var
//         LastAlertedDoc: Code[20];
//         LastAlertedWeight: Decimal;

//     [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
//     procedure CheckWeight(var Rec: Record "Transfer Line")
//     var
//         TransLine: Record "Transfer Line";
//         CurrentTotalWeight: Decimal;
//         InventortySetup: Record "Inventory Setup";
//     begin
//         if (Rec."Document No." = '') or (Rec."In-Transit Code" <> 'TR-BRANCH') then
//             exit;

//         InventortySetup.Get();

//         CurrentTotalWeight := Rec.Quantity * Rec."Net Weight";
//         TransLine.SetRange("Document No.", Rec."Document No.");
//         TransLine.SetRange("In-Transit Code", 'TR-BRANCH');
//         TransLine.SetFilter("Line No.", '<>%1', Rec."Line No.");
//         if TransLine.FindSet() then
//             repeat
//                 CurrentTotalWeight += (TransLine.Quantity * TransLine."Net Weight");
//             until TransLine.Next() = 0;

//         // 2. Logic: Only alert if weight is over "Alert Weight" on "Inventory Setup" AND it is different from the last alert
//         if (CurrentTotalWeight > InventortySetup."Transfer Order Alert Weight") and
//            ((Rec."Document No." <> LastAlertedDoc) or (CurrentTotalWeight <> LastAlertedWeight))
//         then begin
//             SendWeightEmail(Rec."Document No.", CurrentTotalWeight);

//             // 3. Update the buffer with this specific alert's details
//             LastAlertedDoc := Rec."Document No.";
//             LastAlertedWeight := CurrentTotalWeight;
//         end;
//     end;

//     local procedure SendWeightEmail(DocNo: Code[20]; Total: Decimal)
//     var
//         EmailMsg: Codeunit "Email Message";
//         Email: Codeunit Email;
//     begin
//         EmailMsg.Create('sameer.patel@torlys.com', 'Transfer Order Weight Alert: ' + DocNo,
//             'The total weight for order ' + DocNo + ' is over the alert weight and is now ' + Format(Total) + ' lbs.');
//         Email.Send(EmailMsg);
//     end;
// }
codeunit 50052 TlyTransOrderWeightAlert
{
    SingleInstance = true;

    var
        LastAlertedDate: Date;
        LastAlertedWeight: Decimal;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    procedure CheckWeight(var Rec: Record "Transfer Line")
    var
        TransLine: Record "Transfer Line";
        CurrentTotalWeight: Decimal;
        InventorySetup: Record "Inventory Setup";
    begin
        // Exit if basic conditions aren't met
        if (Rec."In-Transit Code" <> 'TR-BRANCH') or (Rec."Shipment Date" = 0D) then
            exit;

        InventorySetup.Get();
        if InventorySetup."Transfer Order Alert Weight" <= 0 then
            exit;

        // Calculate weight for ALL lines with same Shipment Date and In-Transit Code
        TransLine.Reset();
        TransLine.SetRange("Shipment Date", Rec."Shipment Date");
        TransLine.SetRange("In-Transit Code", 'TR-BRANCH');

        if TransLine.FindSet() then
            repeat
                // For the line currently being modified, use the 'Rec' values to get the real-time weight
                if (TransLine."Document No." = Rec."Document No.") and (TransLine."Line No." = Rec."Line No.") then
                    CurrentTotalWeight += (Rec.Quantity * Rec."Net Weight")
                else
                    CurrentTotalWeight += (TransLine.Quantity * TransLine."Net Weight");
            until TransLine.Next() = 0;

        // Alert if total exceeds setup AND it's different from the last recorded alert for this date
        if (CurrentTotalWeight > InventorySetup."Transfer Order Alert Weight") and
           ((Rec."Shipment Date" <> LastAlertedDate) or (CurrentTotalWeight <> LastAlertedWeight))
        then begin
            SendWeightEmail(Rec."Shipment Date", CurrentTotalWeight);

            LastAlertedDate := Rec."Shipment Date";
            LastAlertedWeight := CurrentTotalWeight;
        end;
    end;

    local procedure SendWeightEmail(ShipDate: Date; Total: Decimal)
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        EmailMsg.Create('purchasing@torlys.com',
            StrSubstNo('Daily Transfer Weight Alert: %1', ShipDate),
            StrSubstNo('The total weight for all transfers shipping on %1 to TR-BRANCH has exceeded the limit. Current total: %2 lbs.', ShipDate, Format(Total)));
        Email.Send(EmailMsg);
    end;
}
