// codeunit 50004 "TorlysQtyRoundingItemJournal"
// {
//     [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
//     local procedure OnValidateItem(Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; var EditCasePallet: Boolean)
//     begin
//         EditCasePallet := CheckEditCasePallet(Rec);
//     end;

//     [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Quantity', false, false)]
//     local procedure OnValidateQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
//     begin
//         OnChangeQuantity(Rec, xRec);
//     end;

//     [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
//     local procedure OnValidateQuantityCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
//     begin
//         OnChangeQuantityCase(Rec, xRec);
//     end;

//     [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
//     local procedure OnValidateQuantityPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
//     begin
//         OnChangeQuantityPallet(Rec, xRec);
//     end;

//     procedure CheckEditCasePallet(var Rec: Record "Item Journal Line"): Boolean
//     begin
//         if Rec."Item No." = '' then exit(false);
//         Item.Get(Rec."Item No.");
//         if Item."Compare Unit of Measure" = '' then exit(false);
//         exit(true);
//     end;

//     procedure OnChangeQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
//     begin
//         Item.GET(Rec."Item No."); //get the item record
//         if Item."Compare Unit of Measure" <> '' then begin
//             QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//             QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
//             TempQuantity := Rec.Quantity; //store entered quantity in variable
//             Rec."Quantity Pallet" := 0; //go back to 0 for when quantity is changed
//             if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
//                 while TempQuantity >= QtyPerPallet do begin
//                     Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//                     TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
//                 end;
//             Rec."Quantity Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
//             Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
//         end;
//     end;

//     procedure OnChangeQuantityCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
//     begin
//         Item.GET(Rec."Item No."); //get the item record
//         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//         CaseQuantity := Rec."Quantity Case" * QtyPerCase; //how many SF make up the case quantity entered
//         if CaseQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
//             while CaseQuantity >= QtyPerPallet do begin
//                 Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
//                 CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
//             end;
//         Rec."Quantity Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
//         Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
//     end;

//     procedure OnChangeQuantityPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
//     begin
//         Item.GET(Rec."Item No."); //get the item record
//         QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
//         QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
//         Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
//     end;

//     var
//         Item: Record "Item";
//         UOMMgt: Codeunit "Unit of Measure Management";
//         QtyPerCase: Decimal;
//         QtyPerPallet: Decimal;
//         TempQuantity: Decimal;
//         CaseQuantity: Decimal;

//     // procedure ValidateUoM(var Rec: Record "Item Journal Line"): Boolean
//     // var
//     //     Item: Record Item;
//     // begin
//     //     if Rec."Item No." = '' then
//     //         exit(true);

//     //     Item.SetRange("No.", Rec."Item No.");
//     //     Item.FindFirst();

//     //     //Returns FALSE if InvalidCompareUnitOfMeasure is TRUE
//     //     if QuantityRoundingHelper.InvalidCompareUnitOfMeasure(Item) then exit(false);
//     //     exit(true);
//     // end;

//     // procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
//     // begin
//     //     // if ValidateUoM(Rec) = false then
//     //     //     exit;

//     //     // Get the Case and Pallet quantities per Unit of Measure
//     //     CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
//     //     PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

//     //     case OrderType of
//     //         1: // Quantity
//     //             HandleQuantity(Rec);
//     //     end;
//     // end;

//     // procedure OnChangeQuantityCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
//     // begin
//     //     // Get the Case and Pallet quantities for the item entered
//     //     CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
//     //     PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

//     //     case OrderType of
//     //         1: // Case Quantity
//     //             HandleCaseQuantity(Rec);
//     //     end;
//     // end;

//     // procedure OnChangeQuantityPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
//     // begin
//     //     // Get the Case and Pallet quantities for the item entered
//     //     CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
//     //     PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

//     //     case OrderType of
//     //         1: // Pallet Quantity
//     //             HandlePalletQuantity(Rec);
//     //     end;
//     // end;

//     // local procedure HandleQuantity(var Rec: Record "Item Journal Line")
//     // var
//     //     CaseQuantity: Integer;
//     // begin
//     //     CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
//     //     Rec.Quantity := QuantityRoundingHelper.ValidateQty(Rec.Quantity, CaseConst, CaseQuantity);
//     //     Rec."Quantity (Base)" := Rec.Quantity;
//     //     Rec."Invoiced Quantity" := Rec.Quantity;
//     //     Rec."Invoiced Qty. (Base)" := Rec.Quantity;

//     //     if Rec.Quantity = 0 then
//     //         Rec."Quantity Case" := 0;
//     //     Rec."Quantity Pallet" := 0;

//     //     if Rec.Quantity >= PalletConst then
//     //         Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst)
//     //     else
//     //         Rec."Quantity Pallet" := 0;

//     //     RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

//     //     if RemainingQuantity > 0 then
//     //         Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
//     //     else
//     //         Rec."Quantity Case" := 0;
//     // end;

//     // local procedure HandleCaseQuantity(var Rec: Record "Item Journal Line")
//     // begin
//     //     Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
//     //     Rec."Quantity (Base)" := Rec.Quantity;
//     //     Rec."Invoiced Quantity" := Rec.Quantity;
//     //     Rec."Invoiced Qty. (Base)" := Rec.Quantity;

//     //     if Rec.Quantity >= PalletConst then
//     //         Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

//     //     RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

//     //     if RemainingQuantity > 0 then
//     //         Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
//     //     else
//     //         Rec."Quantity Case" := 0;
//     // end;


//     // local procedure HandlePalletQuantity(var Rec: Record "Item Journal Line")
//     // begin
//     //     Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
//     //     Rec."Quantity (Base)" := Rec.Quantity;
//     //     Rec."Invoiced Quantity" := Rec.Quantity;
//     //     Rec."Invoiced Qty. (Base)" := Rec.Quantity;
//     // end;


//     // var
//     //     QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
//     //     PalletConst: Decimal;
//     //     CaseConst: Decimal;
//     //     RemainingQuantity: Decimal;

// }