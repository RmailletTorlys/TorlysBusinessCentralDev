enumextension 50315 TorlysPriceSourceType extends "Price Source Type"
{
    value(50001; "Item Category")
    {
        Caption = 'Price Code';
        Implementation = "Price Source" = "Price Source Price Code", "Price Source Group" = "Price Source Group - All";
    }
}

