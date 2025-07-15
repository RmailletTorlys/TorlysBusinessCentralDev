pageextension 50068 "TorlysPurchCommentSheet" extends "Purch. Comment Sheet"
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

            field("Print on Quote"; Rec."Print on Quote")
            {
                ApplicationArea = All;
                Caption = 'Print on Quote';
                ToolTip = 'Specifies if the comment should be printed on the quote.';

            }

            field("Print on Pick Ticket"; Rec."Print on Pick Ticket")
            {
                ApplicationArea = All;
                Caption = 'Print on Pick Ticket';
                ToolTip = 'Specifies if the comment should be printed on the pick ticket.';

            }

            field("Print on Order Confirmation"; Rec."Print on Order Confirmation")
            {
                ApplicationArea = All;
                Caption = 'Print on Order Confirmation';
                ToolTip = 'Specifies if the comment should be printed on the order confirmation.';

            }

            field("Print on Shipment"; Rec."Print on Shipment")
            {
                ApplicationArea = All;
                Caption = 'Print on Shipment';
                ToolTip = 'Specifies if the comment should be printed on the shipment.';

            }

            field("Print on Invoice"; Rec."Print on Invoice")
            {
                ApplicationArea = All;
                Caption = 'Print on Invoice';
                ToolTip = 'Specifies if the comment should be printed on the invoice.';

            }

            field("Print on Credit Memo"; Rec."Print on Credit Memo")
            {
                ApplicationArea = All;
                Caption = 'Print on Credit Memo';
                ToolTip = 'Specifies if the comment should be printed on the credit memo.';

            }

            field("Print on Return Authorization"; Rec."Print on Return Authorization")
            {
                ApplicationArea = All;
                Caption = 'Print on Return Authorization';
                ToolTip = 'Specifies if the comment should be printed on the return authorization.';

            }

            field("Print on Return Receipt"; Rec."Print on Return Receipt")
            {
                ApplicationArea = All;
                Caption = 'Print on Return Receipt';
                ToolTip = 'Specifies if the comment should be printed on the return receipt.';

            }
        }

        modify(Code)
        {
            Visible = false;
        }
    }
}