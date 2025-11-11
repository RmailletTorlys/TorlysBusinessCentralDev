table 55097 "Torlys Order Type"
{
    DataClassification = CustomerContent;
    Caption = 'Order Type';
    LookupPageId = "Order Type";
    DrillDownPageId = "Order Type";



    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
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