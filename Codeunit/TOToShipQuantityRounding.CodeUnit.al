codeunit 50233 TOToShipQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Transfer Line")
    var
        CaseQuantity: Integer;

    begin
        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."Item No.") then exit;


        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMQuantity.Get(Rec."Item No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."Item No.", 'PALLET');

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        CaseQuantity := QtyOfUoM.Quantity(Rec."Qty. to Ship", CaseConst);

        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, calculate and present the values to the user to chose a quantity that fits 
        Rec."Qty. to Ship" := QtyFits.Validate(Rec."Qty. to Ship", CaseConst, CaseQuantity);

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec."Qty. to Ship" >= PalletConst then
            Rec."Qty. to Ship Pallet" := QtyOfUoM.Quantity(Rec."Qty. to Ship", PalletConst);

        RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Otherwise, set the cases to 0.
        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Transfer Line")

    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."Item No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."Item No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec."Qty. to Ship" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Ship Case", Rec."Qty. to Ship Pallet", Rec.Quantity);

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec."Qty. to Ship" >= PalletConst then Rec."Qty. to Ship Pallet" := QtyOfUoM.Quantity(Rec."Qty. to Ship", PalletConst);

        RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;


    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Transfer Line")

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."Item No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."Item No.", 'CASE');
        Rec."Qty. to Ship" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Ship Case", Rec."Qty. to Ship Pallet", Rec.Quantity);
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