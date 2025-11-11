table 55099 "Torlys Shipping Instructions"
{
    DataClassification = CustomerContent;
    Caption = 'Shipping Instructions';
    LookupPageId = "Shipping Instructions";
    DrillDownPageId = "Shipping Instructions";



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