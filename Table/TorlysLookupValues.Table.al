table 55006 "Torlys Lookup Values"
{
    DataClassification = CustomerContent;
    Caption = 'TORLYS Lookup Values';


    fields
    {
        field(1; "Type"; Code[20])
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
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
        key(key1; "Type", "Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(Dropdown; "Code", "Description")
        {
            Caption = 'Drop Down';
        }
    }
}