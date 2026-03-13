tableextension 57000 TlyPriceListHeader extends "Price List Header"
{
    DrillDownPageID = "Sales Price List";
    LookupPageID = "Sales Price Lists";

    fields
    {
        field(50001; "National Property Management"; Boolean)
        {
            Caption = 'National Property Management';
            ToolTip = 'National Property Management';
            DataClassification = CustomerContent;
        }
    }
}