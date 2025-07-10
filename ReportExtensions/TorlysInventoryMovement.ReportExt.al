reportextension 51100 "TorlysInventoryMovement" extends "Inventory Movement"
{
    dataset
    {
        add("Item Journal Line")
        {
            column(Qty; "Quantity (Base)")
            {
                DecimalPlaces = 2 : 2;
            }
        }
    }

    var
        Qty: Decimal;
}