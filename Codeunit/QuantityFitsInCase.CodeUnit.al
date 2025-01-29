codeunit 50225 QuantityFitsInCase
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

    local procedure CalculateRemainingQuantity(Qty: Decimal; CaseSize: Decimal; FilledCases: Integer): Decimal
    begin
        // Calculates the remaining quantity after subtracting filled cases
        exit(Qty - (CaseSize * FilledCases));
    end;
}