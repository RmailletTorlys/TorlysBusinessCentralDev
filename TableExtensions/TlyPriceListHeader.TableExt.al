tableextension 57000 TlyPriceListHeader extends "Price List Header"
{
    DrillDownPageID = "Sales Price List";
    LookupPageID = "Sales Price Lists";

    fields
    {
        field(50001; "National Property Management"; Boolean)
        {
            Caption = 'National PM';
            ToolTip = 'National PM';
            DataClassification = CustomerContent;
        }

        field(50002; "Price List Type"; Enum TlyPriceListType)
        {
            Caption = 'Price List Type';
            ToolTip = 'Price List Type';
            DataClassification = CustomerContent;
        }
    }
}