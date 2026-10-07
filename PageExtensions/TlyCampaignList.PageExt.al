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

            field("Open Order Count"; Rec."Open Order Count")
            {
                Caption = 'Open Order Count';
                ToolTip = 'Open Order Count';
                ApplicationArea = All;
                trigger OnDrillDown()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset;
                    SalesHeader.SetFilter("Document Type", 'Order');
                    SalesHeader.SetFilter("Campaign No.", Rec."No.");
                    Page.Run(9305, SalesHeader);
                end;
            }

            field("Open Credit Count"; Rec."Open Credit Count")
            {
                Caption = 'Open Credit Count';
                ToolTip = 'Open Credit Count';
                ApplicationArea = All;
                trigger OnDrillDown()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset;
                    SalesHeader.SetFilter("Document Type", 'Credit Memo');
                    SalesHeader.SetFilter("Campaign No.", Rec."No.");
                    Page.Run(9302, SalesHeader);
                end;
            }

            field("Posted Invoice Count"; Rec."Posted Invoice Count")
            {
                Caption = 'Posted Invoice Count';
                ToolTip = 'Posted Invoice Count';
                ApplicationArea = All;
            }

            field("Posted Credit Count"; Rec."Posted Credit Count")
            {
                Caption = 'Posted Credit Count';
                ToolTip = 'Posted Credit Count';
                ApplicationArea = All;
            }
        }

        modify("Salesperson Code")
        {
            Visible = false;
        }
    }
}