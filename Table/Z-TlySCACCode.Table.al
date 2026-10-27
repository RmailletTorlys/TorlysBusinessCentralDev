table 55079 TlySCACCode
{
    DataClassification = CustomerContent;
    Caption = 'SCAC Code';
    // LookupPageId = TlySCACCode;
    // DrillDownPageId = TlySCACCode;
    ObsoleteState = Removed;

    fields
    {
        field(1; "Code"; Text[4])
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