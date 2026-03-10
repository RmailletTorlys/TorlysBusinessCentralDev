pageextension 57018 TlyPurchPriceList extends "Purchase Price List"
{
    layout
    {
        modify(Tax)
        {
            Visible = false;
        }

        modify(PriceIncludesVAT)
        {
            Visible = false;
        }

        modify(AllowInvoiceDisc)
        {
            Visible = false;
        }

        modify(AllowLineDisc)
        {
            Visible = false;
        }
        modify(AllowUpdatingDefaults)
        {
            Importance = Standard;
        }
    }
}