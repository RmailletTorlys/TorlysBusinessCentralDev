codeunit 50021 TorlysLinkSalesLine
{
    procedure LinkSalesLineToPurchaseLine(Rec: Record "Sales Line")
    var
        PurchaseLines: Page "Purchase Lines";
        PurchaseLine: Record "Purchase Line";
    begin
    end;

    procedure LinkSalesLineToTransferLine(Rec: Record "Sales Line")
    var
        TransferLines: Page "Transfer Lines";
        TransferLine: Record "Transfer Line";
    begin
        if Rec."Linked Transfer Order No." <> '' then
            Error('%1 from %2 with a quantity of %3 is already linked to %4 line %5. Delete link to change.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Linked Transfer Order No.", Rec."Linked Transfer Order Line No.");

        TransferLines.LookupMode(true);
        TransferLine.Reset;
        TransferLine.SetRange("Transfer-to Code", Rec."Location Code");
        TransferLine.SetRange("Item No.", Rec."No.");
        TransferLine.SetFilter("Qty. in Transit", '<>0');
        // i wish the next line could take how much is remaining to be linked, but i think would need to create a new field
        TransferLine.SetFilter("Quantity", '>=%1', Rec."Quantity");
        TransferLines.SetTableView(TransferLine);
        if TransferLines.RunModal() = Action::LookupOK then
            TransferLines.GetRecord(TransferLine);

        TransferLine.CalcFields("Quantity Linked");
        if (TransferLine."Quantity Linked" + Rec.Quantity) > TransferLine.Quantity then begin
            Error('Not enough quantity remaining on %1 line %2.\Please choose another transfer.', TransferLine."Document No.", TransferLine."Line No.");
        end else begin
            Message('%1 from %2 with a quantity of %3 will be linked to %4 line %5.', Rec."No.", Rec."Document No.", Rec."Quantity", TransferLine."Document No.", TransferLine."Line No.");
            Rec.Validate(Rec."Linked Transfer Order No.", TransferLine."Document No.");
            Rec.Validate(Rec."Linked Transfer Order Line No.", TransferLine."Line No.");
            Rec.Modify(true);
            Commit();
        end;
    end;
}