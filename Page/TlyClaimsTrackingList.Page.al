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
                    ToolTip = 'Specifies the unique number of the claim.';
                }
                field("Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number associated with the claim.';
                }
                field("Order Date"; Rec."Original Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
            }
        }
    }
}