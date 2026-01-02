table 55098 TlyOrderMethod
{
    DataClassification = CustomerContent;
    Caption = 'Order Method';
    LookupPageId = TlyOrderMethod;
    DrillDownPageId = TlyOrderMethod;

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