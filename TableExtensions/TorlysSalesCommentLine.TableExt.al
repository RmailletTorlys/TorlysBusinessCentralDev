tableextension 50044 TorlysSalesCommentLine extends "Sales Comment Line"
{
    fields
    {
        field(50001; Type; Enum "Torlys Comment Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            ToolTip = 'Specifies the type of comment.';
        }


    }

}