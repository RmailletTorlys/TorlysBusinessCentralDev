table 55080 TlySCACCodes
{
    DataClassification = CustomerContent;
    Caption = 'SCAC Codes';
    LookupPageId = TlySCACCodes;
    DrillDownPageId = TlySCACCodes;

    fields
    {
        field(1; "Code"; Code[500])
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