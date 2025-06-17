CodeUnit 50005 "Quantity Rounding Helper"
{
    procedure ValidateQty(Quantity: Decimal; CaseSize: Decimal; CasesFilled: Integer): Decimal
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

    procedure InvalidCompareUnitOfMeasure(Rec: Record "Item"): Boolean
    var
        iuom: Record "Item Unit of Measure";

    begin
        //Return True IF Item does NOT have a Compare Unit of Measure
        if Rec."Compare Unit of Measure" = '' then
            exit(true);

        iuom.SetRange("Item No.", Rec."No.");
        iuom.SetRange("Code", Rec."Compare Unit of Measure");
        if iuom.IsEmpty then begin
            Message('%1 does not have a matching %2 Item Unit of Measure. Please contact ??? for support.', Rec."No.", Rec."Compare Unit of Measure");
            exit(true);
        end;



        if Rec."Compare Unit of Measure" = 'CASE' then begin
            iuom.SetRange("Code", 'PALLET');
            if iuom.IsEmpty() then begin
                Message('%1 does not have a matching Pallet Item Unit of Measure. Please contact ??? for support.', Rec."No.");
                exit(true);
            end
        end;


        exit(false);
    end;



}