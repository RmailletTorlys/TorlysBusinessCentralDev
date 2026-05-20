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
            field("Intranet - View Margin"; Rec."View Margin - Intranet")
            {
                Caption = 'Intranet - View Margin';
                ToolTip = 'Intranet - View Margin';
                ApplicationArea = All;
            }
            field("Intranet - View Manager Pricing"; Rec."View Mgr Pricing - Intranet")
            {
                Caption = 'Intranet - View Manager Pricing';
                ToolTip = 'Intranet - View Manager Pricing';
                ApplicationArea = All;
            }

            field("Intranet - Edit Pallet Pricing"; Rec."Intranet - Edit Pallet Pricing")
            {
                Caption = 'Intranet - Edit Pallet Pricing';
                ToolTip = 'Intranet - Edit Pallet Pricing';
                ApplicationArea = All;
            }

            field("Intranet - Edit Project Pricing"; Rec."Intranet - Edit Proj. Pricing")
            {
                Caption = 'Intranet - Edit Project Pricing';
                ToolTip = 'Intranet - Edit Project Pricing';
                ApplicationArea = All;
            }

            field("Commission Guarantee Monthly"; Rec."Commission Guarantee Monthly")
            {
                Caption = 'Commission Guarantee Monthly';
                ToolTip = 'Commission Guarantee Monthly';
                ApplicationArea = All;
            }
            field("Commission Percentage Share"; Rec."Commission Percentage Share")
            {
                Caption = 'Commission Percentage Share';
                ToolTip = 'Commission Percentage Share';
                ApplicationArea = All;
            }
        }
        moveafter("Commission Percentage Share"; Blocked)

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
