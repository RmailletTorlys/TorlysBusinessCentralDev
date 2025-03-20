pageextension 50021 TorlysCustomerCard extends "Customer Card"
{
    layout
    {
        addafter("No.")
        {
            field("Collector ID"; Rec."Collector ID")
            {
                ApplicationArea = All;
                Caption = 'Collector ID';
                Visible = true;
                ToolTip = 'This field is the Primary Credit Collector assigned to the customer account.';
            }

            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Dimensions;
                ToolTip = 'Global Dimension 1 Code';
            }

            field("Global Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = Dimensions;
                ToolTip = 'Global Dimension 3 Code';
            }
        }


        addfirst(PricesandDiscounts)
        {
            field("Default Price List"; Rec."Default Price List Code")
            {
                ApplicationArea = All;
                Caption = 'Default Price List';
                Visible = true;
                ToolTip = 'This field is the default price list assigned to the customer account.';

            }
        }
    }

}