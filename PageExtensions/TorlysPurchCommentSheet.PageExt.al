pageextension 50068 "TorlysPurchCommentSheet" extends "Purch. Comment Sheet"
{
    layout
    {
        addafter(Code)
        {
            field(Type; Rec."Comment Type")
            {
                ApplicationArea = All;
                Caption = 'Comment Type';
                ToolTip = 'Specifies the type of comment.';

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
                ToolTip = 'Specifies if the comment should be printed on the purcahse receipt.';

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