codeunit 50002 "Torlys Qty Rounding Sales Line"
{
    // Sales Order - start
    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
    local procedure OnValidateItemSO(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    begin
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateQuantitySO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
    local procedure OnValidateQuantityCaseSO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateQuantityPalletSO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnValidateQtyToShipSO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQtyToShip(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', false, false)]
    local procedure OnValidateQtyToShipCaseSO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQtyToShipCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', false, false)]
    local procedure OnValidateQtyToShipPalletSO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQtyToShipPallet(Rec, xRec);
    end;
    //Sales Order - end

    // Sales Invoice - start
    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
    local procedure OnValidateItemSI(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    begin
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateQuantitySI(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
    local procedure OnValidateQuantityCaseSI(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateQuantityPalletSI(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec);
    end;
    //Sales Invoice - end    

    //Credit Memo - start
    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
    local procedure OnValidateItemCM(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    begin
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateQuantityCM(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
    local procedure OnValidateQuantityCaseCM(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateQuantityPalletCM(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec);
    end;
    //Credit Memo - end  

    //Return Order - start
    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
    local procedure OnValidateItemRO(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    begin
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateQuantityRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
    local procedure OnValidateQuantityCaseRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateQuantityPalletRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive', false, false)]
    local procedure OnValidateQtyToReceiveRO(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQtyToReceive(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Case', false, false)]
    local procedure OnValidateQtyToReceiveCaseRO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQtyToReceiveCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Pallet', false, false)]
    local procedure OnValidateQtyToReveivePalletRO(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQtyToReceivePallet(Rec, xRec);
    end;
    //Return Order - end  

    procedure CheckEditCasePallet(var Rec: Record "Sales Line"): Boolean
    begin
        if Rec.Type <> Rec.Type::Item then exit(false);
        if Rec."No." = '' then exit(false);
        Item.Get(Rec."No.");
        if Item."Compare Unit of Measure" = '' then exit(false);
        exit(true);
    end;

    procedure OnChangeQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            if Item."Compare Unit of Measure" <> '' then begin
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                TempQuantity := Rec.Quantity; //store entered quantity in variable
                Rec."Quantity Pallet" := 0; //go back to 0 for when quantity is changed
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                Rec."Quantity Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
            end;
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            CaseQuantity := Rec."Quantity Case" * QtyPerCase; //how many SF make up the case quantity entered
            if CaseQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                while CaseQuantity >= QtyPerPallet do begin
                    Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                    CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
                end;
            Rec."Quantity Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
            Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQtyToShip(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item THEN BEGIN //only run check for items
            Item.GET(Rec."No."); //get the item record
            if Item."Compare Unit of Measure" <> '' then begin
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                TempQuantity := Rec."Qty. to Ship"; //store entered quantity in variable
                Rec."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                Rec."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                Rec."Qty. to Ship" := ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure";
                Rec."Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Qty. to Ship", Rec.FieldCaption(Rec."Qty. to Ship"), Rec.FieldCaption(Rec."Qty. to Ship (Base)"));
                Rec.InitQtyToInvoice();
                IF (Rec."Qty. to Ship" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Ship") > ABS(Rec."Outstanding Quantity"))
                    OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                    ERROR('You cannot ship more than %1 units.', Rec."Outstanding Quantity");
            end;
        end;
    end;

    procedure OnChangeQtyToShipCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            CaseQuantity := Rec."Qty. to Ship Case" * QtyPerCase; //how many SF make up the case quantity entered
            if CaseQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                while CaseQuantity >= QtyPerPallet do begin
                    Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                    CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
                end;
            Rec."Qty. to Ship Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
            Rec.VALIDATE(Rec."Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQtyToShipPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            Rec.VALIDATE(Rec."Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQtyToReceive(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item THEN BEGIN //only run check for items
            Item.GET(Rec."No."); //get the item record
            if Item."Compare Unit of Measure" <> '' then begin
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                TempQuantity := Rec."Return Qty. to Receive"; //store entered quantity in variable
                Rec."Return Qty. to Receive Pallet" := 0; //go back to 0 for when quantity is changed
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        Rec."Return Qty. to Receive Pallet" := Rec."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                Rec."Return Qty. to Receive Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                Rec."Return Qty. to Receive" := ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure";
                Rec."Return Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Return Qty. to Receive", Rec.FieldCaption(Rec."Return Qty. to Receive"), Rec.FieldCaption(Rec."Return Qty. to Receive (Base)"));
                Rec.InitQtyToInvoice();
                IF (Rec."Return Qty. to Receive" * Rec.Quantity < 0) OR (ABS(Rec."Return Qty. to Receive") > ABS(Rec."Outstanding Quantity"))
                    OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                    ERROR('You cannot receive more than %1 units.', Rec."Outstanding Quantity");
            end;
        end;
    end;

    procedure OnChangeQtyToReceiveCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            CaseQuantity := Rec."Return Qty. to Receive Case" * QtyPerCase; //how many SF make up the case quantity entered
            if CaseQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                while CaseQuantity >= QtyPerPallet do begin
                    Rec."Return Qty. to Receive Pallet" := Rec."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                    CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
                end;
            Rec."Return Qty. to Receive Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
            Rec.VALIDATE(Rec."Return Qty. to Receive", ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQtyToReceivePallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            Rec.VALIDATE(Rec."Return Qty. to Receive", ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    var
        Item: Record "Item";
        UOMMgt: Codeunit "Unit of Measure Management";
        QtyPerCase: Integer;
        QtyPerPallet: Integer;
        TempQuantity: Decimal;
        CaseQuantity: Integer;



    // procedure OnChangeQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)
    // begin

    //     if Rec.Type <> Rec.Type::Item then
    //         exit;

    //     if ValidateUoM(Rec) = false then
    //         exit;

    //     // Get the Case and Pallet quantities per Unit of Measure
    //     // CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
    //     // PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');
    //     Item.GET(Rec."No.");
    //     QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');
    //     QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET');

    //     // case OrderType of
    //     //     1: // Quantity
    //     //         HandleQuantity(Rec);
    //     //     2: // Qty. to Ship
    //     //         HandleQtyToShip(Rec);
    //     //     3: // Qty. to Receive
    //     //         HandleQtyToReceive(Rec);
    //     // end;
    // end;

    // procedure OnChangeQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)
    // begin
    //     Item.GET(Rec."No."); //get the item record
    //     QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //     QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
    //     CaseQuantity := Rec."Quantity Case" * QtyPerCase; //how many cases make up the quantity entered

    //     IF CaseQuantity >= QtyPerPallet THEN BEGIN
    //         Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1;
    //         CaseQuantity := CaseQuantity - QtyPerPallet;
    //         Rec."Quantity Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>');
    //     END;

    //     Rec.VALIDATE(Quantity, (QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case") / Rec."Qty. per Unit of Measure");
    // end;

    // procedure OnChangeQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)
    // begin
    //     Item.GET(Rec."No."); //get the item record
    //     QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
    //     QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet

    //     Rec.VALIDATE(Quantity, (QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case") / Rec."Qty. per Unit of Measure");
    // end;

    // local procedure HandleQuantity(var Rec: Record "Sales Line")
    // var
    //     CaseQuantity: Integer;
    // begin
    //     CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
    //     Rec.Quantity := QuantityRoundingHelper.ValidateQty(Rec.Quantity, CaseConst, CaseQuantity);
    //     Rec."Quantity (Base)" := Rec.CalcBaseQty(Rec.Quantity, Rec.FieldCaption(Rec.Quantity), Rec.FieldCaption(Rec."Quantity (Base)"));
    //     // Rec."Outstanding Quantity" := Rec.Quantity;
    //     // Rec."Outstanding Qty. (Base)" := Rec.Quantity;
    //     // replace above 2 lines of custom code by calling table procedure
    //     Rec.InitOutstanding();

    //     if Rec.Quantity = 0 then
    //         Rec."Quantity Case" := 0;
    //     Rec."Quantity Pallet" := 0;

    //     if Rec.Quantity >= PalletConst then
    //         Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst)
    //     else
    //         Rec."Quantity Pallet" := 0;

    //     RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Quantity Case" := 0;

    //     case Rec."Document Type" of
    //         Rec."Document Type"::Order:
    //             BEGIN
    //                 // UpdateToShip(Rec);
    //                 HandleQtyToShip(Rec);
    //                 Rec.InitQtyToShip();
    //             END;
    //         Rec."Document Type"::"Credit Memo":
    //             BEGIN
    //                 // UpdateToReceive(Rec);
    //                 HandleQtyToReceive(Rec);
    //                 Rec.InitQtyToReceive();
    //             END;
    //         Rec."Document Type"::"Return Order":
    //             BEGIN
    //                 // UpdateToReceive(Rec);
    //                 HandleQtyToReceive(Rec);
    //                 Rec.InitQtyToReceive();
    //             END;
    //     end;
    // end;

    // local procedure HandleQtyToShip(var Rec: Record "Sales Line")
    // var
    //     CaseQuantity: Integer;
    // begin
    //     CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", CaseConst);
    //     Rec."Qty. to Ship" := QuantityRoundingHelper.ValidateQty(Rec."Qty. to Ship", CaseConst, CaseQuantity);
    //     Rec."Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Qty. to Ship", Rec.FieldCaption(Rec."Qty. to Ship"), Rec.FieldCaption(Rec."Qty. to Ship (Base)"));

    //     if Rec."Qty. to Ship" >= PalletConst then
    //         Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", PalletConst)
    //     else
    //         Rec."Qty. to Ship Pallet" := 0;

    //     RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Qty. to Ship Case" := 0;

    //     // UpdateToInvoiceSO(Rec);
    //     // Rec.InitQtyToShip()
    //     Rec.InitQtyToInvoice();
    // end;

    // local procedure HandleQtyToReceive(var Rec: Record "Sales Line")
    // var
    //     CaseQuantity: Integer;
    // begin
    //     CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Return Qty. to Receive", CaseConst);
    //     Rec."Return Qty. to Receive" := QuantityRoundingHelper.ValidateQty(Rec."Return Qty. to Receive", CaseConst, CaseQuantity);
    //     Rec."Return Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Return Qty. to Receive", Rec.FieldCaption(Rec."Return Qty. to Receive"), Rec.FieldCaption(Rec."Return Qty. to Receive (Base)"));

    //     if Rec."Return Qty. to Receive" >= PalletConst then
    //         Rec."Return Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Return Qty. to Receive", PalletConst)
    //     else
    //         Rec."Return Qty. to Receive Pallet" := 0;

    //     RemainingQuantity := Rec."Return Qty. to Receive" - PalletConst * Rec."Return Qty. to Receive Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Return Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Return Qty. to Receive Case" := 0;

    //     // UpdateToInvoiceRO(Rec);
    //     Rec.InitQtyToInvoice();
    // end;

    // local procedure HandleQuantityCase(var Rec: Record "Sales Line")
    // begin
    //     // Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    //     // Rec."Quantity (Base)" := Rec.CalcBaseQty(Rec.Quantity, Rec.FieldCaption(Rec.Quantity), Rec.FieldCaption(Rec."Quantity (Base)"));
    //     // Rec."Outstanding Quantity" := Rec.Quantity;
    //     // Rec."Outstanding Qty. (Base)" := Rec.Quantity;
    //     // replace above 2 lines of custom code by calling table procedure
    //     // Rec.InitOutstanding();

    //     if Rec."Quantity Case" * CaseConst >= PalletConst then
    //         Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

    //     RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Quantity Case" := 0;

    //     Rec.Validate(Rec.Quantity, (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet"));

    //     // case Rec."Document Type" of
    //     //     Rec."Document Type"::Order:
    //     //         BEGIN
    //     //             // UpdateToShip(Rec);
    //     //             HandleQtyToShip(Rec);
    //     //             Rec.InitQtyToShip();
    //     //         END;
    //     //     Rec."Document Type"::"Credit Memo":
    //     //         BEGIN
    //     //             // UpdateToReceive(Rec);
    //     //             HandleQtyToReceiveCase(Rec);
    //     //             Rec.InitQtyToReceive();
    //     //         END;
    //     //     Rec."Document Type"::"Return Order":
    //     //         BEGIN
    //     //             // UpdateToReceive(Rec);
    //     //             HandleQtyToReceiveCase(Rec);
    //     //             Rec.InitQtyToReceive();
    //     //         END;
    //     // end;
    // end;

    // local procedure HandleQtyToShipCase(var Rec: Record "Sales Line")
    // begin
    //     Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
    //     Rec."Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Qty. to Ship", Rec.FieldCaption(Rec."Qty. to Ship"), Rec.FieldCaption(Rec."Qty. to Ship (Base)"));

    //     if Rec."Qty. to Ship" >= PalletConst then
    //         Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", PalletConst);

    //     RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Qty. to Ship Case" := 0;

    //     // UpdateToInvoiceSO(Rec);
    //     Rec.InitQtyToInvoice();
    // end;

    // local procedure HandleQtyToReceiveCase(var Rec: Record "Sales Line")
    // begin
    //     Rec."Return Qty. to Receive" := (CaseConst * Rec."Return Qty. to Receive Case") + (PalletConst * Rec."Return Qty. to Receive Pallet");
    //     Rec."Return Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Return Qty. to Receive", Rec.FieldCaption(Rec."Return Qty. to Receive"), Rec.FieldCaption(Rec."Return Qty. to Receive (Base)"));

    //     if Rec."Return Qty. to Receive" >= PalletConst then
    //         Rec."Return Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Return Qty. to Receive", PalletConst);

    //     RemainingQuantity := Rec."Return Qty. to Receive" - PalletConst * Rec."Return Qty. to Receive Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Return Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Return Qty. to Receive Case" := 0;

    //     // UpdateToInvoiceRO(Rec);
    //     Rec.InitQtyToInvoice();
    // end;

    // local procedure HandleQuantityPallet(var Rec: Record "Sales Line")
    // begin
    //     Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    //     Rec."Quantity (Base)" := Rec.CalcBaseQty(Rec."Quantity", Rec.FieldCaption(Rec."Quantity"), Rec.FieldCaption(Rec."Quantity (Base)"));
    //     // Rec."Outstanding Quantity" := Rec.Quantity;
    //     // Rec."Outstanding Qty. (Base)" := Rec.Quantity;
    //     // replace above 2 lines of custom code by calling table procedure
    //     Rec.InitOutstanding();

    //     case Rec."Document Type" of
    //         Rec."Document Type"::Order:
    //             BEGIN
    //                 // UpdateToShip(Rec);
    //                 HandleQtyToShipPallet(Rec);
    //                 Rec.InitQtyToShip();
    //             END;
    //         Rec."Document Type"::"Credit Memo":
    //             BEGIN
    //                 // UpdateToReceive(Rec);
    //                 HandleQtyToReceivePallet(Rec);
    //                 Rec.InitQtyToReceive();
    //             END;
    //         Rec."Document Type"::"Return Order":
    //             BEGIN
    //                 // UpdateToReceive(Rec);
    //                 HandleQtyToReceivePallet(Rec);
    //                 Rec.InitQtyToReceive();
    //             END;
    //     end;
    // end;

    // local procedure HandleQtyToShipPallet(var Rec: Record "Sales Line")
    // begin
    //     Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
    //     Rec."Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Qty. to Ship", Rec.FieldCaption(Rec."Qty. to Ship"), Rec.FieldCaption(Rec."Qty. to Ship (Base)"));
    //     // UpdateToInvoiceSO(Rec);
    //     Rec.InitQtyToInvoice();
    // end;

    // local procedure HandleQtyToReceivePallet(var Rec: Record "Sales Line")
    // begin
    //     Rec."Return Qty. to Receive" := (CaseConst * Rec."Return Qty. to Receive Case") + (PalletConst * Rec."Return Qty. to Receive Pallet");
    //     Rec."Return Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Return Qty. to Receive", Rec.FieldCaption(Rec."Return Qty. to Receive"), Rec.FieldCaption(Rec."Return Qty. to Receive (Base)"));
    //     // UpdateToInvoiceRO(Rec);
    //     Rec.InitQtyToInvoice();
    // end;

    // local procedure UpdateToShip(var Rec: Record "Sales Line")
    // begin
    //     // Rec."Qty. to Ship" := Rec.Quantity;
    //     // Rec."Qty. to Ship (Base)" := Rec."Quantity";
    //     // Rec."Qty. to Ship Case" := Rec."Quantity Case";
    //     // Rec."Qty. to Ship Pallet" := Rec."Quantity Pallet";
    //     // Rec."Qty. to Invoice" := Rec.Quantity;
    //     // Rec."Qty. to Invoice (Base)" := Rec.Quantity;
    //     // replace above 6 lines of custom code by calling table procedure
    //     Rec.InitQtyToShip();
    // end;

    // local procedure UpdateToReceive(var Rec: Record "Sales Line")
    // begin
    //     // Rec."Return Qty. to Receive" := Rec.Quantity;
    //     // Rec."Return Qty. to Receive (Base)" := Rec."Quantity";
    //     // Rec."Return Qty. to Receive Case" := Rec."Quantity Case";
    //     // Rec."Return Qty. to Receive Pallet" := Rec."Quantity Pallet";
    //     // Rec."Qty. to Invoice" := Rec.Quantity;
    //     // Rec."Qty. to Invoice (Base)" := Rec.Quantity;
    //     // replace above 6 lines of custom code by calling table procedure
    //     Rec.InitQtyToReceive();
    // end;

    // local procedure UpdateToInvoiceSO(var Rec: Record "Sales Line")
    // begin
    //     // Rec."Qty. to Invoice" := Rec."Qty. to Ship";
    //     // Rec."Qty. to Invoice (Base)" := Rec."Qty. to Ship";
    //     // replace above 2 lines of custom code by calling table procedure
    //     Rec.InitQtyToInvoice();
    // end;

    // local procedure UpdateToInvoiceRO(var Rec: Record "Sales Line")
    // begin
    //     // Rec."Qty. to Invoice" := Rec."Return Qty. to Receive";
    //     // Rec."Qty. to Invoice (Base)" := Rec."Return Qty. to Receive";
    //     // replace above 2 lines of custom code by calling table procedure
    //     Rec.InitQtyToInvoice();
    // end;

    // var
    // InitQtyToShip: Codeunit "TorlysInitQtyToShip";
    // QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
    // PalletConst: Decimal;
    // CaseConst: Decimal;
    // RemainingQuantity: Decimal;
}