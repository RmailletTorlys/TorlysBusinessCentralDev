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
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number associated with the claim.';
                }
                group(OriginalInfo)
                {
                    Caption = 'Original Document Information';
                    field("Ship-to Code"; Rec."Ship-to Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the customer number associated with the claim.';
                    }
                    field("Invoice No."; Rec."Invoice No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Invoice No.';
                    }
                    field("Invoice Date"; Rec."Invoice Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Invoice Date';
                    }
                    field("Shipment Date"; Rec."Shipment Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Shipment Date';
                    }
                    field("Order No."; Rec."Order No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Order No.';
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
                        ToolTip = 'Location Code';
                    }
                }
                field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
                {
                    Caption = 'Created By';
                    ToolTip = 'Created By';
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Additional;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'Created Date';
                    ToolTip = 'Created Date';
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Additional;
                }
            }

            part(ClaimsOrderSubform; TlyClaimsTrackingSubform)
            {
                ApplicationArea = All;
                Enabled = true;
                SubPageLink = "Claim No." = field("No.");
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}