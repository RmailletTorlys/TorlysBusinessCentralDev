codeunit 50204 SOToShipQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Sales Line")
    var
        Item: Record "Item";
        CheckQtyAndCuom: Codeunit CheckQtyAndCompareUoM;
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
        if CheckQtyAndCuom.Validate(Item, Rec.Quantity, Rec."No.") then exit;



        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMConst(Rec."No.", 'CASE');
        PalletConst := GetUoMConst(Rec."No.", 'PALLET');

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        CaseQuantity := NoOfUoM(Rec."Qty. to Ship", CaseConst);

        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, calculate and present the values to the user to chose a quantity that fits 
        if Rec."Qty. to Ship" <> CaseConst * CaseQuantity then begin
            RemainingQuantity := Rec."Qty. to Ship" - (CaseConst * CaseQuantity);
            LowerQuantity := Rec."Qty. to Ship" - RemainingQuantity;
            HigherQuantity := Rec."Qty. to Ship" + (CaseConst - RemainingQuantity);
            Options := StrSubstNo(QuantityOptionsLbl, Format(LowerQuantity, 0, 2), Format(HigherQuantity, 0, 2));
            Selected := Dialog.StrMenu(Options, 1, QuantityMsgLbl);

            if Selected = 2 then begin
                Rec."Qty. to Ship" := HigherQuantity;
                Rec."Qty. to Invoice" := HigherQuantity;
            end

            else begin
                Rec."Qty. to Ship" := LowerQuantity;
                Rec."Qty. to Invoice" := LowerQuantity;
            end;
        end;

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec."Qty. to Ship" >= PalletConst then
            Rec."Qty. to Ship Pallet" := NoOfUoM(Rec."Qty. to Ship", PalletConst);

        RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Otherwise, set the cases to 0.
        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := NoOfUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Sales Line")
    var
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;

    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMConst(Rec."No.", 'CASE');
        PalletConst := GetUoMConst(Rec."No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec."Qty. to Ship" >= PalletConst then Rec."Qty. to Ship Pallet" := NoOfUoM(Rec."Qty. to Ship", PalletConst);

        RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Qty. to Ship Case" := NoOfUoM(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Ship Case" := 0;


    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Sales Line")
    var
        PalletConst: Decimal;
        CaseConst: Decimal;

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMConst(Rec."No.", 'PALLET');
        CaseConst := GetUoMConst(Rec."No.", 'CASE');
        Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
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