codeunit 50004 "Torlys IJ Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateIJQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnValidateIJCaseQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnValidateIJPalletQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    procedure ValidateUoM(var Rec: Record "Item Journal Line"): Boolean
    var
        Item: Record Item;

    begin

        if Rec."Item No." = '' then
            exit(true);

        Item.SetRange("No.", Rec."Item No.");
        Item.FindFirst();

        //Returns FALSE if InvalidCompareUnitOfMeasure is TRUE
        if QuantityRoundingHelper.InvalidCompareUnitOfMeasure(Item) then exit(false);

        exit(true);
    end;

    procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
    begin

        if ValidateUoM(Rec) = false then
            exit;

        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

        case OrderType of
            1: // Quantity
                HandleQuantity(Rec);
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

        case OrderType of
            1: // Case Quantity
                HandleCaseQuantity(Rec);
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

        case OrderType of
            1: // Pallet Quantity
                HandlePalletQuantity(Rec);
        end;
    end;

    local procedure HandleQuantity(var Rec: Record "Item Journal Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
        Rec.Quantity := QuantityRoundingHelper.ValidateQty(Rec.Quantity, CaseConst, CaseQuantity);
        Rec."Quantity (Base)" := Rec.Quantity;

        if Rec.Quantity = 0 then
            Rec."Quantity Case" := 0;
        Rec."Quantity Pallet" := 0;

        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst)
        else
            Rec."Quantity Pallet" := 0;

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

    end;

    local procedure HandleCaseQuantity(var Rec: Record "Item Journal Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        Rec."Quantity (Base)" := Rec.Quantity;
        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

    end;


    local procedure HandlePalletQuantity(var Rec: Record "Item Journal Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        Rec."Quantity (Base)" := Rec.Quantity;
    end;


    var
        QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;

}