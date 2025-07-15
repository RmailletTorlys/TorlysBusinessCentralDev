enumextension 57003 TorlysPriceSourceType extends "Price Source Type"
{
    value(50001; "Sales Price Code")
    {
        Caption = 'Sales Price Code';
        Implementation = "Price Source" = "Price Source - SalesPriceCode", "Price Source Group" = "Price Source Group - All";
    }
}

