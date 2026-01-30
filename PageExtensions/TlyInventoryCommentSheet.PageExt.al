pageextension 55750 TlyInventoryCommentSheet extends "Inventory Comment Sheet"
{
    layout
    {
        addafter(Code)
        {
            field("Comment Type"; Rec."Comment Type")
            {
                ApplicationArea = All;
                Caption = 'Comment Type';
                ToolTip = 'Specifies the type of comment.';
            }
        }

        modify(Code)
        {
            Visible = false;
        }
    }
}