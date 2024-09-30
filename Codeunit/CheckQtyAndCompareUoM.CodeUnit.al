codeunit 50217 CheckQtyAndCompareUoM
{
    procedure Validate(var Item: Record "Item"; Qty: Decimal; "No.": Text[20]): Boolean
    begin
        if Qty = 0 then exit(true);

        // Initialize the Item record and verify if the item has a valid Compare Unit of measure field
        Item.SetRange("No.", "No.");
        if Item.FindFirst() then
            if InvalidCompareUnitOfMeasure(Item) then exit(true);

        exit(false);

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