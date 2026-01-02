codeunit 50021 TlyLinkSalesLine
{
    procedure LinkSalesLineToPurchaseLine(Rec: Record "Sales Line")
    var
        PurchaseLines: Page "Purchase Lines";
        PurchaseLine: Record "Purchase Line";
    begin
        if Rec."Linked Purchase Order No." <> '' then
            Error('ERROR!\\%1 from %2 with a quantity of %3 is already linked to %4 line %5.\\Remove link to change.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Linked Purchase Order No.", Rec."Linked Purch. Order Line No.");

        PurchaseLines.LookupMode(true);
        PurchaseLine.Reset;
        PurchaseLine.SetRange("Location Code", Rec."Location Code");
        PurchaseLine.SetRange("No.", Rec."No.");
        // i wish the next line could take how much is remaining to be linked, but i think would need to create a new field
        PurchaseLine.SetFilter("Quantity", '>=%1', Rec."Quantity");
        PurchaseLines.SetTableView(PurchaseLine);
        if PurchaseLines.RunModal() = Action::LookupOK then begin
            PurchaseLines.GetRecord(PurchaseLine);

            PurchaseLine.CalcFields("Quantity Linked");
            if (PurchaseLine."Quantity Linked" + Rec.Quantity) > PurchaseLine.Quantity then begin
                Error('ERROR!\\Not enough quantity remaining on %1 line %2.\\Please choose another purchase order.', PurchaseLine."Document No.", PurchaseLine."Line No.");
            end else begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be linked to %4 line %5.', Rec."No.", Rec."Document No.", Rec."Quantity", PurchaseLine."Document No.", PurchaseLine."Line No.");
                Rec.Validate(Rec."Linked Purchase Order No.", PurchaseLine."Document No.");
                Rec.Validate(Rec."Linked Purch. Order Line No.", PurchaseLine."Line No.");
                Rec.Modify(true);
                Commit();
            end;
        end;
    end;


    procedure LinkSalesLineToTransferLine(Rec: Record "Sales Line")
    var
        TransferLines: Page "Transfer Lines";
        TransferLine: Record "Transfer Line";
    begin
        if Rec."Linked Transfer Order No." <> '' then
            Error('ERROR!\\%1 from %2 with a quantity of %3 is already linked to %4 line %5.\\Remove link to change.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Linked Transfer Order No.", Rec."Linked Transfer Order Line No.");

        TransferLines.LookupMode(true);
        TransferLine.Reset;
        TransferLine.SetRange("Transfer-to Code", Rec."Location Code");
        TransferLine.SetRange("Item No.", Rec."No.");
        TransferLine.SetFilter("Qty. in Transit", '<>0');
        // i wish the next line could take how much is remaining to be linked, but i think would need to create a new field
        TransferLine.SetFilter("Quantity", '>=%1', Rec."Quantity");
        TransferLines.SetTableView(TransferLine);
        if TransferLines.RunModal() = Action::LookupOK then begin
            TransferLines.GetRecord(TransferLine);

            TransferLine.CalcFields("Quantity Linked");
            if (TransferLine."Quantity Linked" + Rec.Quantity) > TransferLine.Quantity then begin
                Error('ERROR!\\Not enough quantity remaining on %1 line %2.\\Please choose another transfer.', TransferLine."Document No.", TransferLine."Line No.");
            end else begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be linked to %4 line %5.', Rec."No.", Rec."Document No.", Rec."Quantity", TransferLine."Document No.", TransferLine."Line No.");
                Rec.Validate(Rec."Linked Transfer Order No.", TransferLine."Document No.");
                Rec.Validate(Rec."Linked Transfer Order Line No.", TransferLine."Line No.");
                Rec.Modify(true);
                Commit();
            end;
        end;
    end;
}