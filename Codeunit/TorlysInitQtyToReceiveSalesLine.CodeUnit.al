codeunit 50011 "TorlysInitQtyToReceive"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeInitQtyToReceive', '', false, false)]
    local procedure OnBeforeInitQtyToReceive(var SalesLine: Record "Sales Line"; FieldNo: Integer; var IsHandled: Boolean)
    var
        Item: Record "Item";
        QtyPerCase: Integer;
        QtyPerPallet: Integer;
        TempQuantity: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
    begin
        IsHandled := true;

        if (SalesLine.Type = SalesLine.Type::Item) then begin
            if (SalesLine."Document Type" = SalesLine."Document Type"::"Return Order") then begin
                SalesLine."Return Qty. to Receive" := 0;
                SalesLine.CalcBaseQty(SalesLine."Return Qty. to Receive", SalesLine.FieldCaption(SalesLine."Return Qty. to Receive"), SalesLine.FieldCaption(SalesLine."Return Qty. to Receive (Base)"));
            end else begin
                SalesLine."Return Qty. to Receive" := SalesLine."Outstanding Quantity";
                SalesLine.CalcBaseQty(SalesLine."Return Qty. to Receive", SalesLine.FieldCaption(SalesLine."Return Qty. to Receive"), SalesLine.FieldCaption(SalesLine."Return Qty. to Receive (Base)"));
                Item.Get(SalesLine."No.");
                if Item."Compare Unit of Measure" <> '' then begin
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                    TempQuantity := SalesLine."Return Qty. to Receive"; //store entered quantity in variable
                    SalesLine."Return Qty. to Receive Pallet" := 0; //go back to 0 for when quantity is changed
                    if TempQuantity >= QtyPerPallet then begin //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            SalesLine."Return Qty. to Receive Pallet" := SalesLine."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    end;
                    SalesLine."Return Qty. to Receive Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                end;
            end;
        end else begin
            SalesLine."Return Qty. to Receive" := SalesLine."Outstanding Quantity";
            SalesLine.CalcBaseQty(SalesLine."Return Qty. to Receive", SalesLine.FieldCaption(SalesLine."Return Qty. to Receive"), SalesLine.FieldCaption(SalesLine."Return Qty. to Receive (Base)"));
        end;

        SalesLine.InitQtyToInvoice();
    end;
}