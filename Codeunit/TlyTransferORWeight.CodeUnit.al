codeunit 50052 "WeightAlertBuffer"
{
    SingleInstance = true;

    var
        LastAlertedDoc: Code[20];
        LastAlertedWeight: Decimal;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    procedure CheckWeight(var Rec: Record "Transfer Line")
    var
        TransLine: Record "Transfer Line";
        CurrentTotalWeight: Decimal;
    begin
        if Rec."Document No." = '' then exit;

        CurrentTotalWeight := Rec.Quantity * Rec."Net Weight";
        TransLine.SetRange("Document No.", Rec."Document No.");
        TransLine.SetFilter("Line No.", '<>%1', Rec."Line No.");
        if TransLine.FindSet() then
            repeat
                CurrentTotalWeight += (TransLine.Quantity * TransLine."Net Weight");
            until TransLine.Next() = 0;

        // 2. Logic: Only alert if weight is over 1000 AND it is different from the last alert
        if (CurrentTotalWeight > 1000) and
           ((Rec."Document No." <> LastAlertedDoc) or (CurrentTotalWeight <> LastAlertedWeight))
        then begin
            SendWeightEmail(Rec."Document No.", CurrentTotalWeight);

            // 3. Update the buffer with this specific alert's details
            LastAlertedDoc := Rec."Document No.";
            LastAlertedWeight := CurrentTotalWeight;
        end;
    end;

    local procedure SendWeightEmail(DocNo: Code[20]; Total: Decimal)
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        EmailMsg.Create('purchasing@torlys.com', 'Weight Update: ' + DocNo,
            'The total weight for order ' + DocNo + ' is now ' + Format(Total) + ' lb.');
        Email.Send(EmailMsg);
    end;
}
