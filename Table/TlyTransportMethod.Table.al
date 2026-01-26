table 55111 TlyTransportMethod
{
    DataClassification = CustomerContent;
    Caption = 'Transport Method';
    LookupPageId = TlyTransportMethod;
    DrillDownPageId = TlyTransportMethod;

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