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
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'External Document No.';
                }
                field("Tag Name"; Rec."Tag Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tag Name';
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