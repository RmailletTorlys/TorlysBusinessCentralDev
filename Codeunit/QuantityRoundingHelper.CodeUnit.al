CodeUnit 50205 "Quantity Rounding Helper"
{
    procedure Validate(Quantity: Decimal; CaseSize: Decimal; CasesFilled: Integer): Decimal
    var
        RemainingQuantity: Decimal;
        RoundedDownQuantity: Decimal;
        RoundedUpQuantity: Decimal;
        Options: Text[100];
        UserSelection: Integer;
#pragma warning disable AA0470
        RoundOptionsLbl: Label 'Round down to %1,Round up to %2', Comment = 'Options for rounding quantities';
#pragma warning restore AA0470
        PromptMessageLbl: Label 'The Quantity is not an exact amount. Please select a quantity below.';
    begin
        // Calculate the total filled quantity based on the cases
        RemainingQuantity := CalculateRemainingQuantity(Quantity, CaseSize, CasesFilled);

        // If the quantity is already exact, return it as is
        if RemainingQuantity = 0 then
            exit(Quantity);

        // Calculate rounded quantities
        RoundedDownQuantity := Quantity - RemainingQuantity;
        RoundedUpQuantity := Quantity + (CaseSize - RemainingQuantity);

        // Build options for the user dialog
        Options := StrSubstNo(RoundOptionsLbl, Format(RoundedDownQuantity, 0, 2), Format(RoundedUpQuantity, 0, 2));

        // Display the dialog and get user selection
        UserSelection := Dialog.StrMenu(Options, 2, PromptMessageLbl);

        // Return the selected quantity based on the user's choice
        case UserSelection of
            1:
                exit(RoundedDownQuantity);
            2:
                exit(RoundedUpQuantity);
        end;

        // Fallback to the original quantity (shouldn't reach here)
        exit(Quantity);
    end;

    procedure Validate(Qty: Decimal; "No.": Text[20]): Boolean
    var
        Item: Record Item;

    begin
        if Qty = 0 then exit(true);

        // Initialize the Item record and verify if the item has a valid Compare Unit of measure field
        Item.SetRange("No.", "No.");
        if Item.FindFirst() then
            if InvalidCompareUnitOfMeasure(Item) then exit(true);
        exit(false);

    end;

    local procedure CalculateRemainingQuantity(Qty: Decimal; CaseSize: Decimal; FilledCases: Integer): Decimal
    begin
        // Calculates the remaining quantity after subtracting filled cases
        exit(Qty - (CaseSize * FilledCases));
    end;

    procedure QuantityUoM(Qty: Decimal; Const: Decimal): Integer
    begin
        exit(Round(Qty / Const, 1, '<'));
    end;

    procedure GetQuantityUoM(ItemNo: Code[20]; Unit: Text[20]): Decimal
    var
        Iuom: Record "Item Unit of Measure";

    begin
        Iuom.SetRange("Item No.", ItemNo);
        Iuom.SetRange("Code", Unit);

        if Iuom.FindFirst() then
            exit(Iuom."Qty. per Unit of Measure")
        else
            Error('%1 does not appear to have a quantity set for %2. Please contact IT for more information.', ItemNo, Unit);

    end;

    procedure CheckQty(CaseConst: Decimal; PalletConst: Decimal; QtyCase: Decimal; QtyPallet: Decimal; CurrentAmt: Decimal): Decimal;
    var
        EnteredAmt: Decimal;
    begin
        EnteredAmt := (CaseConst * QtyCase) + (PalletConst * QtyPallet);

        if EnteredAmt > CurrentAmt then
            Error('You cannot enter more Quantity than has been ordered. Please verify your entry and try again.');
        exit(EnteredAmt);

    end;

    local procedure InvalidCompareUnitOfMeasure(Rec: Record "Item"): Boolean
    begin
        if (Rec."Compare Unit of Measure" = 'CASE') then exit(false);
        if (Rec."Compare Unit of Measure" = '') then begin
            Message('Item %1 does not have a Compare Unit of Measure set. Please contact IT for assistance.', Rec."No.");
            exit(true)
        end
        else
            Error('Item %1 has an invalid Compare Unit of Measure set on the item card. Please contact IT for assistance.', Rec."No.");
    end;



}