codeunit 50009 TlyInitQtyToShipSalesLine
{
    //     // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeInitQtyToShip', '', false, false)]
    //     // local procedure OnBeforeInitQtyToShip(var SalesLine: Record "Sales Line"; FieldNo: Integer; var IsHandled: Boolean)
    //     // var
    //     //     Item: Record "Item";
    //     //     UOMMgt: Codeunit "Unit of Measure Management";
    //     //     OkToAllocate: Boolean;
    //     //     QtyPerCase: Decimal;
    //     //     QtyPerPallet: Decimal;
    //     //     TempQuantity: Decimal;
    //     // begin
    //     //     IsHandled := true;

    //     //     SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
    //     //     if FieldNo in [15, 50001, 50002] then begin
    //     //         Message('check 1 quantity fields');
    //     //         if SalesLine.Type = SalesLine.Type::Item then begin
    //     //             Message('check 2 item');
    //     //             if (SalesLine."Document Type" = SalesLine."Document Type"::Order) or (SalesLine."Document Type" = SalesLine."Document Type"::"Blanket Order") then begin
    //     //                 Message('check 3 order');
    //     //                 Item.Get(SalesLine."No.");
    //     //                 if NOT Item."Automatically Allocate" then begin
    //     //                     OkToAllocate := true;
    //     //                     if (SalesLine."Shipment Date" >= WorkDate()) then begin
    //     //                         if ((SalesLine."Shipment Date" - WorkDate()) <= 45) then
    //     //                             OkToAllocate := true
    //     //                         else
    //     //                             OkToAllocate := false;
    //     //                     end else
    //     //                         OkToAllocate := false;

    //     //                     Item.Get(SalesLine."No.");
    //     //                     Item.SetFilter("Location Filter", SalesLine."Location Code");
    //     //                     Item.CalcFields(Inventory, "Qty. to Ship", "Qty. to Ship (Transfer)");

    //     //                     if OkToAllocate = true then
    //     //                         SalesLine."Qty. to Ship" := Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
    //     //                     else
    //     //                         SalesLine."Qty. to Ship" := 0;

    //     //                     if SalesLine."Qty. to Ship" < 0 then
    //     //                         SalesLine."Qty. to Ship" := 0;

    //     //                     if SalesLine."Qty. to Ship" > SalesLine."Outstanding Quantity" then
    //     //                         SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";

    //     //                     SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
    //     //                     Item.Get(SalesLine."No.");
    //     //                     if Item."Compare Unit of Measure" <> '' then begin
    //     //                         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //     //                         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
    //     //                         TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
    //     //                         SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
    //     //                         if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
    //     //                             while TempQuantity >= QtyPerPallet do begin
    //     //                                 SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
    //     //                                 TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
    //     //                             end;
    //     //                         SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
    //     //                         SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
    //     //                     end;
    //     //                 end else begin
    //     //                     Message('check 4 not auto allocate');
    //     //                     SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
    //     //                     SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
    //     //                     Item.Get(SalesLine."No.");
    //     //                     if Item."Compare Unit of Measure" <> '' then begin
    //     //                         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //     //                         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
    //     //                         TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
    //     //                         SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
    //     //                         if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
    //     //                             while TempQuantity >= QtyPerPallet do begin
    //     //                                 SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
    //     //                                 TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
    //     //                             end;
    //     //                         SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
    //     //                         SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
    //     //                     end;
    //     //                 end;
    //     //             end else begin
    //     //                 Message('check 5 not order');
    //     //                 SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
    //     //                 SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
    //     //                 Item.Get(SalesLine."No.");
    //     //                 if Item."Compare Unit of Measure" <> '' then begin
    //     //                     QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //     //                     QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
    //     //                     TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
    //     //                     SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
    //     //                     if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
    //     //                         while TempQuantity >= QtyPerPallet do begin
    //     //                             SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
    //     //                             TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
    //     //                         end;
    //     //                     SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
    //     //                     SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
    //     //                 end;
    //     //             end;
    //     //         end else begin
    //     //             Message('check 6 gl account');
    //     //             SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
    //     //             SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
    //     //             SalesLine.CheckServItemCreation();
    //     //         end;
    //     //     end else begin
    //     //         if SalesLine.Type = SalesLine.Type::Item then begin
    //     //             Message('check 7 qty to ship fields');
    //     //             SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
    //     //             Item.Get(SalesLine."No.");
    //     //             if Item."Compare Unit of Measure" <> '' then begin
    //     //                 QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //     //                 QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
    //     //                 TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
    //     //                 SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
    //     //                 if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
    //     //                     while TempQuantity >= QtyPerPallet do begin
    //     //                         SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
    //     //                         TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
    //     //                     end;
    //     //                 SalesLine."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
    //     //                 SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
    //     //                 // SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
    //     //             end else begin
    //     //                 SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
    //     //                 SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
    //     //                 SalesLine.CheckServItemCreation();
    //     //             end;
    //     //         end;
    //     //     end;

    //     //     SalesLine.InitQtyToInvoice();

    //     // end;


    //     [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitQtyToShip', '', false, false)]
    //     local procedure OnAfterInitQtyToShip(var SalesLine: Record "Sales Line"; CurrFieldNo: Integer)
    //     begin
    //     end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeInitQtyToShip', '', false, false)]
    // local procedure OnBeforeInitQtyToShip(var SalesLine: Record "Sales Line"; FieldNo: Integer; var IsHandled: Boolean)
    // var
    //     SalesSetup: Record "Sales & Receivables Setup";
    //     Item: Record Item;
    //     QtyPerCase: Decimal;
    //     QtyPerPallet: Decimal;
    //     UOMMgt: Codeunit "Unit of Measure Management";
    //     TempQuantity: Decimal;
    // begin
    //     IsHandled := true;

    //     // GetSalesSetup();
    //     SalesSetup.Get();
    //     if (SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Remainder) or
    //        (SalesLine."Document Type" = SalesLine."Document Type"::Invoice) or
    //        (SalesLine."Type" = SalesLine."Type"::"G/L Account")
    //     then begin
    //         SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
    //         SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
    //     end else
    //         if SalesLine."Qty. to Ship" <> 0 then
    //             SalesLine."Qty. to Ship (Base)" :=
    //               SalesLine.MaxQtyToShipBase(SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)")));
    //     // allocation code - start
    //     // if SalesLine.Type = SalesLine.Type::Item then begin
    //     // SalesLine."Qty. to Ship" := 50;
    //     // SalesLine."Qty. to Ship (Base)" := 50;
    //     // end else begin
    //     //     SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
    //     //     SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
    //     // end;
    //     // allocation code - end

    //     // OnInitQtyToShipOnBeforeCheckServItemCreation(Rec);
    //     SalesLine.CheckServItemCreation();

    //     // OnAfterInitQtyToShip(Rec, CurrFieldNo);
    //     if SalesLine.Type = SalesLine.Type::Item then begin //only run check for items
    //         Item.Get(SalesLine."No."); //get the item record
    //         if Item."Compare Unit of Measure" <> '' then begin
    //             QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //             QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
    //             TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
    //             SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
    //             if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
    //                 while TempQuantity >= QtyPerPallet do begin
    //                     SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
    //                     TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
    //                 end;
    //             SalesLine."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
    //             SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
    //         end;
    //     end;

    //     SalesLine.InitQtyToInvoice();
    // end;

    // all we do here is set the case and pallet value based on what is in "Qty. to Ship",
    // the value either comes from "SetDefaultQuantity" or is manually typed in by the user
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitQtyToShip', '', false, false)]
    local procedure OnAfterInitQtyToShip(var SalesLine: Record "Sales Line"; CurrFieldNo: Integer)
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
                TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
                SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                SalesLine."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                // SalesLine."Qty. to Ship" := ((QtyPerPallet * SalesLine."Qty. to Ship Pallet") + (QtyPerCase * SalesLine."Qty. to Ship Case")) / SalesLine."Qty. per Unit of Measure";
            end;
        end;
    end;
}