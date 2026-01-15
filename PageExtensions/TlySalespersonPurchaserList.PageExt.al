pageextension 50014 TlySalespersonPurchaserList extends "Salespersons/Purchasers"
{
    layout
    {
        addafter(Name)
        {
            field("Job Title"; Rec."Job Title")
            {
                Caption = 'Job Title';
                ToolTip = 'Job Title';
                ApplicationArea = All;
            }
            field("Order Shipping Location"; Rec."Order Shipping Location")
            {
                Caption = 'Order Shipping Location';
                ToolTip = 'Order Shipping Location';
                ApplicationArea = All;
            }
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

        modify("Commission %")
        {
            Visible = false;
        }

        modify("Phone No.")
        {
            Visible = false;
        }
    }
}
