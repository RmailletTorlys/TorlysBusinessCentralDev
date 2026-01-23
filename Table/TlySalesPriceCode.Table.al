table 50007 TlySalesPriceCode
{
    Caption = 'Sales Price Code';
    DataClassification = CustomerContent;
    LookupPageID = TlySalesPriceCodeList;
    DrillDownPageId = TlySalesPriceCodeList;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        // field(3; "Start Date"; Date)
        // {
        //     Caption = 'Start Date';
        //     DataClassification = CustomerContent;
        // }
        // field(4; "End Date"; Date)
        // {
        //     Caption = 'End Date';
        //     DataClassification = CustomerContent;
        // }
        field(5; "Price List Order"; Integer)
        {
            Caption = 'Price List Order';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(key1; "Code")
        {
            Clustered = true;
        }

    }
}