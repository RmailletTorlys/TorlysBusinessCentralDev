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

            field("Open Order Count"; Rec."Open Order Count")
            {
                Caption = 'Open Order Count';
                ToolTip = 'Open Order Count';
                ApplicationArea = All;
            }

            field("Posted Invoice Count"; Rec."Posted Invoice Count")
            {
                Caption = 'Posted Invoice Count';
                ToolTip = 'Posted Invoice Count';
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