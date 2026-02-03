codeunit 50095 TlyInitQtyToRecPurchLine
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitQtyToReceive', '', false, false)]
    local procedure OnAfterInitQtyToReceive(var PurchLine: Record "Purchase Line"; CurrFieldNo: Integer)
    var
    begin
        if PurchLine."Document Type" = PurchLine."Document Type"::Order then begin
            PurchLine."Qty. to Receive Case" := 0;
            PurchLine."Qty. to Receive Pallet" := 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitQtyToShip', '', false, false)]
    local procedure OnAfterInitQtyToShip(var PurchLine: Record "Purchase Line"; CurrFieldNo: Integer)
    var
    begin


        if PurchLine."Document Type" = PurchLine."Document Type"::"Return Order" then begin
            PurchLine."Return Qty. to Ship Case" := 0;
            PurchLine."Return Qty. to Ship Pallet" := 0;
        end;
    end;
}