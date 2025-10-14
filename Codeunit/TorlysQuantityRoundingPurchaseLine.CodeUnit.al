codeunit 50003 "Torlys PO Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnAfterGetRecordCheckEditCasePallet', '', false, false)]
    local procedure OnValidateItemPO(Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; var EditCasePallet: Boolean)
    begin
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateQuantityPO(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        OnChangeQuantity(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
    local procedure OnValidateQuantityCasePO(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateQuantityPalletPO(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityPallet(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive', false, false)]
    local procedure OnValidateQtyToReceivePO(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        OnChangeQtyToReceive(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', false, false)]
    local procedure OnValidateQtyToReceiveCasePO(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQtyToReceiveCase(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', false, false)]
    local procedure OnValidateQtyToReceivePalletPO(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQtyToReceivePallet(Rec, xRec);
    end;

    procedure CheckEditCasePallet(var Rec: Record "Purchase Line"): Boolean
    var
        Item: Record Item;
    begin
        if Rec.Type <> Rec.Type::Item then exit(false);
        if Rec."No." = '' then exit(false);
        Item.Get(Rec."No.");
        if Item."Compare Unit of Measure" = '' then exit(false);
        exit(true);
    end;

    procedure OnChangeQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
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
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
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
            Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQtyToReceive(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        if Rec.Type = Rec.Type::Item THEN BEGIN //only run check for items
            Item.GET(Rec."No."); //get the item record
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
                Rec."Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Qty. to Receive", Rec.FieldCaption(Rec."Qty. to Receive"), Rec.FieldCaption(Rec."Qty. to Receive (Base)"));
                Rec.InitQtyToInvoice();
                IF (Rec."Qty. to Receive" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Receive") > ABS(Rec."Outstanding Quantity"))
                    OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                    ERROR('You cannot receive more than %1 units.', Rec."Outstanding Quantity");
            end;
        end;
    end;

    procedure OnChangeQtyToReceiveCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
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
            Rec.VALIDATE(Rec."Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
        end;
    end;

    procedure OnChangeQtyToReceivePallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        if Rec.Type = Rec.Type::Item then begin //only run check for items
            Item.GET(Rec."No."); //get the item record
            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
            Rec.VALIDATE(Rec."Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
        end;
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

    // procedure ValidateUoM(var Rec: Record "Purchase Line"): Boolean
    // var
    //     Item: Record Item;
    // begin
    //     if Rec."No." = '' then
    //         exit(true);

    //     Item.SetRange("No.", Rec."No.");
    //     Item.FindFirst();

    //     //Returns FALSE if InvalidCompareUnitOfMeasure is TRUE
    //     if QuantityRoundingHelper.InvalidCompareUnitOfMeasure(Item) then exit(false);
    //     exit(true);
    // end;

    //     procedure OnChangeQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    //     begin
    //         if Rec.Type <> Rec.Type::Item then
    //             exit;

    //         // if ValidateUoM(Rec) = false then
    //         //     exit;

    //         // Get the Case and Pallet quantities per Unit of Measure
    //         CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
    //         PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

    //         case OrderType of
    //             1: // Quantity
    //                 HandleQuantity(Rec);
    //             2: // Qty. to Receive
    //                 HandleQtyToReceive(Rec);
    //         end;
    //     end;

    //     procedure OnChangeQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    //     begin
    //         // Get the Case and Pallet quantities for the item entered
    //         CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
    //         PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

    //         case OrderType of
    //             1: // Quantity Case
    //                 HandleQuantityCase(Rec);
    //             2: // Qty. to Receive Case
    //                 HandleQtyToReceiveCase(Rec);
    //         end;
    //     end;

    //     procedure OnChangeQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    //     begin
    //         // Get the Case and Pallet quantities for the item entered
    //         CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
    //         PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

    //         case OrderType of
    //             1: // Quantity Pallet
    //                 HandleQuantityPallet(Rec);
    //             2: // Qty. to Receive Pallet
    //                 HandleQtyToReceivePallet(Rec);
    //         end;
    //     end;

    //     local procedure HandleQuantity(var Rec: Record "Purchase Line")
    //     var
    //         CaseQuantity: Integer;
    //     begin
    //         CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
    //         Rec.Quantity := QuantityRoundingHelper.ValidateQty(Rec.Quantity, CaseConst, CaseQuantity);
    //         Rec."Quantity (Base)" := Rec.Quantity;
    //         Rec."Outstanding Quantity" := Rec.Quantity;
    //         Rec."Outstanding Qty. (Base)" := Rec."Quantity (Base)";

    //         if Rec.Quantity = 0 then
    //             Rec."Quantity Case" := 0;
    //         Rec."Quantity Pallet" := 0;

    //         if Rec.Quantity >= PalletConst then
    //             Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst)
    //         else
    //             Rec."Quantity Pallet" := 0;

    //         RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

    //         if RemainingQuantity > 0 then
    //             Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //         else
    //             Rec."Quantity Case" := 0;

    //         UpdateToReceive(Rec);
    //     end;

    //     local procedure HandleQtyToReceive(var Rec: Record "Purchase Line")
    //     var
    //         CaseQuantity: Integer;
    //     begin
    //         CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", CaseConst);
    //         Rec."Qty. to Receive" := QuantityRoundingHelper.ValidateQty(Rec."Qty. to Receive", CaseConst, CaseQuantity);
    //         Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";

    //         if Rec."Qty. to Receive" >= PalletConst then
    //             Rec."Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", PalletConst)
    //         else
    //             Rec."Qty. to Receive Pallet" := 0;

    //         RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";
    //         if RemainingQuantity > 0 then
    //             Rec."Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //         else
    //             Rec."Qty. to Receive Case" := 0;

    //         UpdateToInvoice(Rec);
    //     end;

    //     local procedure HandleQuantityCase(var Rec: Record "Purchase Line")
    //     begin
    //         Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    //         Rec."Quantity (Base)" := Rec.Quantity;
    //         Rec."Outstanding Quantity" := Rec.Quantity;
    //         Rec."Outstanding Qty. (Base)" := Rec."Quantity (Base)";

    //         if Rec.Quantity >= PalletConst then
    //             Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

    //         RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

    //         if RemainingQuantity > 0 then
    //             Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //         else
    //             Rec."Quantity Case" := 0;
    //         UpdateToReceive(Rec);
    //     end;

    //     local procedure HandleQtyToReceiveCase(var Rec: Record "Purchase Line")
    //     begin
    //         Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
    //         Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";

    //         if Rec.Quantity >= PalletConst then
    //             Rec."Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", PalletConst);

    //         RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

    //         if RemainingQuantity > 0 then
    //             Rec."Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
    //         else
    //             Rec."Qty. to Receive Case" := 0;

    //         UpdateToReceive(Rec);
    //         UpdateToInvoice(Rec);
    //     end;

    //     local procedure HandleQuantityPallet(var Rec: Record "Purchase Line")
    //     begin
    //         Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    //         Rec."Quantity (Base)" := Rec."Quantity";
    //         Rec."Outstanding Quantity" := Rec.Quantity;
    //         Rec."Outstanding Qty. (Base)" := Rec."Quantity (Base)";
    //         UpdateToReceive(Rec);
    //     end;

    //     local procedure HandleQtyToReceivePallet(var Rec: Record "Purchase Line")
    //     begin
    //         Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
    //         Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";
    //         UpdateToReceive(Rec);
    //         UpdateToInvoice(Rec);
    //     end;

    //     local procedure UpdateToReceive(var Rec: Record "Purchase Line")
    //     var
    //         PurchSetup: Record "Purchases & Payables Setup";
    //     begin
    //         PurchSetup.Get();

    //         if (PurchSetup."Default Qty. to Receive" = PurchSetup."Default Qty. to Receive"::Remainder) or
    //         (Rec."Document Type" = Rec."Document Type"::Invoice) then begin
    //             Rec."Qty. to Receive" := Rec.Quantity;
    //             Rec."Qty. to Receive (Base)" := Rec."Quantity";
    //             Rec."Qty. to Receive Case" := Rec."Quantity Case";
    //             Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet";
    //             Rec."Qty. to Invoice" := Rec."Quantity";
    //             Rec."Qty. to Invoice (Base)" := Rec."Quantity (Base)";
    //         end else
    //             // if Rec."Qty. to Receive" <> 0 then begin
    //             //     Rec."Qty. to Receive (Base)" := MaxQtyToReceiveBase(Rec, Rec."Qty. to Receive (Base)");
    //             //     HandleQtyToReceive(Rec);
    //             // end;
    //             Rec."Qty. to Receive" := 0;
    //         Rec."Qty. to Receive (Base)" := 0;
    //         Rec."Qty. to Receive Case" := 0;
    //         Rec."Qty. to Receive Pallet" := 0;
    //         Rec."Qty. to Invoice" := 0;
    //         Rec."Qty. to Invoice (Base)" := 0;
    //     end;

    //     local procedure UpdateToInvoice(var Rec: Record "Purchase Line")
    //     begin
    //         Rec."Qty. to Invoice" := Rec."Qty. to Receive";
    //         Rec."Qty. to Invoice (Base)" := Rec."Qty. to Receive (Base)";
    //     end;

    //     procedure MaxQtyToReceiveBase(Rec: Record "Purchase Line"; QtyToReceiveBase: Decimal): Decimal
    //     begin
    //         if Abs(QtyToReceiveBase) > Abs(Rec."Outstanding Qty. (Base)") then
    //             exit(Rec."Outstanding Qty. (Base)");
    //         exit(QtyToReceiveBase);
    //     end;

    //     var
    //         QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
    //         PalletConst: Decimal;
    //         CaseConst: Decimal;
    //         RemainingQuantity: Decimal;
}