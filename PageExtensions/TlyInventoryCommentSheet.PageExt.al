pageextension 55750 TlyInventoryCommentSheet extends "Inventory Comment Sheet"
{
    layout
    {
        addafter(Date)
        {
            field("Created By"; LookupUser.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }
            field("Entered By"; Rec."Entered By")
            {
                Caption = 'Entered By';
                ToolTip = 'Entered By';
                ApplicationArea = All;
                Editable = false;
            }
        }

        moveafter("Entered By"; Comment)

        addafter(Comment)
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

    var
        LookupUser: Codeunit TlyLookupUserID;
}