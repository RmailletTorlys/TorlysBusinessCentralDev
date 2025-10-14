codeunit 50003 "Torlys PO Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidatePOQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        OnChangeQuantity(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive', false, false)]
    local procedure OnValidatePOToReceiveQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
        OnChangeQuantity(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity Case', false, false)]
    local procedure OnValidatePOCaseQuantity(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', false, false)]
    local procedure OnValidatePOToReceiveCase(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity Pallet', false, false)]
    local procedure OnValidatePOPallet(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', false, false)]
    local procedure OnValidatePOToReceivePallet(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 2);
    end;

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

    procedure OnChangeQuantity(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        // if ValidateUoM(Rec) = false then
        //     exit;

        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

        case OrderType of
            1: // Quantity
                HandleQuantity(Rec);
            2: // Qty. to Receive
                HandleQtyToReceive(Rec);
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

        case OrderType of
            1: // Quantity Case
                HandleQuantityCase(Rec);
            2: // Qty. to Receive Case
                HandleQtyToReceiveCase(Rec);
        end;
    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; OrderType: Integer)
    begin
        // Get the Case and Pallet quantities for the item entered
        CaseConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'CASE');
        PalletConst := QuantityRoundingHelper.GetQuantityUoM(Rec."No.", 'PALLET');

        case OrderType of
            1: // Quantity Pallet
                HandleQuantityPallet(Rec);
            2: // Qty. to Receive Pallet
                HandleQtyToReceivePallet(Rec);
        end;
    end;

    local procedure HandleQuantity(var Rec: Record "Purchase Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, CaseConst);
        Rec.Quantity := QuantityRoundingHelper.ValidateQty(Rec.Quantity, CaseConst, CaseQuantity);
        Rec."Quantity (Base)" := Rec.Quantity;
        Rec."Outstanding Quantity" := Rec.Quantity;
        Rec."Outstanding Qty. (Base)" := Rec."Quantity (Base)";

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

        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyToReceive(var Rec: Record "Purchase Line")
    var
        CaseQuantity: Integer;
    begin
        CaseQuantity := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", CaseConst);
        Rec."Qty. to Receive" := QuantityRoundingHelper.ValidateQty(Rec."Qty. to Receive", CaseConst, CaseQuantity);
        Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";

        if Rec."Qty. to Receive" >= PalletConst then
            Rec."Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", PalletConst)
        else
            Rec."Qty. to Receive Pallet" := 0;

        RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";
        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;

        UpdateToInvoice(Rec);
    end;

    local procedure HandleQuantityCase(var Rec: Record "Purchase Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        Rec."Quantity (Base)" := Rec.Quantity;
        Rec."Outstanding Quantity" := Rec.Quantity;
        Rec."Outstanding Qty. (Base)" := Rec."Quantity (Base)";

        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QuantityRoundingHelper.QuantityUoM(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;
        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyToReceiveCase(var Rec: Record "Purchase Line")
    begin
        Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
        Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";

        if Rec.Quantity >= PalletConst then
            Rec."Qty. to Receive Pallet" := QuantityRoundingHelper.QuantityUoM(Rec."Qty. to Receive", PalletConst);

        RemainingQuantity := Rec."Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QuantityRoundingHelper.QuantityUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;

        UpdateToReceive(Rec);
        UpdateToInvoice(Rec);
    end;

    local procedure HandleQuantityPallet(var Rec: Record "Purchase Line")
    begin
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        Rec."Quantity (Base)" := Rec."Quantity";
        Rec."Outstanding Quantity" := Rec.Quantity;
        Rec."Outstanding Qty. (Base)" := Rec."Quantity (Base)";
        UpdateToReceive(Rec);
    end;

    local procedure HandleQtyToReceivePallet(var Rec: Record "Purchase Line")
    begin
        Rec."Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
        Rec."Qty. to Receive (Base)" := Rec."Qty. to Receive";
        UpdateToReceive(Rec);
        UpdateToInvoice(Rec);
    end;

    local procedure UpdateToReceive(var Rec: Record "Purchase Line")
    var
        PurchSetup: Record "Purchases & Payables Setup";
    begin
        PurchSetup.Get();

        if (PurchSetup."Default Qty. to Receive" = PurchSetup."Default Qty. to Receive"::Remainder) or
        (Rec."Document Type" = Rec."Document Type"::Invoice) then begin
            Rec."Qty. to Receive" := Rec.Quantity;
            Rec."Qty. to Receive (Base)" := Rec."Quantity";
            Rec."Qty. to Receive Case" := Rec."Quantity Case";
            Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet";
            Rec."Qty. to Invoice" := Rec."Quantity";
            Rec."Qty. to Invoice (Base)" := Rec."Quantity (Base)";
        end else
            // if Rec."Qty. to Receive" <> 0 then begin
            //     Rec."Qty. to Receive (Base)" := MaxQtyToReceiveBase(Rec, Rec."Qty. to Receive (Base)");
            //     HandleQtyToReceive(Rec);
            // end;
            Rec."Qty. to Receive" := 0;
        Rec."Qty. to Receive (Base)" := 0;
        Rec."Qty. to Receive Case" := 0;
        Rec."Qty. to Receive Pallet" := 0;
        Rec."Qty. to Invoice" := 0;
        Rec."Qty. to Invoice (Base)" := 0;
    end;

    local procedure UpdateToInvoice(var Rec: Record "Purchase Line")
    begin
        Rec."Qty. to Invoice" := Rec."Qty. to Receive";
        Rec."Qty. to Invoice (Base)" := Rec."Qty. to Receive (Base)";
    end;

    procedure MaxQtyToReceiveBase(Rec: Record "Purchase Line"; QtyToReceiveBase: Decimal): Decimal
    begin
        if Abs(QtyToReceiveBase) > Abs(Rec."Outstanding Qty. (Base)") then
            exit(Rec."Outstanding Qty. (Base)");
        exit(QtyToReceiveBase);
    end;

    var
        QuantityRoundingHelper: Codeunit "Quantity Rounding Helper";
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;
}