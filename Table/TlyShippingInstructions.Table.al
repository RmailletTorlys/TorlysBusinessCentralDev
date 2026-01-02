table 55099 TlyShippingInstructions
{
    DataClassification = CustomerContent;
    Caption = 'Shipping Instructions';
    LookupPageId = TlyShippingInstructions;
    DrillDownPageId = TlyShippingInstructions;

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