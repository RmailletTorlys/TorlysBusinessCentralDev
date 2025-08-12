table 55006 "Torlys Lookup Values"
{
    DataClassification = CustomerContent;
    Caption = 'TORLYS Lookup Values';
    LookupPageId = "Lookup Values Lookup";
    DrillDownPageId = "Lookup Values List";



    fields
    {
        field(1; "Type"; Enum "Torlys Lookup Values")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(2; "Code"; Code[25])
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
        key(key1; "Type", "Code")
        {
            Clustered = true;
        }

    }
}