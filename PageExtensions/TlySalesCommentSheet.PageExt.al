pageextension 50067 "TlySalesCommentSheet" extends "Sales Comment Sheet"
{
    layout
    {
        addafter(Comment)
        {
            field(Type; Rec."Comment Type")
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
}