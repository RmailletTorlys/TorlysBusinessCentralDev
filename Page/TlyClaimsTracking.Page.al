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
                    Caption = 'Original Invoice Information';
                    field("Ship-to Code"; Rec."Ship-to Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the customer number associated with the claim.';
                    }
                    field("Invoice No."; Rec."Original Invoice No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Invoice No.';
                    }
                    field("Invoice Date"; Rec."Original Invoice Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Invoice Date';
                    }
                    field("Shipment Date"; Rec."Original Shipment Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Shipment Date';
                    }
                    field("Order No."; Rec."Original Order No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Order No.';
                    }
                    field("Order Date"; Rec."Original Order Date")
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

    actions
    {
        area(Promoted)
        {
            actionref(Comments_Promoted; "Co&mments")
            { }
            actionref(Attachments_Promoted; Attachments)
            { }
        }
        area(navigation)
        {
            action("Co&mments")
            {
                ApplicationArea = Comments;
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page "Comment Sheet";
                RunPageLink = "Table Name" = const("Claims Tracking"),
                                  "No." = field("No.");
                ToolTip = 'View or add comments for the record.';
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                trigger OnAction()
                var
                    DocumentAttachmentRecord: Record "Document Attachment";
                    DocumentAttachmentPage: Page "Document Attachment Details";
                    RecRef: RecordRef; //need this to establish record when attaching
                begin
                    RecRef.GetTable(Rec); //need this to establish record when attaching
                    DocumentAttachmentPage.OpenForRecRef(RecRef); //need this to establish record when attaching
                    DocumentAttachmentRecord.Reset;
                    DocumentAttachmentRecord.SetFilter("Table ID", '55007');
                    DocumentAttachmentRecord.SetFilter("No.", Rec."No.");
                    DocumentAttachmentRecord.SetFilter("Document Type", 'Claims Tracking');
                    DocumentAttachmentPage.SetTableView(DocumentAttachmentRecord);
                    DocumentAttachmentPage.RunModal();
                end;
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}