table 55089 TlyProjectBuilderBrand
{
    DataClassification = CustomerContent;
    Caption = 'Project Builder/Brand';
    LookupPageId = TlyProjectBuilderBrand;
    DrillDownPageId = TlyProjectBuilderBrand;

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