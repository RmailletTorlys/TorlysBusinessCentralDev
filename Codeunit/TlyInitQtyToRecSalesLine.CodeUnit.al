codeunit 50011 TlyInitQtyToRecSalesLine
{
    // all we do here is set the case and pallet value based on what is in "Return Qty. to Receive", 
    // the value either comes from "SetDefalutQuantity" or is manually typed in by the user
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitQtyToReceive', '', false, false)]
    local procedure OnAfterInitQtyToReceive(var SalesLine: Record "Sales Line"; CurrFieldNo: Integer)
    var
        Item: Record Item;
        QtyPerCase: Decimal;
        QtyPerPallet: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
        TempQuantity: Decimal;
    begin
        if SalesLine.Type = SalesLine.Type::Item then begin //only run check for items
            Item.Get(SalesLine."No."); //get the item record
            if Item."Compare Unit of Measure" <> '' then begin
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                TempQuantity := SalesLine."Return Qty. to Receive"; //store entered quantity in variable
                SalesLine."Return Qty. to Receive Pallet" := 0; //go back to 0 for when quantity is changed
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        SalesLine."Return Qty. to Receive Pallet" := SalesLine."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                SalesLine."Return Qty. to Receive Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                // SalesLine."Return Qty. to Receive" := ((QtyPerPallet * SalesLine."Return Qty. to Receive Pallet") + (QtyPerCase * SalesLine."Return Qty. to Receive Case")) / SalesLine."Qty. per Unit of Measure";
            end;
        end;
    end;
}