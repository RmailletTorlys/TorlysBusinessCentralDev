page 51018 TlyClaimsTracking
{
    Caption = 'Claims Tracking';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = TlyClaimsTrackingHeader;
    ApplicationArea = Basic, Suite;
    DeleteAllowed = true;
    InsertAllowed = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Caption = 'No.';
                    Editable = false;
                    // trigger OnAssistEdit()
                    // begin
                    //     if Rec.AssistEdit(xRec) then
                    //         CurrPage.Update();
                    // end;
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

            group(Lines)
            {
                Caption = 'Lines';
                part(ClaimsOrderSubform; TlyClaimsTrackingSubform)
                {
                    ApplicationArea = All;
                    SubPageLink = "Claim No." = field("No.");
                }
            }
        }
    }
}