tableextension 50044 TorlysSalesCommentLine extends "Sales Comment Line"
{
    fields
    {
        field(50001; "Comment Type"; Code[25])
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            ToolTip = 'Specifies the type of comment.';
            TableRelation = "Torlys Lookup Values".Code where(Type = const("Comment Type"));
        }


    }

}