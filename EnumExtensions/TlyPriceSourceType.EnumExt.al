enumextension 57003 TlyPriceSourceType extends "Price Source Type"
{
    value(50001; "Sales Price Code")
    {
        Caption = 'Sales Price Code';
        Implementation = "Price Source" = TlyPriceSourceSalesPriceCode, "Price Source Group" = "Price Source Group - All";
    }
}

