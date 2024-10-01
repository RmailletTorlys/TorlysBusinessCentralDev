codeunit 50207 ROToReceiveQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Return Qty. to Receive', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Sales Line")
    var
        CaseQuantity: Integer;

    begin
        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."No.") then exit;


        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        CaseQuantity := QtyOfUoM.Quantity(Rec."Return Qty. to Receive", CaseConst);

        // CHECK IF NEEDED?????
        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, calculate and present the values to the user to chose a quantity that fits 
        Rec."Return Qty. to Receive" := QtyFits.Validate(Rec."Return Qty. to Receive", CaseConst, CaseQuantity);

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec."Return Qty. to Receive" >= PalletConst then
            Rec."Qty. to Receive Pallet" := QtyOfUoM.Quantity(Rec."Return Qty. to Receive", PalletConst);

        RemainingQuantity := Rec."Return Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Otherwise, set the cases to 0.
        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Sales Line")

    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec."Return Qty. to Receive" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Receive Case", Rec."Qty. to Receive Pallet", Rec.Quantity);

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec."Return Qty. to Receive" >= PalletConst then Rec."Qty. to Receive Pallet" := QtyOfUoM.Quantity(Rec."Return Qty. to Receive", PalletConst);

        RemainingQuantity := Rec."Return Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;


    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Sales Line")

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        Rec."Return Qty. to Receive" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Receive Case", Rec."Qty. to Receive Pallet", Rec.Quantity);
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