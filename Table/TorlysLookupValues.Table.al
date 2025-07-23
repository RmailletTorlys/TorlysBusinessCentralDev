table 55006 "Torlys Lookup Values"
{
    DataClassification = CustomerContent;
    Caption = 'TORLYS Lookup Values';
    LookupPageId = "Lookup Values Lookup";
    DrillDownPageId = "Lookup Values List";



    fields
    {
        field(1; "Type"; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionMembers = "Order Type","Order Method","Freight Zone";
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(3; "Description"; Text[50])
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