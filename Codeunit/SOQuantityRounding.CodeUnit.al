codeunit 50202 SOQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Sales Line")
    var
        CaseQuantity: Integer;

    begin

        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."No.") then exit;

        // Get the Case and Pallet quantities per Unit of Measure and calculate the number of Cases from the quantity entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseQuantity := QtyOfUoM.Quantity(Rec.Quantity, CaseConst);

        // Check if Quantity entered matched CaseConst * CaseQuantity. If Not, present options to user to chose quantity that fits.
        Rec.Quantity := QtyFits.Validate(Rec.Quantity, CaseConst, CaseQuantity);

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Set Quantity Case to 0 otherwise.
        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

        Commit();
        UpdateShipAndInvoice(Rec);

    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Sales Line")

    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec.Quantity >= PalletConst then Rec."Quantity Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

        Commit();
        UpdateShipAndInvoice(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Sales Line")

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
        Commit();
        UpdateShipAndInvoice(Rec);
    end;

    local procedure UpdateShipAndInvoice(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Ship" := Rec.Quantity;
        Rec."Qty. to Ship Case" := Rec."Quantity Case";
        Rec."Qty. to Ship Pallet" := Rec."Quantity Pallet";
        Rec."Qty. to Invoice" := Rec.Quantity;
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