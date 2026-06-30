table 55169 TlyItemAdditionalCostType
{
    DataClassification = CustomerContent;
    Caption = 'Item Additional Cost Type';
    LookupPageId = TlyItemAdditionalCostType;
    DrillDownPageId = TlyItemAdditionalCostType;

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