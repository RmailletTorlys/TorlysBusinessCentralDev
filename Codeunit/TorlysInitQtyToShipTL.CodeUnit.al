codeunit 50013 "TorlysInitQtyToShipTL"
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterInitQtyToShip', '', false, false)]
    local procedure OnAfterInitQtyToReceive(var TransferLine: Record "Transfer Line"; CurrentFieldNo: Integer)
    var
        Item: Record "Item";
        UOMMgt: Codeunit "Unit of Measure Management";
        QtyPerCase: Integer;
        QtyPerPallet: Integer;
        TempQuantity: Decimal;

    begin
        TransferLine."Qty. to Ship" := TransferLine."Outstanding Quantity";
        TransferLine."Qty. to Ship (Base)" := TransferLine."Outstanding Qty. (Base)";

        Item.Get(TransferLine."Item No.");
        if Item."Compare Unit of Measure" <> '' then begin
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
            TempQuantity := TransferLine."Qty. to Ship"; //store entered quantity in variable
            TransferLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
            if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                while TempQuantity >= QtyPerPallet do begin
                    TransferLine."Qty. to Ship Pallet" := TransferLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                    TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                end;
            TransferLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
        end;
    end;
}