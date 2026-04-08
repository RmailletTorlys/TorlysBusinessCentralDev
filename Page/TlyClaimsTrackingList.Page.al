page 55020 TlyClaimsTrackingList
{
    ApplicationArea = Basic, Suite, Assembly;
    UsageCategory = Lists;
    Caption = 'Claims Tracking';
    CardPageId = TlyClaimsTracking;
    DataCaptionFields = "No.";
    Editable = false;
    PageType = List;
    SourceTable = TlyClaimsTrackingHeader;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'Specifies the customer number associated with the claim.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Sell-to Customer No.';
                    ToolTip = 'Specifies the customer number associated with the claim.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies the customer number associated with the claim.';
                }
                field("Original Invoice No."; Rec."Original Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Original Invoice Date"; Rec."Original Invoice Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Original Shipment Date"; Rec."Original Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Original Order No."; Rec."Original Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Original Order Date"; Rec."Original Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
            }
        }
    }
}