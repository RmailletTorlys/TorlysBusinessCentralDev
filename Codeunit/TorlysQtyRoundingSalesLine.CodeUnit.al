// codeunit 50002 "TorlysQtyRoundingSalesLine"
// {
//     // Sales Order - start
//     // [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
//     // local procedure OnValidateItemSO(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
//     // begin
//     //     EditCasePallet := CheckEditCasePallet(Rec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
//     // local procedure OnValidateQuantitySO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantity(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
//     // local procedure OnValidateQuantityCaseSO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityCase(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
//     // local procedure OnValidateQuantityPalletSO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityPallet(Rec, xRec);
//     // end;

//     [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
//     local procedure OnValidateQtyToShipSO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     begin
//         OnChangeQtyToShip(Rec, xRec);
//     end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', false, false)]
//     // local procedure OnValidateQtyToShipCaseSO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQtyToShipCase(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', false, false)]
//     // local procedure OnValidateQtyToShipPalletSO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQtyToShipPallet(Rec, xRec);
//     // end;
//     // Sales Order - end

//     // View and Fill Linked SO - start
//     [EventSubscriber(ObjectType::Page, Page::TorlysJoinedSOtoTO, 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
//     local procedure OnValidateQtyToShipSOtoTO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     begin
//         OnChangeQtyToShip(Rec, xRec);
//     end;
//     // View and Fill Linked SO - end

//     // Sales Invoice - start
//     // [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
//     // local procedure OnValidateItemSI(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
//     // begin
//     //     EditCasePallet := CheckEditCasePallet(Rec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
//     // local procedure OnValidateQuantitySI(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantity(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
//     // local procedure OnValidateQuantityCaseSI(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityCase(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
//     // local procedure OnValidateQuantityPalletSI(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityPallet(Rec, xRec);
//     // end;
//     // Sales Invoice - end    

//     // Credit Memo - start
//     // [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
//     // local procedure OnValidateItemCM(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
//     // begin
//     //     EditCasePallet := CheckEditCasePallet(Rec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
//     // local procedure OnValidateQuantityCM(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantity(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
//     // local procedure OnValidateQuantityCaseCM(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityCase(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
//     // local procedure OnValidateQuantityPalletCM(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityPallet(Rec, xRec);
//     // end;
//     // // Credit Memo - end  

//     // Return Order - start
//     // [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
//     // local procedure OnValidateItemRO(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
//     // begin
//     //     EditCasePallet := CheckEditCasePallet(Rec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
//     // local procedure OnValidateQuantityRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantity(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
//     // local procedure OnValidateQuantityCaseRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityCase(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
//     // local procedure OnValidateQuantityPalletRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQuantityPallet(Rec, xRec);
//     // end;

//     [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive', false, false)]
//     local procedure OnValidateQtyToReceiveRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     begin
//         OnChangeQtyToReceive(Rec, xRec);
//     end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Case', false, false)]
//     // local procedure OnValidateQtyToReceiveCaseRO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQtyToReceiveCase(Rec, xRec);
//     // end;

//     // [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Pallet', false, false)]
//     // local procedure OnValidateQtyToReveivePalletRO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
//     // begin
//     //     OnChangeQtyToReceivePallet(Rec, xRec);
//     // end;
//     // Return Order - end  

//     // procedure CheckEditCasePallet(var Rec: Record "Sales Line"): Boolean
//     // begin
//     //     if Rec.Type <> Rec.Type::Item then exit(false);
//     //     if Rec."No." = '' then exit(false);
//     //     Item.Get(Rec."No.");
//     //     if Item."Compare Unit of Measure" = '' then exit(false);
//     //     exit(true);
//     // end;

//     // procedure OnChangeQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item then begin //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         if Item."Compare Unit of Measure" <> '' then begin
//     //             QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //             QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
//     //             TempQuantity := Rec.Quantity; //store entered quantity in variable
//     //             Rec."Quantity Pallet" := 0; //go back to 0 for when quantity is changed
//     //             if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
//     //                 while TempQuantity >= QtyPerPallet do begin
//     //                     Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//     //                     TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
//     //                 end;
//     //             Rec."Quantity Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
//     //             Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
//     //         end;
//     //     end;
//     // end;

//     // procedure OnChangeQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item then begin //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//     //         CaseQuantity := Rec."Quantity Case" * QtyPerCase; //how many SF make up the case quantity entered
//     //         if CaseQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
//     //             while CaseQuantity >= QtyPerPallet do begin
//     //                 Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//     //                 CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
//     //             end;
//     //         Rec."Quantity Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
//     //         Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
//     //     end;
//     // end;

//     // procedure OnChangeQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item then begin //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//     //         Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
//     //     end;
//     // end;

//     // procedure OnChangeQtyToShip(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item THEN BEGIN //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         if Item."Compare Unit of Measure" <> '' then begin
//     //             QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //             QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
//     //             TempQuantity := Rec."Qty. to Ship"; //store entered quantity in variable
//     //             Rec."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
//     //             if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
//     //                 while TempQuantity >= QtyPerPallet do begin
//     //                     Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//     //                     TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
//     //                 end;
//     //             Rec."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
//     //             Rec."Qty. to Ship" := ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure";
//     //             Rec."Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Qty. to Ship", Rec.FieldCaption(Rec."Qty. to Ship"), Rec.FieldCaption(Rec."Qty. to Ship (Base)"));
//     //             Rec.InitQtyToInvoice();
//     //             IF (Rec."Qty. to Ship" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Ship") > ABS(Rec."Outstanding Quantity"))
//     //                 OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
//     //                 ERROR('You cannot ship more than %1 units.', Rec."Outstanding Quantity");
//     //         end;
//     //     end;
//     // end;

//     // procedure OnChangeQtyToShipCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item then begin //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//     //         CaseQuantity := Rec."Qty. to Ship Case" * QtyPerCase; //how many SF make up the case quantity entered
//     //         if CaseQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
//     //             while CaseQuantity >= QtyPerPallet do begin
//     //                 Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//     //                 CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
//     //             end;
//     //         Rec."Qty. to Ship Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
//     //         Rec.VALIDATE(Rec."Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
//     //     end;
//     // end;

//     // procedure OnChangeQtyToShipPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item then begin //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//     //         Rec.VALIDATE(Rec."Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
//     //     end;
//     // end;

//     // procedure OnChangeQtyToReceive(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item THEN BEGIN //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         if Item."Compare Unit of Measure" <> '' then begin
//     //             QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //             QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
//     //             TempQuantity := Rec."Return Qty. to Receive"; //store entered quantity in variable
//     //             Rec."Return Qty. to Receive Pallet" := 0; //go back to 0 for when quantity is changed
//     //             if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
//     //                 while TempQuantity >= QtyPerPallet do begin
//     //                     Rec."Return Qty. to Receive Pallet" := Rec."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//     //                     TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
//     //                 end;
//     //             Rec."Return Qty. to Receive Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
//     //             Rec."Return Qty. to Receive" := ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure";
//     //             Rec."Return Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Return Qty. to Receive", Rec.FieldCaption(Rec."Return Qty. to Receive"), Rec.FieldCaption(Rec."Return Qty. to Receive (Base)"));
//     //             Rec.InitQtyToInvoice();
//     //             IF (Rec."Return Qty. to Receive" * Rec.Quantity < 0) OR (ABS(Rec."Return Qty. to Receive") > ABS(Rec."Outstanding Quantity"))
//     //                 OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
//     //                 ERROR('You cannot receive more than %1 units.', Rec."Outstanding Quantity");
//     //         end;
//     //     end;
//     // end;

//     // procedure OnChangeQtyToReceiveCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item then begin //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//     //         CaseQuantity := Rec."Return Qty. to Receive Case" * QtyPerCase; //how many SF make up the case quantity entered
//     //         if CaseQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
//     //             while CaseQuantity >= QtyPerPallet do begin
//     //                 Rec."Return Qty. to Receive Pallet" := Rec."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//     //                 CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
//     //             end;
//     //         Rec."Return Qty. to Receive Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
//     //         Rec.VALIDATE(Rec."Return Qty. to Receive", ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
//     //     end;
//     // end;

//     // procedure OnChangeQtyToReceivePallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     // begin
//     //     if Rec.Type = Rec.Type::Item then begin //only run check for items
//     //         Item.GET(Rec."No."); //get the item record
//     //         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//     //         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//     //         Rec.VALIDATE(Rec."Return Qty. to Receive", ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
//     //     end;
//     // end;

//     var
//         Item: Record "Item";
//         UOMMgt: Codeunit "Unit of Measure Management";
//         QtyPerCase: Decimal;
//         QtyPerPallet: Decimal;
//         TempQuantity: Decimal;
//         CaseQuantity: Decimal;
// }