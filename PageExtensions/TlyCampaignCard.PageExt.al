pageextension 55086 TlyCampaignCard extends "Campaign Card"
{
    layout
    {
        addafter("Status Code")
        {
            field("Default Price List Code"; Rec."Default Price List Code")
            {
                Caption = 'Default Price List Code';
                ToolTip = 'Default Price List Code';
                ApplicationArea = All;
            }
        }

        modify("Salesperson Code")
        {
            Visible = false;
        }

        modify(Invoicing)
        {
            Visible = false;
        }
    }
}