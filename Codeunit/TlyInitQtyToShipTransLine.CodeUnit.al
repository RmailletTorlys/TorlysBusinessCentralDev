codeunit 50109 TlyInitQtyToShipTransLine
{
    // [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterInitQtyToShip', '', false, false)]
    // local procedure OnAfterInitQtyToShip(var TransferLine: Record "Transfer Line"; CurrentFieldNo: Integer)
    // var
    //     Item: Record Item;
    //     QtyPerCase: Decimal;
    //     QtyPerPallet: Decimal;
    //     UOMMgt: Codeunit "Unit of Measure Management";
    //     TempQuantity: Decimal;
    // begin
    //     Message('hi 1a allocat %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
    //     TransferLine."Qty. to Ship" := 0;
    //     TransferLine."Qty. to Ship (Base)" := 0;
    //     TransferLine.Modify(true);
    //     Commit();
    //     // CurrPage.Update(true);
    //     Message('hi 1b allocat %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");

    //     // Message('hi 1c allocat %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
    //     // Item.Get(TransferLine."Item No.");
    //     // Item.SetFilter(Item."Location Filter", TransferLine."Transfer-from Code");
    //     // Item.CalcFields(Item.Inventory, Item."Qty. to Ship", Item."Qty. to Ship (Transfer)");
    //     // Message('hi 2 invent %1 to ship %2 tran %3 allocated %4 outs %5', Item.Inventory, Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
    //     // TransferLine."Qty. to Ship" := Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)";
    //     // Message('hi 3 allo %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
    //     // if TransferLine."Qty. to Ship" < 0 then TransferLine."Qty. to Ship" := 0;
    //     // if TransferLine."Qty. to Ship" > TransferLine."Outstanding Quantity" then TransferLine."Qty. to Ship" := TransferLine."Outstanding Quantity";
    //     // // TransferLine."Qty. to Ship (Base)" := TransferLine.CalcBaseQty(TransferLine."Qty. to Ship", TransferLine.FieldCaption(TransferLine."Qty. to Ship"), TransferLine.FieldCaption(TransferLine."Qty. to Ship (Base)"));
    //     // TransferLine."Qty. to Ship (Base)" := TransferLine."Qty. to Ship";
    //     // TransferLine.Modify(true);
    //     // Message('hi 4 allo %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");

    //     // if Item."Compare Unit of Measure" <> '' then begin
    //     //     QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //     //     QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
    //     //     TempQuantity := TransferLine."Qty. to Ship"; //store entered quantity in variable
    //     //     TransferLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
    //     //     if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
    //     //         while TempQuantity >= QtyPerPallet do begin
    //     //             TransferLine."Qty. to Ship Pallet" := TransferLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
    //     //             TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
    //     //         end;
    //     //     TransferLine."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
    //     // end;
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterUpdateWithWarehouseShipReceive', '', false, false)]
    local procedure OnAfterUpdateWithWarehouseShipReceive(var TransferLine: Record "Transfer Line"; CurrentFieldNo: Integer)
    var
        Item: Record Item;
        QtyPerCase: Decimal;
        QtyPerPallet: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
        TempQuantity: Decimal;
    begin
        // Message('hi 1a allocat %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
        TransferLine."Qty. to Ship" := 0;
        TransferLine."Qty. to Ship Case" := 0;
        TransferLine."Qty. to Ship Pallet" := 0;
        TransferLine."Qty. to Ship (Base)" := 0;
        // TransferLine.Modify(true);
        // Commit();
        // Message('hi 1b allocat %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");

        // Message('hi 1c allocat %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
        Item.Get(TransferLine."Item No.");
        Item.SetFilter(Item."Location Filter", TransferLine."Transfer-from Code");
        Item.CalcFields(Item.Inventory, Item."Qty. to Ship", Item."Qty. to Ship (Transfer)");
        // Message('hi 2 invent %1 to ship %2 tran %3 allocated %4 outs %5', Item.Inventory, Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
        TransferLine."Qty. to Ship" := Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)";
        // Message('hi 3 allo %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");
        if TransferLine."Qty. to Ship" < 0 then TransferLine."Qty. to Ship" := 0;
        if TransferLine."Qty. to Ship" > TransferLine."Outstanding Quantity" then TransferLine."Qty. to Ship" := TransferLine."Outstanding Quantity";
        // TransferLine."Qty. to Ship (Base)" := TransferLine.CalcBaseQty(TransferLine."Qty. to Ship", TransferLine.FieldCaption(TransferLine."Qty. to Ship"), TransferLine.FieldCaption(TransferLine."Qty. to Ship (Base)"));
        TransferLine."Qty. to Ship (Base)" := TransferLine."Qty. to Ship";
        // TransferLine.Modify(true);
        // Message('hi 4 allo %1 outs %2', TransferLine."Qty. to Ship", TransferLine."Outstanding Quantity");

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
            TransferLine."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
        end;
    end;
}