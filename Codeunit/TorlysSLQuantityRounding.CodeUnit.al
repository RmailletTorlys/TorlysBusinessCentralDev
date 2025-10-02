codeunit 50002 "Torlys SL Quantity Rounding"
{
    //Sales Order - start
    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterGetRecordOnValidateUoM', '', false, false)]
    local procedure OnAfterNoOnAfterValidate(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var UoMValid: Boolean)
    begin
        UoMValid := ValidateUoM(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateSOQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnValidateCase', '', false, false)]
    local procedure OnValidateSOCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateSOPallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnValidateSOToShipQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', false, false)]
    local procedure OnValidateSOToShipCase(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', false, false)]
    local procedure OnValidateSOToShipPallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 2);
    end;
    //Sales Order - end

    //Credit Memo - start
    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateCrMemoQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnValidateCase', '', false, false)]
    local procedure OnValidateCrMemoCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateCrMemoPallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive', false, false)]
    local procedure OnValidateCMToReceiveQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Case', false, false)]
    local procedure OnValidateCMToReceiveCase(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Pallet', false, false)]
    local procedure OnValidateCMToReveivePallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 3);
    end;
    //Credit Memo - end  

    //Return Order - start
    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateROQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnValidateCase', '', false, false)]
    local procedure OnValidateROCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidateROPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive', false, false)]
    local procedure OnValidateROToReceiveQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantity(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Case', false, false)]
    local procedure OnValidateROToReceiveCase(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive Pallet', false, false)]
    local procedure OnValidateROToReveivePallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 3);
    end;
    //Return Order - end  

    procedure ValidateUoM(var Rec: Record "Sales Line"): Boolean
    var
        Item: Record Item;
    begin
        if Rec."No." = '' then
            exit(true);

        Item.SetRange("No.", Rec."No.");
        Item.FindFirst();

        //Returns FALSE if InvalidCompareUnitOfMeasure is TRUE
        if QuantityRoundingHelper.InvalidCompareUnitOfMeasure(Item) then exit(false);

        exit(true);
    end;

    procedure OnChangeQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)
    begin

        if Rec.Type <> Rec.Type::Item then
            exit;

        if ValidateUoM(Rec) = false then
            exit;

        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

        case OrderType of
            1: // Quantity
                HandleQuantity(Rec);
            2: // Qty. to Ship
                HandleQtyToShip(Rec);
            3: // Qty. to Receive
                HandleQtyToReceive(Rec);
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)
    begin

        // Get the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

        case OrderType of
            1: // Case Quantity
                HandleQuantityCase(Rec);
            2: // Qty. to Ship Case
                HandleQtyToShipCase(Rec);
            3: // Qty. to Receive Case
                HandleQtyToReceiveCase(Rec);
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

        case OrderType of
            1: // Pallet Quantity
                HandleQuantityPallet(Rec);
            2: // Qty. to Ship Pallet
                HandleQtyToShipPallet(Rec);
            3: // Qty. to Receive Pallet
                HandleQtyToReceivePallet(Rec);
        end;
    end;

    local procedure HandleQuantity(var Rec: Record "Sales Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
        Rec.Quantity := QuantityRoundingHelper.ValidateQty(Rec.Quantity, CaseConst, CaseQuantity);
        Rec."Quantity (Base)" := Rec.Quantity;
        Rec."Outstanding Quantity" := Rec.Quantity;
        Rec."Outstanding Qty. (Base)" := Rec.Quantity;

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

        case Rec."Document Type" of
            Rec."Document Type"::Order:
                UpdateToShip(Rec);
            Rec."Document Type"::"Credit Memo":
                UpdateToReceive(Rec);
            Rec."Document Type"::"Return Order":
                UpdateToReceive(Rec);
        end;
    end;

    local procedure HandleQtyToShip(var Rec: Record "Sales Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", CaseConst);
        Rec."Qty. to Ship" := QuantityRoundingHelper.ValidateQty(Rec."Qty. to Ship", CaseConst, CaseQuantity);
        Rec."Qty. to Ship (Base)" := Rec."Qty. to Ship";

        if Rec."Qty. to Ship" >= PalletConst then
            Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", PalletConst)
        else
            Rec."Qty. to Ship Pallet" := 0;

        RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;

        UpdateToInvoiceSO(Rec);
    end;

    local procedure HandleQtyToReceive(var Rec: Record "Sales Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Return Qty. to Receive", CaseConst);
        Rec."Return Qty. to Receive" := QuantityRoundingHelper.ValidateQty(Rec."Return Qty. to Receive", CaseConst, CaseQuantity);
        Rec."Return Qty. to Receive (Base)" := Rec."Return Qty. to Receive";

        if Rec."Return Qty. to Receive" >= PalletConst then
            Rec."Return Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Return Qty. to Receive", PalletConst)
        else
            Rec."Return Qty. to Receive Pallet" := 0;

        RemainingQuantity := Rec."Return Qty. to Receive" - PalletConst * Rec."Return Qty. to Receive Pallet";

        if RemainingQuantity > 0 then
            Rec."Return Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Return Qty. to Receive Case" := 0;

        UpdateToInvoiceRO(Rec);
    end;

    local procedure HandleQuantityCase(var Rec: Record "Sales Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        Rec."Quantity (Base)" := Rec."Quantity";
        Rec."Outstanding Quantity" := Rec.Quantity;
        Rec."Outstanding Qty. (Base)" := Rec.Quantity;

        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

        case Rec."Document Type" of
            Rec."Document Type"::Order:
                UpdateToShip(Rec);
            Rec."Document Type"::"Credit Memo":
                UpdateToReceive(Rec);
            Rec."Document Type"::"Return Order":
                UpdateToReceive(Rec);
        end;
    end;

    local procedure HandleQtyToShipCase(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
        Rec."Qty. to Ship (Base)" := Rec."Qty. to Ship";

        if Rec."Qty. to Ship" >= PalletConst then
            Rec."Qty. to Ship Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Ship", PalletConst);

        RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;

        UpdateToInvoiceSO(Rec);
    end;

    local procedure HandleQtyToReceiveCase(var Rec: Record "Sales Line")
    begin
        Rec."Return Qty. to Receive" := (CaseConst * Rec."Return Qty. to Receive Case") + (PalletConst * Rec."Return Qty. to Receive Pallet");
        Rec."Return Qty. to Receive (Base)" := Rec."Return Qty. to Receive";

        if Rec."Return Qty. to Receive" >= PalletConst then
            Rec."Return Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Return Qty. to Receive", PalletConst);

        RemainingQuantity := Rec."Return Qty. to Receive" - PalletConst * Rec."Return Qty. to Receive Pallet";

        if RemainingQuantity > 0 then
            Rec."Return Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Return Qty. to Receive Case" := 0;

        UpdateToInvoiceRO(Rec);
    end;

    local procedure HandleQuantityPallet(var Rec: Record "Sales Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        Rec."Quantity (Base)" := Rec.Quantity;
        Rec."Outstanding Quantity" := Rec.Quantity;
        Rec."Outstanding Qty. (Base)" := Rec.Quantity;

        case Rec."Document Type" of
            Rec."Document Type"::Order:
                UpdateToShip(Rec);
            Rec."Document Type"::"Credit Memo":
                UpdateToReceive(Rec);
            Rec."Document Type"::"Return Order":
                UpdateToReceive(Rec);
        end;
    end;

    local procedure HandleQtyToShipPallet(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
        Rec."Qty. to Ship (Base)" := Rec."Qty. to Ship";
        UpdateToInvoiceSO(Rec);
    end;

    local procedure HandleQtyToReceivePallet(var Rec: Record "Sales Line")
    begin
        Rec."Return Qty. to Receive" := (CaseConst * Rec."Return Qty. to Receive Case") + (PalletConst * Rec."Return Qty. to Receive Pallet");
        Rec."Return Qty. to Receive (Base)" := Rec."Return Qty. to Receive";
        UpdateToInvoiceRO(Rec);
    end;

    local procedure UpdateToShip(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Ship (Base)" := Rec.Quantity;
        Rec."Qty. to Ship" := Rec.Quantity;
        Rec."Qty. to Ship Case" := Rec."Quantity Case";
        Rec."Qty. to Ship Pallet" := Rec."Quantity Pallet";
        Rec."Qty. to Invoice" := Rec.Quantity;
        Rec."Qty. to Invoice (Base)" := Rec.Quantity;
    end;

    local procedure UpdateToReceive(var Rec: Record "Sales Line")
    begin
        Rec."Return Qty. to Receive (Base)" := Rec.Quantity;
        Rec."Return Qty. to Receive" := Rec.Quantity;
        Rec."Return Qty. to Receive Case" := Rec."Quantity Case";
        Rec."Return Qty. to Receive Pallet" := Rec."Quantity Pallet";
        Rec."Qty. to Invoice" := Rec.Quantity;
        Rec."Qty. to Invoice (Base)" := Rec.Quantity;
    end;

    local procedure UpdateToInvoiceSO(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Invoice" := Rec."Qty. to Ship";
        Rec."Qty. to Invoice (Base)" := Rec."Qty. to Ship (Base)";
    end;

    local procedure UpdateToInvoiceRO(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Invoice" := Rec."Return Qty. to Receive";
        Rec."Qty. to Invoice (Base)" := Rec."Return Qty. to Receive (Base)";
    end;


    var
        QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;
}