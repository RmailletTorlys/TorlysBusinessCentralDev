table 55098 "Torlys Order Method"
{
    DataClassification = CustomerContent;
    Caption = 'Order Method';
    LookupPageId = "Order Method";
    DrillDownPageId = "Order Method";

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