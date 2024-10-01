Codeunit 50223 POReceivedQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity Received', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Purchase Line")
    var
        CaseQuantity: Integer;

    begin
        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."No.") then exit;



        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        CaseQuantity := QtyOfUoM.Quantity(Rec."Quantity Received", CaseConst);

        // CHECK IF NEEDED?????
        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, calculate and present the values to the user to chose a quantity that fits 
        Rec."Quantity Received" := QtyFits.Validate(Rec."Quantity Received", CaseConst, CaseQuantity);

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec."Quantity Received" >= PalletConst then
            Rec."Qty. Received Pallet" := QtyOfUoM.Quantity(Rec."Quantity Received", PalletConst);

        RemainingQuantity := Rec."Quantity Received" - PalletConst * Rec."Qty. Received Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Otherwise, set the cases to 0.
        if RemainingQuantity > 0 then
            Rec."Qty. Received Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. Received Case" := 0;

        UpdateToInvoice(Rec);

    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. Received Case', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Purchase Line")
    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec."Qty. to Receive" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Receive Case", Rec."Qty. to Receive Pallet", Rec.Quantity);

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec."Quantity Received" >= PalletConst then Rec."Qty. Received Pallet" := QtyOfUoM.Quantity(Rec."Quantity Received", PalletConst);

        RemainingQuantity := Rec."Quantity Received" - PalletConst * Rec."Qty. Received Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Qty. Received Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. Received Case" := 0;

        UpdateToInvoice(Rec);


    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. Received Pallet', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Purchase Line")
    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        Rec."Qty. to Receive" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Receive Case", Rec."Qty. to Receive Pallet", Rec.Quantity);
        UpdateToInvoice(Rec);
    end;

    local procedure UpdateToInvoice(var Rec: Record "Purchase Line")
    begin
        Rec."Qty. to Invoice" := Rec."Quantity Received";

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