pageextension 50050 "TorlysSalespersonsPurchasers" extends "Salespersons/Purchasers"
{
    layout
    {
        addafter(Name)
        {
            field("Job Title"; Rec."Title")
            {
                Caption = 'Job Title';
                ToolTip = 'Job Title';
                ApplicationArea = All;
            }
        }

        moveafter("Job Title"; "Phone No.")

        addafter("Phone No.")
        {
            field("Email"; Rec."Email")
            {
                Caption = 'Email';
                ToolTip = 'Email';
                ApplicationArea = All;
            }

            field(Manager; Rec.Manager)
            {
                Caption = 'Manager';
                ToolTip = 'Manager';
                ApplicationArea = All;
            }

            field("Intranet - View Margin"; Rec."Intranet - View Margin")
            {
                Caption = 'Intranet - View Margin';
                ToolTip = 'Intranet - View Margin';
                ApplicationArea = All;
            }

            field("Intranet - View Manager Pricing"; Rec."Intranet - View Mgr Pricing")
            {
                Caption = 'Intranet - View Manager Pricing';
                ToolTip = 'Intranet - View Manager Pricing';
                ApplicationArea = All;
            }
        }
    }
}
