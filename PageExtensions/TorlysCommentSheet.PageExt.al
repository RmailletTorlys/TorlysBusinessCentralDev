pageextension 50124 "Torlys Comment Sheet" extends "Comment Sheet"
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

            field("Copy to Sales Order"; Rec."Copy to Sales Order")
            {
                ApplicationArea = All;
                Caption = 'Copy to Sales Order';
                ToolTip = 'Specifies if the comment should be copied to the sales order.';

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
            field("Copy to Purchase Order"; Rec."Copy to Purchase Order")
            {
                ApplicationArea = All;
                Caption = 'Copy to Purchase Order';
                ToolTip = 'Specifies if the comment should be copied to the purchase order.';

            }
            field("Print on Purchase Order"; Rec."Print on Purchase Order")
            {
                ApplicationArea = All;
                Caption = 'Print on Purchase Order';
                ToolTip = 'Specifies if the comment should be printed on the purchase order.';

            }
            field("Print on Purchase Receipt"; Rec."Print on Purchase Receipt")
            {
                ApplicationArea = All;
                Caption = 'Print on Purchase Receipt';
                ToolTip = 'Specifies if the comment should be printed on the purchase receipt.';

            }
            field("Print on Purchase Invoice"; Rec."Print on Purchase Invoice")
            {
                ApplicationArea = All;
                Caption = 'Print on Purchase Invoice';
                ToolTip = 'Specifies if the comment should be printed on the purchase invoice.';

            }
            field("Print on Purchase Credit Memo"; Rec."Print on Purchase Credit Memo")
            {
                ApplicationArea = All;
                Caption = 'Print on Purchase Credit Memo';
                ToolTip = 'Specifies if the comment should be printed on the purchase credit memo.';

            }
        }

        modify(Code)
        {
            Visible = false;
        }
    }
}