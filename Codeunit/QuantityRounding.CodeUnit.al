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

        CaseQuantity := Round(Rec.Quantity / CaseConst, 1, '<');


        // Check if Quantity entered fits in the case count. If it does not, ask the user to chose a quantity that fits.
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


        // Check if Quantity has a value.

        if Rec.Quantity <> 0 then begin
            RemainingQuantity := Rec.Quantity;
            if Rec.Quantity >= PalletConst then begin
                PalletQuantity := Round(Rec.Quantity / PalletConst, 1, '<');
                RemainingQuantity := Rec.Quantity - PalletConst * PalletQuantity;
            end;
            if RemainingQuantity >= 0 then
                CaseQuantity := Round(RemainingQuantity / CaseConst, 1, '<')
            else
                CaseQuantity := 0;
        end;

        Rec."Quantity Case" := CaseQuantity;
        Rec."Quantity Pallet" := PalletQuantity;
        Rec.Modify(true);
        exit;

    end;

}