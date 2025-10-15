codeunit 50001 "Torlys TL Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
    local procedure OnValidateItem(Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; var EditCasePallet: Boolean)
    begin
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateQuantity(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQuantity(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
    local procedure OnValidateQuantityCase(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQuantityCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateQuantityPallet(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQuantityPallet(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnValidateTQtyToShip(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQtyToShip(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', false, false)]
    local procedure OnValidateQtyToShipCase(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQtyToShipCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', false, false)]
    local procedure OnValidateQtyToShipPallet(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQtyToShipPallet(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive', false, false)]
    local procedure OnValidateQtyToReceive(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQtyToReceive(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', false, false)]
    local procedure OnValidateQtyToReceiveCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQtyToReceiveCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', false, false)]
    local procedure OnValidateQtyToReceivePallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQtyToReceivePallet(Rec, xRec);
    end;

    procedure CheckEditCasePallet(var Rec: Record "Transfer Line"): Boolean
    var
        Item: Record Item;
    begin
        if Rec."Item No." = '' then exit(false);
        Item.Get(Rec."Item No.");
        if Item."Compare Unit of Measure" = '' then exit(false);
        exit(true);
    end;

    procedure OnChangeQuantity(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        if Item."Compare Unit of Measure" <> '' then begin
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
            TempQuantity := Rec.Quantity; //store entered quantity in variable
            Rec."Quantity Pallet" := 0; //go back to 0 for when quantity is changed
            if TempQuantity >= QtyPerPallet then begin //check if the entered quantity is more than a full pallet
                while TempQuantity >= QtyPerPallet do begin
                    Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                    TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                end;
            end;
            Rec."Quantity Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
            Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
        CaseQuantity := Rec."Quantity Case" * QtyPerCase; //how many SF make up the case quantity entered
        if CaseQuantity >= QtyPerPallet then begin //check if the entered quantity is more than a full pallet
            while CaseQuantity >= QtyPerPallet do begin
                Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
            end;
        end;
        Rec."Quantity Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
        Rec.VALIDATE(Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
        Rec.VALIDATE(Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
    end;

    procedure OnChangeQtyToShip(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        if Item."Compare Unit of Measure" <> '' then begin
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
            TempQuantity := Rec."Qty. to Ship"; //store entered quantity in variable
            Rec."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
            if TempQuantity >= QtyPerPallet then begin //check if the entered quantity is more than a full pallet
                while TempQuantity >= QtyPerPallet do begin
                    Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                    TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                end;
            end;
            Rec."Qty. to Ship Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
            Rec."Qty. to Ship" := ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure";
            // Rec."Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Qty. to Ship", Rec.FieldCaption(Rec."Qty. to Ship"), Rec.FieldCaption(Rec."Qty. to Ship (Base)"));
            IF (Rec."Qty. to Ship" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Ship") > ABS(Rec."Outstanding Quantity"))
                OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                ERROR('You cannot ship more than %1 units.', Rec."Outstanding Quantity");
        end;
    end;

    procedure OnChangeQtyToShipCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
        CaseQuantity := Rec."Qty. to Ship Case" * QtyPerCase; //how many SF make up the case quantity entered
        if CaseQuantity >= QtyPerPallet then begin  //check if the entered quantity is more than a full pallet
            while CaseQuantity >= QtyPerPallet do begin
                Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
            end;
        end;
        Rec."Qty. to Ship Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
        Rec.VALIDATE("Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
    end;

    procedure OnChangeQtyToShipPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
        Rec.VALIDATE("Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
    end;

    procedure OnChangeQtyToReceive(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        if Item."Compare Unit of Measure" <> '' then begin
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
            TempQuantity := Rec."Qty. to Receive"; //store entered quantity in variable
            Rec."Qty. to Receive Pallet" := 0; //go back to 0 for when quantity is changed
            if TempQuantity >= QtyPerPallet then begin //check if the entered quantity is more than a full pallet
                while TempQuantity >= QtyPerPallet do begin
                    Rec."Qty. to Receive Pallet" := Rec."Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                    TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                end;
            end;
            Rec."Qty. to Receive Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
            Rec."Qty. to Receive" := ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure";
            // Rec."Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Qty. to Receive", Rec.FieldCaption(Rec."Qty. to Receive"), Rec.FieldCaption(Rec."Qty. to Receive (Base)"));
            IF (Rec."Qty. to Receive" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Receive") > ABS(Rec."Outstanding Quantity"))
                OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                ERROR('You cannot receive more than %1 units.', Rec."Outstanding Quantity");
        end;
    end;

    procedure OnChangeQtyToReceiveCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
        CaseQuantity := Rec."Qty. to Receive Case" * QtyPerCase; //how many SF make up the case quantity entered
        if CaseQuantity >= QtyPerPallet then begin  //check if the entered quantity is more than a full pallet
            while CaseQuantity >= QtyPerPallet do begin
                Rec."Qty. to Receive Pallet" := Rec."Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                CaseQuantity := CaseQuantity - QtyPerPallet; //how much left after applying to pallets
            end;
        end;
        Rec."Qty. to Receive Case" := ROUND((CaseQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
        Rec.VALIDATE("Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
    end;

    procedure OnChangeQtyToReceivePallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        Item.GET(Rec."Item No."); //get the item record
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                                                                       // Rec.VALIDATE(Rec."Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
    end;

    var
        Item: Record "Item";
        ItemUOM: Record "Item Unit of Measure";
        QtyPerCase: Integer;
        QtyPerPallet: Integer;
        TempQuantity: Decimal;
        CalculatedCase: Decimal;
        CaseQuantity: Integer;
        UOMMgt: Codeunit "Unit of Measure Management";

    // procedure ValidateUoM(var Rec: Record "Transfer Line"): Boolean
    // var
    //     Item: Record Item;
    // begin
    //     if Rec."Item No." = '' then
    //         exit(true);

    //     Item.SetRange("No.", Rec."Item No.");
    //     Item.FindFirst();

    //     // if QuantityRoundingHelper.InvalidCompareUnitOfMeasure(Item) then exit(false);

    //     exit(true);
    // end;

    // procedure OnChangeQuantity(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)
    // begin

    //     if ValidateUoM(Rec) = false then
    //         exit;

    //     // GetQuantityUoM the Case and Pallet quantities per Unit of Measure
    //     CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
    //     PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

    //     case OrderType of
    //         1: // Quantity
    //             HandleQuantity(Rec);
    //         2: // Qty. to Ship
    //             HandleQtyToShip(Rec);
    //         3: // Qty. to Receive
    //             HandleQtyToShip(Rec);
    //     end;
    // end;

    // procedure OnChangeQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)
    // begin
    //     // GetQuantityUoM the Case and Pallet quantities for the item entered
    //     CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
    //     PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

    //     case OrderType of
    //         1: // Case Quantity
    //             HandleQuantityCase(Rec);
    //         2: // Qty. to Ship Case
    //             HandleQtyToShipCase(Rec);
    //         3: // Qty. to Receive Case
    //             HandleQtyToReceiveCase(Rec);
    //     end;
    // end;

    // procedure OnChangeQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)
    // begin

    //     // GetQuantityUoM the Case and Pallet quantities for the item entered
    //     CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
    //     PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

    //     case OrderType of
    //         1: // Pallet Quantity
    //             HandleQuantityPallet(Rec);
    //         2: // Qty. to Ship Pallet
    //             HandleQtyToShipPallet(Rec);
    //         3: // Qty. to Receive Pallet
    //             HandleQtyToReceivePallet(Rec);
    //     end;
    // end;

    // local procedure HandleQuantity(var Rec: Record "Transfer Line")
    // var
    //     CaseQuantity: Integer;
    // begin
    //     CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
    //     Rec.Quantity := QuantityRoundingHelper.ValidateQty(Rec.Quantity, CaseConst, CaseQuantity);
    //     Rec."Quantity (Base)" := Rec.Quantity;
    //     Rec."Outstanding Quantity" := Rec.Quantity;
    //     Rec."Outstanding Qty. (Base)" := Rec.Quantity;

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
    //     UpdateToShip(Rec);
    //     //UpdateToReceive(Rec);
    // end;

    // local procedure HandleQtyToShip(var Rec: Record "Transfer Line")
    // var
    //     CaseQuantity: Integer;
    // begin
    //     CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", CaseConst);
    //     Rec."Qty. to Ship" := QuantityRoundingHelper.ValidateQty(Rec."Qty. to Ship", CaseConst, CaseQuantity);
    //     Rec."Qty. to Ship (Base)" := Rec."Qty. to Ship";

    //     if Rec."Qty. to Ship" >= PalletConst then
    //         Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", PalletConst)
    //     else
    //         Rec."Qty. to Ship Pallet" := 0;

    //     RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Qty. to Ship Case" := 0;
    // end;

    // local procedure HandleQtyToReceive(var Rec: Record "Transfer Line")
    // var
    //     CaseQuantity: Integer;
    // begin
    //     CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", CaseConst);
    //     Rec."Qty. to Receive" := QuantityRoundingHelper.ValidateQty(Rec."Qty. to Receive", CaseConst, CaseQuantity);
    //     Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";

    //     if Rec."Qty. to Receive" >= PalletConst then
    //         Rec."Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", PalletConst)
    //     else
    //         Rec."Qty. to Receive Pallet" := 0;

    //     RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Qty. to Receive Case" := 0;
    // end;

    // local procedure HandleQuantityCase(var Rec: Record "Transfer Line")
    // begin
    //     Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    //     Rec."Quantity (Base)" := Rec."Quantity";
    //     Rec."Outstanding Quantity" := Rec.Quantity;
    //     Rec."Outstanding Qty. (Base)" := Rec.Quantity;

    //     if Rec.Quantity >= PalletConst then
    //         Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

    //     RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Quantity Case" := 0;
    //     UpdateToShip(Rec);
    //     //UpdateToReceive(Rec);
    // end;

    // local procedure HandleQtyToShipCase(var Rec: Record "Transfer Line")
    // begin
    //     Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
    //     Rec."Qty. to Ship (Base)" := Rec."Qty. to Ship";

    //     if Rec."Qty. to Ship" >= PalletConst then
    //         Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", PalletConst);

    //     RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Qty. to Ship Case" := 0;
    // end;

    // local procedure HandleQtyToReceiveCase(var Rec: Record "Transfer Line")
    // begin
    //     Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
    //     Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";

    //     if Rec."Qty. to Receive" >= PalletConst then
    //         Rec."Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", PalletConst);

    //     RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

    //     if RemainingQuantity > 0 then
    //         Rec."Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //     else
    //         Rec."Qty. to Receive Case" := 0;
    // end;

    // local procedure HandleQuantityPallet(var Rec: Record "Transfer Line")
    // begin
    //     Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    //     Rec."Quantity (Base)" := Rec."Quantity";
    //     Rec."Outstanding Quantity" := Rec.Quantity;
    //     Rec."Outstanding Qty. (Base)" := Rec.Quantity;

    //     UpdateToShip(Rec);
    //     //UpdateToReceive(Rec);
    // end;

    // local procedure HandleQtyToShipPallet(var Rec: Record "Transfer Line")
    // begin
    //     Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
    //     Rec."Qty. to Ship (Base)" := Rec."Qty. to Ship";
    // end;

    // local procedure HandleQtyToReceivePallet(var Rec: Record "Transfer Line")
    // begin
    //     Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
    //     Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";
    // end;

    // local procedure UpdateToShip(var Rec: Record "Transfer Line")
    // begin
    //     Rec."Qty. to Ship" := Rec.Quantity;
    //     Rec."Qty. to Ship (Base)" := Rec.Quantity;
    //     Rec."Qty. to Ship Case" := Rec."Quantity Case";
    //     Rec."Qty. to Ship Pallet" := Rec."Quantity Pallet";
    // end;

    // // local procedure UpdateToReceive(var Rec: Record "Transfer Line")
    // // begin
    // //     Rec."Qty. to Receive" := Rec.Quantity;
    // //     Rec."Qty. to Receive (Base)" := Rec.Quantity;
    // //     Rec."Qty. to Receive Case" := Rec."Quantity Case";
    // //     Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet";
    // // end;

    // var
    //     QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
    //     PalletConst: Decimal;
    //     CaseConst: Decimal;
    //     RemainingQuantity: Decimal;

}