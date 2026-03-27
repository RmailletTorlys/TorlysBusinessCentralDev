codeunit 57009 TlyReleaseTransferDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Transfer Document", 'OnBeforeReleaseTransferDoc', '', false, false)]
    local procedure OnBeforeReleaseTransferDoc(var TransferHeader: Record "Transfer Header")
    var
        TransferLine: Record "Transfer Line";
        TRQuantity: Decimal;
        TRQtytoShip: Decimal;
    begin
        TransferHeader.TestField("Transfer Type");
        TransferHeader.TestField("Shortcut Dimension 1 Code");
        TransferHeader.TestField("Shortcut Dimension 2 Code");
        TransferHeader.TestField("Shipment Date");
        TransferHeader.TestField("Receipt Date");
        TransferHeader.TestField("Shipping Agent Code");

        //check that all lines are allocated
        TransferLine.Reset();
        TransferLine.SetRange("Document No.", TransferHeader."No.");
        if TransferLine.Find('-') then begin
            repeat
                TRQuantity += TransferLine.Quantity;
                TRQtytoShip += TransferLine."Qty. to Ship";
            until TransferLine.Next() = 0;
            if TRQuantity <> TRQtytoShip then
                Error('Transfer is not fully allocated.');
        end;
    end;

}