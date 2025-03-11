codeunit 50201 "Torlys TL Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateTOQuantity(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnValidateTOToShipQuantity(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive', false, false)]
    local procedure OnValidateTOToReceiveQuantity(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnValidateTOCase(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', false, false)]
    local procedure OnValidateTOToShipCase(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', false, false)]
    local procedure OnValidateTOToReceiveCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnValidateTOPallet(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', false, false)]
    local procedure OnValidateTOToShipPallet(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', false, false)]
    local procedure OnValidateTOToReceivePallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 3);
    end;


    procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)
    begin
        if QuantityRoundingHelper.Validate(Rec.Quantity, Rec."Item No.") then
            exit;

        // GetQuantityUoM the Case and Pallet quantities per Unit of Measure
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

        case OrderType of
            1: // Quantity
                HandleQuantity(Rec);
            2: // Qty. to Ship (Base)
                HandleQtyToShip(Rec);
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)
    begin
        // GetQuantityUoM the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

        case OrderType of
            1: // Case Quantity
                HandleCaseQuantity(Rec);
            2: // Qty. to Ship Case
                HandleQtyToShipCase(Rec);
            3: // Qty. to Receive Case
                HandleQtyToReceiveCase(Rec);
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)
    begin
        // GetQuantityUoM the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."Item No.", 'PALLET');

        case OrderType of
            1: // Pallet Quantity
                HandlePalletQuantity(Rec);
            2: // Qty. to Ship Pallet
                HandleQtyToShipPallet(Rec);
            3: // Qty. to Receive Pallet
                HandleQtyToReceivePallet(Rec);
        end;
    end;

    local procedure HandleQuantity(var Rec: Record "Transfer Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
        Rec.Quantity := QuantityRoundingHelper.Validate(Rec.Quantity, CaseConst, CaseQuantity);

        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst)
        else
            Rec."Quantity Pallet" := 0;

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;
        UpdateToReceive(Rec);
    end;


    local procedure HandleQtyToShip(var Rec: Record "Transfer Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship (Base)", CaseConst);
        Rec.Quantity := QuantityRoundingHelper.Validate(Rec."Qty. to Ship (Base)", CaseConst, CaseQuantity);

        if Rec."Qty. to Ship (Base)" >= PalletConst then
            Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship (Base)", PalletConst)
        else
            Rec."Quantity Pallet" := 0;

        RemainingQuantity := Rec."Qty. to Ship (Base)" - PalletConst * Rec."Qty. to Ship Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;
    end;

    local procedure HandleCaseQuantity(var Rec: Record "Transfer Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyToShipCase(var Rec: Record "Transfer Line")
    begin
        Rec."Qty. to Ship (Base)" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");

        if Rec.Quantity >= PalletConst then
            Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Qty. to Ship Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;
    end;

    local procedure HandleQtyToReceiveCase(var Rec: Record "Transfer Line")
    begin
        Rec."Qty. to Receive (Base)" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");

        if Rec."Qty. to Receive (Base)" >= PalletConst then
            Rec."Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive (Base)", PalletConst);

        RemainingQuantity := Rec."Qty. to Receive (Base)" - PalletConst * Rec."Qty. to Receive Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;
    end;

    local procedure HandlePalletQuantity(var Rec: Record "Transfer Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyToShipPallet(var Rec: Record "Transfer Line")
    begin
        Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
    end;

    local procedure HandleQtyToReceivePallet(var Rec: Record "Transfer Line")
    begin
        Rec."Qty. to Receive (Base)" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");

    end;

    local procedure UpdateToReceive(var Rec: Record "Transfer Line")
    begin
        Rec."Qty. to Receive (Base)" := Rec.Quantity;
        Rec."Qty. to Receive Case" := Rec."Quantity Case";
        Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet";
    end;

    var
        QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;
}