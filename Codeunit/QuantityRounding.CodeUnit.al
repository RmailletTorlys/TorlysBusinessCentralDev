codeunit 50202 QuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Sales Line")
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
        // Initialize the Item record
        Item.SetRange("No.", Rec."No.");
        Item.FindFirst();
        // Check if the Item has a blank 'Compare Unit of Measure' or if it is set to Each and shortcircuit if true
        if (Item."Compare Unit of Measure" = '') then exit;
        if (Item."Compare Unit of Measure" = 'EACH') then exit;

        CaseConst := GetCaseConst(Rec."No.");

        // Get the Pallet Quantity per unit of Measure and assign to the PalletConst variable for Refferencing
        PalletConst := GetPalletConst(Rec."No.");

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        // The number is Rounded to fit as an Integer.
        CaseQuantity := NoOfCases(Rec.Quantity, CaseConst);


        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, then calculate the rounding and present the values to the user to select
        // a quantity that fits into the case count. 
        if Rec.Quantity <> CaseConst * CaseQuantity then begin
            RemainingQuantity := Rec.Quantity - (CaseConst * CaseQuantity);
            LowerQuantity := Rec.Quantity - RemainingQuantity;
            HigherQuantity := Rec.Quantity + (CaseConst - RemainingQuantity);
            Options := StrSubstNo(QuantityOptionsLbl, Format(LowerQuantity, 0, 2), Format(HigherQuantity, 0, 2));
            Selected := Dialog.StrMenu(Options, 1, QuantityMsgLbl);
            if Selected = 2 then
                Rec.Quantity := Rec.Quantity + (CaseConst - RemainingQuantity)
            else
                Rec.Quantity := Rec.Quantity - RemainingQuantity;
        end;


        // Check if Quantity has a value before proceeding to the next step.
        if Rec.Quantity <> 0 then begin
            // Initialize RemaindingQuantity to have the same value as the entered quantity.
            RemainingQuantity := Rec.Quantity;

            // Check if the quantity is larger than a pallet size.
            if Rec.Quantity >= PalletConst then begin
                // Calculate the number of Pallets that the quantity converts to.
                // This number is Rounded down/Floored to fit into an integer.
                Rec."Quantity Pallet" := NoOfPallets(Rec.Quantity, PalletConst);
                // Record the remainder and update RemainingQuantity
                RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";
            end;
            // Check if there is an amount left after converting pallet amounts.
            if RemainingQuantity > 0 then
                // If there is a remainder, calculate the number of cases that the remainder converts to.
                if RemainingQuantity >= CaseConst then
                    // Calculate the number of Cases that the remainder converts to.
                    // The number is Rounded Down/Floored to fit as an Integer.
                    Rec."Quantity Case" := NoOfCases(RemainingQuantity, CaseConst)

                else
                    // This line is required to ensure Case Quantity is set to 0 if no cases are remaining after the pallet calculation.
                    // It also cleans up from the quantity check above.
                    Rec."Quantity Case" := 0;
        end;

        exit;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Sales Line")
    var
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;

    begin
        // Check if the number of cases entered is >= number of cases in a pallet
        CaseConst := GetCaseConst(Rec."No.");
        PalletConst := GetPalletConst(Rec."No.");

        // Calculate the Order Quantity based on the amount of cases entered
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

        // If yes, Add number to Pallet Quantity and calculate the remaining cases
        if Rec.Quantity >= PalletConst then Rec."Quantity Pallet" := NoOfPallets(Rec.Quantity, PalletConst);

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        // After calculating the number of Pallets, calculate the remaining cases
        if RemainingQuantity >= CaseConst then Rec."Quantity Case" := NoOfCases(RemainingQuantity, CaseConst);


    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Sales Line")
    var
        PalletConst: Decimal;
        CaseConst: Decimal;

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetPalletConst(Rec."No.");
        CaseConst := GetCaseConst(Rec."No.");
        Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
    end;



    local procedure GetPalletConst(ItemNo: Code[20]): Decimal
    var
        Iuom: Record "Item Unit of Measure";

    begin
        Iuom.SetRange("Item No.", ItemNo);
        Iuom.SetRange("Code", 'PALLET');

        if Iuom.FindFirst() then
            exit(Iuom."Qty. per Unit of Measure");

        exit(0);
    end;

    local procedure GetCaseConst(ItemNo: Code[20]): Decimal
    var
        Iuom: Record "Item Unit of Measure";

    begin
        Iuom.SetRange("Item No.", ItemNo);
        Iuom.SetRange("Code", 'CASE');

        if Iuom.FindFirst() then
            exit(Iuom."Qty. per Unit of Measure");

        exit(0);
    end;

    local procedure NoOfPallets(Quantity: Decimal; PalletConst: Decimal): Integer
    var
        Pallets: Integer;

    begin
        Pallets := Round(Quantity / PalletConst, 1, '<');

        exit(Pallets);

    end;

    local procedure NoOfCases(Quantity: Decimal; CaseConst: Decimal): Integer
    var
        Cases: Integer;

    begin
        Cases := Round(Quantity / CaseConst, 1, '<');

        exit(Cases);

    end;

}