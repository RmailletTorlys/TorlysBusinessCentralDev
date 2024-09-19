codeunit 50202 QuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', true, true)]
    local procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Sales Line")
    var
        Iuom: Record "Item Unit of Measure";
        Item: Record "Item";
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;
        LowerQuantity: Decimal;
        HigherQuantity: Decimal;
        Selected: Integer;
        PalletQuantity: Integer;
        CaseQuantity: Integer;
        Options: Text[50];
        QuantityOptionsLbl: Label 'Round down to %1 SQFT, Round up to %2 SQFT'; // %1 is the lower quantity and %2 is the higher quantity
        QuantityMsgLbl: Label 'The Quantity is not an exact amount. Please select a quantity below.';

    begin
        // Initialize the Item record
        Item.SetRange("No.", Rec."No.");
        Item.FindFirst();


        // Check if the Item has a blank 'Compare Unit of Measure' or if it is set to Each and shortcircuit if true
        if (Item."Compare Unit of Measure" = '') then exit;
        if (Item."Compare Unit of Measure" = 'EACH') then exit;


        // Initialize the Item Unit of Measure Record
        Iuom.SetRange("Item No.", Rec."No.");

        // Get the Case Quantity per unit of Measure and assign to the CaseConst variable for Refferencing
        Iuom.SetRange("Code", 'CASE');
        Iuom.FindFirst();
        CaseConst := Iuom."Qty. per Unit of Measure";

        // Get the Pallet Quantity per unit of Measure and assign to the PalletConst variable for Refferencing
        Iuom.SetRange("Code", 'PALLET');
        Iuom.FindFirst();
        PalletConst := Iuom."Qty. per Unit of Measure";

        // Set Case Quantity to the entered quantity divided by CaseConst, which is the quantity of a case entered in the Item Unit of Measure table. 
        // The number is Rounded to fit as an Integer.
        CaseQuantity := Round(Rec.Quantity / CaseConst, 1, '<');


        // Check if Quantity is not equal to the Case Quantity (calculated in the previous step) times the CaseConst value set above.
        // If the Quantity in the record is not equal to the Product, then calculate the rounding and present the values to the user to select if
        // a quantity that fits into the case count. 
        if Rec.Quantity <> CaseConst * CaseQuantity then begin
            RemainingQuantity := Rec.Quantity - (CaseConst * CaseQuantity);
            LowerQuantity := Rec.Quantity - RemainingQuantity;
            HigherQuantity := Rec.Quantity + (CaseConst - RemainingQuantity);
            Options := StrSubstNo(QuantityOptionsLbl, LowerQuantity, HigherQuantity);
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
                PalletQuantity := Round(Rec.Quantity / PalletConst, 1, '<');
                // Record the remainder and update RemainingQuantity
                RemainingQuantity := Rec.Quantity - PalletConst * PalletQuantity;
            end;
            // Check if there is an amount left after converting pallet amounts.
            if RemainingQuantity > 0 then
                // If there is a remainder, calculate the number of cases that the remainder converts to.
                if RemainingQuantity >= CaseConst then
                    // Calculate the number of Cases that the remainder converts to.
                    // The number is Rounded Down/Floored to fit as an Integer.
                    CaseQuantity := Round(RemainingQuantity / CaseConst, 1, '<')
                else
                    // This line is required to ensure Case Quantity is set to 0 if no cases are remaining after the pallet calculation.
                    // It also cleans up from the quantity check above.
                    CaseQuantity := 0;
        end;

        Rec."Quantity Case" := CaseQuantity;
        Rec."Quantity Pallet" := PalletQuantity;
        Rec.Modify(true);
        exit;

    end;

}