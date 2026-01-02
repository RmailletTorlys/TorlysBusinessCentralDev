table 55095 TlyMKStagedLocation
{
    DataClassification = CustomerContent;
    Caption = 'MK Staged Location';
    LookupPageId = TlyMKStagedLocation;
    DrillDownPageId = TlyMKStagedLocation;

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