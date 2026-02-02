pageextension 50067 TlySalesCommentSheet extends "Sales Comment Sheet"
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
        }

        moveafter("Created By"; Comment)

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
        modify("Print on Quote")
        {
            Visible = false;
        }
        modify("Print on Pick Ticket")
        {
            Visible = true;
        }
        modify("Print on Order Confirmation")
        {
            Visible = true;
        }
        modify("Print on Shipment")
        {
            Visible = true;
        }
        modify("Print on Invoice")
        {
            Visible = true;
        }
        modify("Print on Credit Memo")
        {
            Visible = true;
        }
        modify("Print on Return Authorization")
        {
            Visible = false;
        }
        modify("Print on Return Receipt")
        {
            Visible = true;
        }
    }
    var
        LookupUser: Codeunit TlyLookupUserID;
}