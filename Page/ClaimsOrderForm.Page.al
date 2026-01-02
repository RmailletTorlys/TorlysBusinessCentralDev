page 51018 "Claims Order Form"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = TlyClaimsHeader;
    Caption = 'Claims Order Form';
    Editable = false;
    LinksAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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

            group(Lines)
            {
                Caption = 'Lines';
                part(ClaimsOrderSubform; "Claims Order Subform")
                {
                    ApplicationArea = All;
                    SubPageLink = "Claim No." = field("No.");
                }
            }
        }
    }



    procedure AssistEdit(ClaimsHeader: Record TlyClaimsHeader) Result: Boolean
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
        IsHandled: Boolean;

    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, ClaimsHeader, IsHandled, Result);
        if IsHandled then
            exit;

        SalesSetup.FindFirst();
        if not SalesSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(SalesSetup."Claims Tracking Nos.");

        exit(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(Rec: Record TlyClaimsHeader; ClaimsHeader: Record TlyClaimsHeader; var IsHandled: Boolean; var Result: Boolean)
    begin
    end;
}