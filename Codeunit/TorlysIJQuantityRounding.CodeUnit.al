codeunit 50204 "Torlys IJ Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateIJQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnValidateIJCaseQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Journal", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnValidateIJPalletQuantity(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
    begin
        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."No.") then
            exit;

        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        case OrderType of
            1: // Quantity
                HandleQuantity(Rec);
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        case OrderType of
            1: // Case Quantity
                HandleCaseQuantity(Rec);
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        case OrderType of
            1: // Pallet Quantity
                HandlePalletQuantity(Rec);
        end;
    end;

    local procedure HandleQuantity(var Rec: Record "Item Journal Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QtyOfUoM.Quantity(Rec.Quantity, CaseConst);
        Rec.Quantity := QtyFits.Validate(Rec.Quantity, CaseConst, CaseQuantity);

        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst)
        else
            Rec."Quantity Pallet" := 0;

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

    end;

    local procedure HandleCaseQuantity(var Rec: Record "Item Journal Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

    end;


    local procedure HandlePalletQuantity(var Rec: Record "Item Journal Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    end;


    var
        GetUoMQuantity: Codeunit GetUnitOfMeasureQuantity;
        CheckQtyAndCuom: Codeunit CheckQtyAndCompareUoM;
        QtyOfUoM: Codeunit QtyOfUnitOfMeasure;
        QtyFits: Codeunit QuantityFitsInCase;
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;

}