table 55100 TlySteamshipLine
{
    DataClassification = CustomerContent;
    Caption = 'Steamship Line';
    LookupPageId = TlySteamshipLine;
    DrillDownPageId = TlySteamshipLine;

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

        field(3; "SCAC Code"; Code[500])
        {
            Caption = 'SCAC Code';
            DataClassification = CustomerContent;
            TableRelation = TlySCACCodes;
            Description = 'TLY-SD - 10/26/2026 - added';
        }
    }

    keys
    {
        key(key1; "Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Description, "SCAC Code")
        { }
    }
}