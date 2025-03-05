codeunit 50229 SOQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'No.', true, true)]
    local procedure OnAfterValidateItem(var Rec: Record "Sales Line")

    var
        Customer: Record "Customer";
        Item: Record "Item";
        PriceListLine: Record "Price List Line";

    begin
        Customer.Reset();
        Customer.Get(Rec."Sell-to Customer No.");
        Item.Reset();
        Item.Get(Rec."No.");

        Rec."Sales Price Code" := Item."Sales Price Code";
        Rec."Default Price List" := Customer."Default Price List Code";
        Rec."Price List" := Customer."Default Price List Code";

        Commit();

        Message('Sales Price Code: %1', Rec."Sales Price Code");
        Message('Default Price List: %1', Rec."Default Price List");
        Message('Price List: %1', Rec."Price List");


        PriceListLine.Reset();
        PriceListLine.SetRange("Price List Code", Rec."Price List");

        PriceListLine.SetRange("Product No.", Rec."No.");

        if (PriceListLine.FindFirst())
        then begin
            Message('PriceListLine: %1', PriceListLine);
            Rec."Unit Price" := PriceListLine."Unit Price";
            exit;
        end;

        PriceListLine.SetRange("Product No.", Rec."Sales Price Code");

        if (PriceListLine.FindFirst())
        then begin
            Message('PriceListLine: %1', PriceListLine);
            Rec."Unit Price" := PriceListLine."Unit Price";
            exit;
        end;

        Rec."Unit Price" := Item."Unit Price";
        Commit();

    end;

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