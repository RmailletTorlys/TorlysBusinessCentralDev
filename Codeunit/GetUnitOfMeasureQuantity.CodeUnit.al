codeunit 50210 GetUnitOfMeasureQuantity
{
    procedure Get(ItemNo: Code[20]; Unit: Text[20]): Decimal
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
}


