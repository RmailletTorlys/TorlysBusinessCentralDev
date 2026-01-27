pageextension 57001 TlyPriceListLines extends "Price List Lines"
{
    layout
    {

        modify("Variant Code")
        {
            Visible = false;
        }

        modify("Work Type Code")
        {
            Visible = false;
        }
        modify(VATBusPostingGrPrice)
        {
            Visible = false;
        }
    }
}