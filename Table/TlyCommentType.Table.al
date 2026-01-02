table 55096 TlyCommentType
{
    DataClassification = CustomerContent;
    Caption = 'Comment Type';
    LookupPageId = TlyCommentType;
    DrillDownPageId = TlyCommentType;



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