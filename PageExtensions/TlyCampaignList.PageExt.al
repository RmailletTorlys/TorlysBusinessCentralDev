pageextension 55087 TlyCampaignList extends "Campaign List"
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
    }
}