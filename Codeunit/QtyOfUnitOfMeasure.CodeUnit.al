codeunit 50219 QtyOfUnitOfMeasure
{
    procedure Quantity(Qty: Decimal; Const: Decimal): Integer
    begin
        exit(Round(Qty / Const, 1, '<'));
    end;
}

