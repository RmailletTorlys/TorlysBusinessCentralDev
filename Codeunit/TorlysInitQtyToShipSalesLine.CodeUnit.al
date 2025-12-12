codeunit 50009 "TorlysInitQtyToShipSalesLine"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeInitQtyToShip', '', false, false)]
    local procedure OnBeforeInitQtyToShip(var SalesLine: Record "Sales Line"; FieldNo: Integer; var IsHandled: Boolean)
    var
        Item: Record "Item";
        UOMMgt: Codeunit "Unit of Measure Management";
        OkToAllocate: Boolean;
        QtyPerCase: Decimal;
        QtyPerPallet: Decimal;
        TempQuantity: Decimal;
    begin
        IsHandled := true;
        SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
        if FieldNo in [15, 50001, 50002] then begin
            Message('check 1');
            if SalesLine.Type = SalesLine.Type::Item then begin
                Message('check 2');
                if (SalesLine."Document Type" = SalesLine."Document Type"::Order) or (SalesLine."Document Type" = SalesLine."Document Type"::"Blanket Order") then begin
                    Message('check 3');
                    Item.Get(SalesLine."No.");
                    if NOT Item."Automatically Allocate" then begin
                        OkToAllocate := true;
                        if (SalesLine."Shipment Date" >= WorkDate()) then begin
                            if ((SalesLine."Shipment Date" - WorkDate()) <= 45) then
                                OkToAllocate := true
                            else
                                OkToAllocate := false;
                        end else
                            OkToAllocate := false;

                        Item.Get(SalesLine."No.");
                        Item.SetFilter("Location Filter", SalesLine."Location Code");
                        Item.CalcFields(Inventory, "Qty. to Ship", "Qty. to Ship (Transfer)");

                        if OkToAllocate = true then
                            SalesLine."Qty. to Ship" := Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
                        else
                            SalesLine."Qty. to Ship" := 0;

                        if SalesLine."Qty. to Ship" < 0 then
                            SalesLine."Qty. to Ship" := 0;

                        if SalesLine."Qty. to Ship" > SalesLine."Outstanding Quantity" then
                            SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";

                        SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
                        Item.Get(SalesLine."No.");
                        if Item."Compare Unit of Measure" <> '' then begin
                            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                            TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
                            SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                            if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                                while TempQuantity >= QtyPerPallet do begin
                                    SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                                    TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                                end;
                            SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                            SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
                        end;
                    end else begin
                        Message('check 4');
                        SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
                        SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
                        Item.Get(SalesLine."No.");
                        if Item."Compare Unit of Measure" <> '' then begin
                            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                            TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
                            SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                            if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                                while TempQuantity >= QtyPerPallet do begin
                                    SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                                    TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                                end;
                            SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                            SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
                        end;
                    end;
                end else begin
                    Message('check 5');
                    SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
                    SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
                    Item.Get(SalesLine."No.");
                    if Item."Compare Unit of Measure" <> '' then begin
                        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                        TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
                        SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                        if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                            while TempQuantity >= QtyPerPallet do begin
                                SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                                TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                            end;
                        SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                        SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
                    end;
                end;
            end else begin
                Message('check 6');
                SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
                SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
                SalesLine.CheckServItemCreation();
            end;
        end else begin
            Message('check 7');
            if SalesLine.Type = SalesLine.Type::Item then begin
                SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
                Item.Get(SalesLine."No.");
                if Item."Compare Unit of Measure" <> '' then begin
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                    TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
                    SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                    if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                    SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
                    // SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
                end else begin
                    SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
                    SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
                    SalesLine.CheckServItemCreation();
                end;
            end;
        end;

        SalesLine.InitQtyToInvoice();

    end;
}