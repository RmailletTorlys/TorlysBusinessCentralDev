codeunit 50217 CheckQtyAndCompareUoM
{
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
        if (Rec."Compare Unit of Measure" = '') then
            exit(true)
        else
            Error('Item %1 has an invalid Compare Unit of Measure set on the item card. Please contact IT for assistance.', Rec."No.");
    end;

}