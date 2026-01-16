pageextension 55116 TlySalespersonPurchaserCard extends "Salesperson/Purchaser Card"
{
    layout
    {
        addafter("Job Title")
        {
            field("Order Shipping Location"; Rec."Order Shipping Location")
            {
                Caption = 'Order Shipping Location';
                ToolTip = 'Order Shipping Location';
                ApplicationArea = All;
            }

        }
        moveafter("Order Shipping Location"; "Phone No.", "E-Mail")

        addafter("E-Mail")
        {
            field(Manager; Rec.Manager)
            {
                Caption = 'Manager';
                ToolTip = 'Manager';
                ApplicationArea = All;
            }
            field("View Margin - Intranet"; Rec."View Margin - Intranet")
            {
                Caption = 'Intranet - View Margin';
                ToolTip = 'Intranet - View Margin';
                ApplicationArea = All;
            }
            field("View Mgr Pricing - Intranet"; Rec."View Mgr Pricing - Intranet")
            {
                Caption = 'Intranet - View Manager Pricing';
                ToolTip = 'Intranet - View Manager Pricing';
                ApplicationArea = All;
            }
        }
        moveafter("View Mgr Pricing - Intranet"; Blocked)

        modify("Commission %")
        {
            Visible = false;
        }

        modify("Next Task Date")
        {
            Visible = false;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
    }
}
