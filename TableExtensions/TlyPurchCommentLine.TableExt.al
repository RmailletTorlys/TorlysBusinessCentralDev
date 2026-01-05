tableextension 50043 TlyPurchCommentLine extends "Purch. Comment Line"

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

        field(50013; "Print on Purchase Order"; Boolean)
        {
            Caption = 'Print on Purchase Order';
            ToolTip = 'Specifies whether the comment line should be printed on the Purchase Order.';
        }
        field(50014; "Print On Purchase Receipt"; Boolean)
        {
            Caption = 'Print on Purchase Receipt';
            ToolTip = 'Specifies whether the comment line should be printed on the Purchase Receipt.';
        }
        field(50015; "Print On Purchase Invoice"; Boolean)
        {
            Caption = 'Print on Purchase Invoice';
            ToolTip = 'Specifies whether the comment line should be printed on the Purchase Invoice.';
        }
        field(50016; "Print On Purchase Credit Memo"; Boolean)
        {
            Caption = 'Print on Purchase Credit Memo';
            ToolTip = 'Specifies whether the comment line should be printed on the Purchase Credit Memo.';
        }
    }
}