tableextension 50044 TorlysSalesCommentLine extends "Sales Comment Line"
{
    fields
    {
        field(50001; Type; Code[50])
        {
            Caption = 'Type';
            ToolTip = 'Specifies the type of comment.';
        }

        field(50002; "Comment Code"; Enum "Torlys Comment Type")
        {
            Caption = 'Comment Code';
            DataClassification = CustomerContent;
        }

    }

}