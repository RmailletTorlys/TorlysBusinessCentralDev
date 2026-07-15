page 51005 TlyProcBillOfLadingList
{
    ApplicationArea = Basic, Suite, Assembly;
    UsageCategory = Lists;
    Caption = 'Processed Bill of Lading List';
    CardPageId = TlyProcBillOfLading;
    DataCaptionFields = "No.";
    Editable = false;
    PageType = List;
    SourceTable = TlyProcessedBillOfLadingHeader;
    AdditionalSearchTerms = 'Bill of Lading, BOL';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Caption = 'No.';
                }

                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of transaction that is being posted for this bill of lading.';
                    Caption = 'Transaction Type';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Caption = 'Customer No.';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the ship-to address.';
                    Caption = 'Ship-to Code';
                }

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the ship-to address.';
                    Caption = 'Ship-to Name';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the location.';
                    Caption = 'Location Code';
                }
                field("Pickup Date"; Rec."Pickup Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of the pickup.';
                    Caption = 'Pickup Date';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the carrier.';
                    Caption = 'Shipping Agent Code';
                }
                field("Package Tracking No."; Rec."Package Tracking No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the tracking number of the carrier.';
                    Caption = 'Package Tracking No.';
                }
                field("Loaded By"; Rec."Loaded By")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Loaded By';
                    Caption = 'Loaded By';
                }
                field("Shipping Instructions"; Rec."Shipping Instructions 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the shipping instructions.';
                    Caption = 'Shipping Instructions';
                }
                // field("Shipping Instructions 2"; Rec."Shipping Instructions 2")
                // {
                //     ApplicationArea = Basic, Suite;
                //     ToolTip = 'Specifies the second line of the shipping instructions.';
                //     Caption = 'Shipping Instructions 2';
                // }
                field("Shipping Comment"; Rec."Shipping Comment")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Shipping Comment';
                    Caption = 'Shipping Comment';
                }
                field("Piece Count"; Rec."Piece Count")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of pieces.';
                    Caption = 'Piece Count';
                }
                field("Total Weight"; Rec."Weight - Total")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total weight.';
                    Caption = 'Total Weight';
                }
                field("Total Cases"; Rec."Cases - Total")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total number of cases.';
                    Caption = 'Total Cases';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'No. Printed';
                    Caption = 'No. Printed';
                }
                field("Last Print Date"; Rec."Last Print Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Last Print Date';
                    Caption = 'Last Print Date';
                }
                field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Created By';
                    Caption = 'Created By';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Created At';
                    Caption = 'Created At';
                }
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
        area(Navigation)
        {
            action("Co&mments")
            {
                ApplicationArea = Comments;
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page "Comment Sheet";
                RunPageLink = "Table Name" = const("Processed BOL"),
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
                    DocumentAttachmentRecord.SetFilter("Table ID", '55004');
                    DocumentAttachmentRecord.SetFilter("No.", Rec."No.");
                    DocumentAttachmentRecord.SetFilter("Document Type", 'Processed BOL');
                    DocumentAttachmentPage.SetTableView(DocumentAttachmentRecord);
                    DocumentAttachmentPage.RunModal();
                end;
            }
        }
    }

    views
    {
        view(TOR)
        {
            Caption = 'TOR';
            Filters = where("Location Code" = filter('TOR'));
            OrderBy = descending("Pickup Date");
        }
        view(CAL)
        {
            Caption = 'CAL';
            Filters = where("Location Code" = filter('CAL'));
            OrderBy = descending("Pickup Date");
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}