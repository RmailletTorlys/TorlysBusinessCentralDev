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