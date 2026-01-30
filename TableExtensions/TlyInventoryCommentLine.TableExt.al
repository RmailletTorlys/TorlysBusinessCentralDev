tableextension 55748 TlyInventoryCommentLine extends "Inventory Comment Line"
{
    fields
    {
        field(50001; "Comment Type"; Code[25])
        {
            Caption = 'Comment Type';
            ToolTip = 'Specifies the type of comment.';
            DataClassification = CustomerContent;
            TableRelation = TlyCommentType;
        }
        field(50002; "Popup"; Boolean)
        {
            Caption = 'Popup';
            ToolTip = 'Popup';
            DataClassification = CustomerContent;
        }
    }
}