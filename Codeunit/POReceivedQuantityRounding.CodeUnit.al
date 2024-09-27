Codeunit 50212 POReceivedQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Quantity Received', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Purchase Line")
    var
        Item: Record "Item";
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;
        LowerQuantity: Decimal;
        HigherQuantity: Decimal;
        Selected: Integer;
        CaseQuantity: Integer;
        Options: Text[100];
        QuantityOptionsLbl: Label 'Round down to %1 SQFT, Round up to %2 SQFT';
        QuantityMsgLbl: Label 'The Quantity is not an exact amount. Please select a quantity below.';

    begin

        // Check if Quantity has a value and Exit if 0
        if Rec."Quantity Received" = 0 then exit;

        // Initialize the Item record and verify if the item has a valid Compare Unit of measure field
        Item.SetRange("No.", Rec."No.");
        if Item.FindFirst() then
            if InvalidCompareUnitOfMeasure(Item) then exit;



        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMConst(Rec."No.", 'CASE');
        PalletConst := GetUoMConst(Rec."No.", 'PALLET');

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        CaseQuantity := NoOfUoM(Rec."Quantity Received", CaseConst);

        // CHECK IF NEEDED?????
        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, calculate and present the values to the user to chose a quantity that fits 
        if Rec."Quantity Received" <> CaseConst * CaseQuantity then begin
            RemainingQuantity := Rec."Quantity Received" - (CaseConst * CaseQuantity);
            LowerQuantity := Rec."Quantity Received" - RemainingQuantity;
            HigherQuantity := Rec."Quantity Received" + (CaseConst - RemainingQuantity);
            Options := StrSubstNo(QuantityOptionsLbl, Format(LowerQuantity, 0, 2), Format(HigherQuantity, 0, 2));
            Selected := Dialog.StrMenu(Options, 1, QuantityMsgLbl);
            if Selected = 2 then
                Rec."Quantity Received" := HigherQuantity
            else
                Rec."Quantity Received" := LowerQuantity;
        end;

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec."Quantity Received" >= PalletConst then
            Rec."Qty. Received Pallet" := NoOfUoM(Rec."Quantity Received", PalletConst);

        RemainingQuantity := Rec."Quantity Received" - PalletConst * Rec."Qty. Received Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Otherwise, set the cases to 0.
        if RemainingQuantity > 0 then
            Rec."Qty. Received Case" := NoOfUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. Received Case" := 0;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. Received Case', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Purchase Line")
    var
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;

    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMConst(Rec."No.", 'CASE');
        PalletConst := GetUoMConst(Rec."No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec."Quantity Received" := (CaseConst * Rec."Qty. Received Case") + (PalletConst * Rec."Qty. Received Pallet");

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec."Quantity Received" >= PalletConst then Rec."Qty. Received Pallet" := NoOfUoM(Rec."Quantity Received", PalletConst);

        RemainingQuantity := Rec."Quantity Received" - PalletConst * Rec."Qty. Received Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Qty. Received Case" := NoOfUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. Received Case" := 0;


    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeValidateEvent', 'Qty. Received Pallet', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Purchase Line")
    var
        PalletConst: Decimal;
        CaseConst: Decimal;

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMConst(Rec."No.", 'PALLET');
        CaseConst := GetUoMConst(Rec."No.", 'CASE');
        Rec."Quantity Received" := (CaseConst * Rec."Qty. Received Case") + (PalletConst * Rec."Qty. Received Pallet");
    end;

    local procedure InvalidCompareUnitOfMeasure(Rec: Record "Item"): Boolean
    begin
        if Rec."Compare Unit of Measure" = '' then
            exit(true);
        exit(false);
    end;

    local procedure GetUoMConst(ItemNo: Code[20]; Unit: Text[20]): Decimal
    var
        Iuom: Record "Item Unit of Measure";

    begin
        Iuom.SetRange("Item No.", ItemNo);
        Iuom.SetRange("Code", Unit);

        if Iuom.FindFirst() then
            exit(Iuom."Qty. per Unit of Measure");

        exit(0);
    end;

    local procedure NoOfUoM(Quantity: Decimal; Const: Decimal): Integer
    begin
        exit(Round(Quantity / Const, 1, '<'));
    end;
}