codeunit 50221 QuantityFitsInCase
{
    procedure Validate(Qty: Decimal; CaseConst: Decimal; CaseQuantity: Integer): Decimal
    var
        RemainingQuantity: Decimal;
        LowerQuantity: Decimal;
        HigherQuantity: Decimal;
        Options: Text[100];
        Selected: Integer;
        QuantityOptionsLbl: Label 'Round down to %1 SQFT, Round up to %2 SQFT', Comment = 'Round down to %1 SQFT, Round up to %2 SQFT';
        QuantityMsgLbl: Label 'The Quantity is not an exact amount. Please select a quantity below.';

    begin
        if Qty <> CaseConst * CaseQuantity then begin
            RemainingQuantity := Qty - (CaseConst * CaseQuantity);
            LowerQuantity := Qty - RemainingQuantity;
            HigherQuantity := Qty + (CaseConst - RemainingQuantity);
            Options := StrSubstNo(QuantityOptionsLbl, Format(LowerQuantity, 0, 2), Format(HigherQuantity, 0, 2));
            Selected := Dialog.StrMenu(Options, 2, QuantityMsgLbl);
            if Selected = 2 then
                exit(HigherQuantity)
            else
                exit(LowerQuantity);
        end;
        exit(Qty);
    end;

}