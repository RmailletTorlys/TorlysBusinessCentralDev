codeunit 50203 "Torlys PO Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidatePOQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive', false, false)]
    local procedure OnValidatePOToReceiveQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity Received', false, false)]
    local procedure OnValidatePOReceivedQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnValidatePOCaseQuantity(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', false, false)]
    local procedure OnValidatePOToReceiveCase(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. Received Case', false, false)]
    local procedure OnValidatePOReceivedCase(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnValidatePOPallet(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', false, false)]
    local procedure OnValidatePOToReceivePallet(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. Received Pallet', false, false)]
    local procedure OnValidatePOReceivedPallet(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 3);
    end;

    procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    begin
        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."No.") then
            exit;

        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        case OrderType of
            1: // Quantity
                HandleQuantity(Rec);
            2: // Qty. to Ship (Base)
                HandleQtyToReceive(Rec);
            3: // Qty. Received (Base)
                HandleQtyReceived(Rec);
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        case OrderType of
            1: // Case Quantity
                HandleCaseQuantity(Rec);
            2: // Qty. to Ship Case
                HandleQtyToReceiveCase(Rec);
            3: // Qty. to Receive Case
                HandleQtyReceivedCase(Rec);
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        case OrderType of
            1: // Pallet Quantity
                HandlePalletQuantity(Rec);
            2: // Qty. to Ship Pallet
                HandleQtyToReceivePallet(Rec);
            3: // Qty. to Receive Pallet
                HandleQtyReceivedPallet(Rec);
        end;
    end;

    local procedure HandleQuantity(var Rec: Record "Purchase Line")
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

        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyToReceive(var Rec: Record "Purchase Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QtyOfUoM.Quantity(Rec."Qty. to Receive", CaseConst);
        Rec."Qty. to Receive" := QtyFits.Validate(Rec."Qty. to Receive", CaseConst, CaseQuantity);

        if Rec."Qty. to Receive" >= PalletConst then
            Rec."Qty. to Receive Pallet" := QtyOfUoM.Quantity(Rec."Qty. to Receive", PalletConst)
        else
            Rec."Qty. to Receive Pallet" := 0;

        RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";
        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;
    end;

    local procedure HandleQtyReceived(var Rec: Record "Purchase Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QtyOfUoM.Quantity(Rec."Quantity Received", CaseConst);
        Rec."Quantity Received" := QtyFits.Validate(Rec."Quantity Received", CaseConst, CaseQuantity);

        if Rec."Quantity Received" >= PalletConst then
            Rec."Qty. Received Pallet" := QtyOfUoM.Quantity(Rec."Quantity Received", PalletConst)
        else
            Rec."Qty. Received Pallet" := 0;

        RemainingQuantity := Rec."Quantity Received" - PalletConst * Rec."Qty. Received Pallet";
        if RemainingQuantity > 0 then
            Rec."Qty. Received Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. Received Case" := 0;
    end;

    local procedure HandleCaseQuantity(var Rec: Record "Purchase Line")
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

    local procedure HandleQtyToReceiveCase(var Rec: Record "Purchase Line")
    begin
        Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");

        if Rec.Quantity >= PalletConst then
            Rec."Qty. to Receive Pallet" := QtyOfUoM.Quantity(Rec."Qty. to Receive", PalletConst);

        RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;

        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyReceivedCase(var Rec: Record "Purchase Line")
    begin
        Rec."Quantity Received" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");

        if Rec."Quantity Received" >= PalletConst then
            Rec."Qty. to Receive Pallet" := QtyOfUoM.Quantity(Rec."Quantity Received", PalletConst);

        RemainingQuantity := Rec."Quantity Received" - PalletConst * Rec."Qty. to Receive Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;

    end;

    local procedure HandlePalletQuantity(var Rec: Record "Purchase Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyToReceivePallet(var Rec: Record "Purchase Line")
    begin
        Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet")
    end;

    local procedure HandleQtyReceivedPallet(var Rec: Record "Purchase Line")
    begin
        Rec."Quantity Received" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
    end;

    local procedure UpdateToReceive(var Rec: Record "Purchase Line")
    begin
        Rec."Qty. to Receive" := Rec.Quantity;
        Rec."Qty. to Receive Case" := Rec."Quantity Case";
        Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet";
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