tableextension 50097 "Torlys Comment Line" extends "Comment Line"
{
    fields
    {

        field(50001; Type; Enum "Torlys Comment Type")
        {
            Caption = 'Type';
            ToolTip = 'Specifies the type of comment.';
        }

        field(50003; "Copy to Sales Order"; Boolean)
        {
            Caption = 'Copy to Sales Order';
            ToolTip = 'Specifies whether the comment line should be copied to the sales order.';
        }

        field(50004; "Copy to Purchase Order"; Boolean)
        {
            Caption = 'Copy to Purchase Order';
            ToolTip = 'Specifies whether the comment line should be copied to the purchase order.';
        }

        field(50005; "Print on Quote"; Boolean)
        {
            Caption = 'Copy to Quote';
            ToolTip = 'Specifies whether the comment line should be copied to the quote.';
        }

        field(50006; "Print on Pick Ticket"; Boolean)
        {
            Caption = 'Print on Pick Ticket';
            ToolTip = 'Specifies whether the comment line should be printed on the Pick Ticket.';
        }

        field(50007; "Print on Order Confirmation"; Boolean)
        {
            Caption = 'Print on Order Confirmation';
            ToolTip = 'Specifies whether the comment line should be printed on the Order Confirmation.';
        }

        field(50008; "Print on Shipment"; Boolean)
        {
            Caption = 'Print on Shipment';
            ToolTip = 'Specifies whether the comment line should be printed on the Shipment.';
        }

        field(50009; "Print on Invoice"; Boolean)
        {
            Caption = 'Print on Invoice';
            ToolTip = 'Specifies whether the comment line should be printed on the Invoice.';
        }

        field(50010; "Print on Credit Memo"; Boolean)
        {
            Caption = 'Print on Credit Memo';
            ToolTip = 'Specifies whether the comment line should be printed on the Credit Memo.';
        }

        field(50011; "Print on Return Authorization"; Boolean)
        {
            Caption = 'Print on Return Authorization';
            ToolTip = 'Specifies whether the comment line should be printed on the Return Authorization.';
        }

        field(50012; "Print on Return Receipt"; Boolean)
        {
            Caption = 'Print on Return Receipt';
            ToolTip = 'Specifies whether the comment line should be printed on the Return Receipt.';
        }
        field(50013; "Print on Purcahse Order"; Boolean)
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