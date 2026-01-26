table 55109 TlyInlandTerminal
{
    DataClassification = CustomerContent;
    Caption = 'Inland Terminal';
    LookupPageId = TlyInlandTerminal;
    DrillDownPageId = TlyInlandTerminal;

    fields
    {
        field(1; "Code"; Text[20])
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