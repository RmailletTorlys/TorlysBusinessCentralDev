codeunit 57009 TlyReleaseTransferDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Transfer Document", 'OnBeforeReleaseTransferDoc', '', false, false)]
    local procedure OnBeforeReleaseTransferDoc(var TransferHeader: Record "Transfer Header")
    var
        TransferLine: Record "Transfer Line";
        TRQuantity: Decimal;
        TRQtytoShip: Decimal;
        TRQuantityShipped: Decimal;
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
        TransferLine.SetFilter("Derived From Line No.", '0');
        if TransferLine.Find('-') then begin
            repeat
                TRQuantity += TransferLine.Quantity;
                TRQtytoShip += TransferLine."Qty. to Ship";
                TRQuantityShipped += TransferLine."Quantity Shipped";
            until TransferLine.Next() = 0;
            // Message('qty %1 to ship %2 shipped %3', TRQuantity, TRQtytoShip, TRQuantityShipped);
            if TRQtytoShip <> 0 then begin
                if TRQuantity <> TRQtytoShip then
                    Error('Transfer is not fully allocated.');
            end

        end;
    end;

}