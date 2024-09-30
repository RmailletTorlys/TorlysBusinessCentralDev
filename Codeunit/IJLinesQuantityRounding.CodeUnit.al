codeunit 50213 IJLinesQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Item Journal Lines", 'OnBeforeValidateEvent', 'Quantity', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Item Journal Line")
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
        if CheckQtyAndCuom.Validate(Item, Rec.Quantity, Rec."No.") then exit;


        // Get the Case and Pallet quantities per Unit of Measure
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        CaseQuantity := NoOfUoM(Rec.Quantity, CaseConst);


        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, calculate and present the values to the user to chose a quantity that fits 
        if Rec.Quantity <> CaseConst * CaseQuantity then begin
            RemainingQuantity := Rec.Quantity - (CaseConst * CaseQuantity);
            LowerQuantity := Rec.Quantity - RemainingQuantity;
            HigherQuantity := Rec.Quantity + (CaseConst - RemainingQuantity);
            Options := StrSubstNo(QuantityOptionsLbl, Format(LowerQuantity, 0, 2), Format(HigherQuantity, 0, 2));
            Selected := Dialog.StrMenu(Options, 1, QuantityMsgLbl);
            if Selected = 2 then begin
                Message('%1', HigherQuantity);
                Rec.Quantity := HigherQuantity;
            end
            else begin
                Message('%1', LowerQuantity);
                Rec.Quantity := LowerQuantity;
            end;

        end;

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := NoOfUoM(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Otherwise, set the cases to 0.
        if RemainingQuantity > 0 then
            Rec."Quantity Case" := NoOfUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Journal Lines", 'OnBeforeValidateEvent', 'Case Quantity', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Item Journal Line")
    var
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;

    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec.Quantity >= PalletConst then Rec."Quantity Pallet" := NoOfUoM(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Quantity Case" := NoOfUoM(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;


    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Journal Lines", 'OnBeforeValidateEvent', 'Pallet Quantity', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Item Journal Line")
    var

        PalletConst: Decimal;
        CaseConst: Decimal;

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

    end;

    local procedure NoOfUoM(Quantity: Decimal; Const: Decimal): Integer
    begin
        exit(Round(Quantity / Const, 1, '<'));
    end;

    var
        GetUoMQuantity: Codeunit GetUnitOfMeasureQuantity;
        CheckQtyAndCuom: Codeunit CheckQtyAndCompareUoM;
}