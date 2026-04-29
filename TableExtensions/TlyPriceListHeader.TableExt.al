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

        field(50003; "National PM Brand"; Text[20])
        {
            Caption = 'National PM Brand';
            ToolTip = 'National PM Brand';
            DataClassification = CustomerContent;
            TableRelation = TlyNationalPMBrand;
            ObsoleteState = Removed;
        }

        field(50004; "Project Builder/Brand"; Text[20])
        {
            Caption = 'Project Builder/Brand';
            ToolTip = 'Project Builder/Brand';
            DataClassification = CustomerContent;
            TableRelation = TlyProjectBuilderBrand;
        }
    }
}