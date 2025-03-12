enumextension 57003 TorlysPriceSourceType extends "Price Source Type"
{
    value(50001; "Price Code")
    {
        Caption = 'Price Code';
        Implementation = "Price Source" = "Price Source - Price Code", "Price Source Group" = "Price Source Group - All";
    }
}

