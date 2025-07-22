pageextension 50067 "TorlysSalesCommentSheet" extends "Sales Comment Sheet"
{
    layout
    {
        addafter(Code)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
                Caption = 'Type';
                ToolTip = 'Specifies the type of comment.';

            }
        }

        modify(Code)
        {
            Visible = false;
        }
        modify("Print on Quote")
        {
            Visible = true;
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
            Visible = true;
        }
        modify("Print on Return Receipt")
        {
            Visible = true;
        }
    }
}