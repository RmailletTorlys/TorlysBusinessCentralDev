page 51001 TlyBillOfLadingList
{
    ApplicationArea = Basic, Suite, Assembly;
    UsageCategory = Lists;
    Caption = 'Bill of Lading List';
    CardPageId = TlyBillOfLading;
    DataCaptionFields = "No.";
    Editable = false;
    PageType = List;
    SourceTable = TlyBillOfLadingHeader;
    AdditionalSearchTerms = 'Bill of Lading, BOL';
    // Permissions = tabledata "Sales Shipment Header" = rm;

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
                    // trigger onValidate()
                    // begin
                    //     if Rec."Ship-to Code" = '' then
                    //         exit;
                    //     OnGetShipToCode(Rec."Ship-to Code", Rec."Customer No.");
                    // end;
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
            actionref(PrintBOL_Promoted; PrintBOL)
            { }
            actionref(PostAndPrintBOL_Promoted; PostAndPrintBOL)
            { }
            actionref(PrintShippingLabel_Promoted; PrintShippingLabel)
            { }
            actionref(Comments_Promoted; Comments)
            { }
        }
        area(Navigation)
        {
            action(PrintBOL)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Print BOL';
                Caption = 'Print BOL';
                Image = Print;
                trigger OnAction()
                var
                begin
                    BOLPrintPostChecks.BOLChecks(Rec);
                    TorlysDocPrint.PrintBillOfLading(Rec);
                end;
            }

            action(PostAndPrintBOL)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Post and Print BOL';
                Caption = 'Post and Print BOL';
                Image = Print;

                trigger OnAction()
                var
                    BOLHeader: Record TlyBillOfLadingHeader; //TLY-SD - 11/17/2026 - added so can post multiple at a time
                    ProcessedBOLHeader: Record TlyProcessedBillOfLadingHeader;
                    // BOLLine: Record TlyBillOfLadingLine;
                    // ProcessedBOLLine: Record TlyProcessedBillOfLadingLine;
                    // SalesShipmentHeader: Record "Sales Shipment Header";
                    // SalesHeader: Record "Sales Header";
                    // TransferShipmentHeader: Record "Transfer Shipment Header";
                    // TransferHeader: Record "Transfer Header";
                    // CommentLine: Record "Comment Line";
                    // CommentLine2: Record "Comment Line";
                    BOLNumber: Code[20]; //TLY-SD - 11/17/2026 - needed since posting is in CU
                begin
                    CurrPage.SetSelectionFilter(BOLHeader); //TLY-SD - 11/17/2026 - added so can post multiple at a time
                    if BOLHeader.FindSet() then begin //TLY-SD - 11/17/2026 - added so can post multiple at a time
                        repeat //TLY-SD - 11/17/2026 - added so can post multiple at a time

                            BOLPrintPostChecks.BOLChecks(BOLHeader);
                            // if Rec."No. Printed" = 0 then Error('Cannot post until it has first been printed.');
                            // if Rec."Package Tracking No." = '' then Error('Need to input tracking number before posting.');

                            // ProcessedBOLHeader.TransferFields(Rec);
                            // ProcessedBOLHeader.Insert();

                            // BOLLine.Reset;
                            // BOLLine.SetFilter("BOL No.", Rec."No.");
                            // if BOLLine.Find('-') then begin
                            //     repeat
                            //         ProcessedBOLLine.TransferFields(BOLLine);
                            //         ProcessedBOLLine.Insert();
                            //         if SalesShipmentHeader.Get(BOLLine."Shipment No.") then begin
                            //             SalesShipmentHeader."Package Tracking No." := Rec."Package Tracking No.";
                            //             SalesShipmentHeader.Modify(true);
                            //         end;
                            //         if SalesHeader.Get(1, BOLLine."Order No.") then begin
                            //             SalesHeader."Package Tracking No." := Rec."Package Tracking No.";
                            //             SalesHeader.Modify(true);
                            //         end;
                            //         if TransferShipmentHeader.Get(BOLLine."Shipment No.") then begin
                            //             TransferShipmentHeader."Package Tracking No." := Rec."Package Tracking No.";
                            //             TransferShipmentHeader.Modify(true);
                            //         end;
                            //         if TransferHeader.Get(BOLLine."Order No.") then begin
                            //             TransferHeader."Package Tracking No." := Rec."Package Tracking No.";
                            //             TransferHeader.Modify(true);
                            //         end;
                            //     until BOLLine.Next = 0;
                            // end;

                            // //TLY-SD - 10/01/2025 - start
                            // //copy comments from Open BOL to Processed BOL
                            // CommentLine.SetFilter("Table Name", 'Bill of Lading');
                            // CommentLine.SetRange("No.", Rec."No.");
                            // if CommentLine.FindSet() then
                            //     repeat
                            //         CommentLine2 := CommentLine;
                            //         CommentLine2."Table Name" := CommentLine."Table Name"::"Processed BOL";
                            //         CommentLine2."No." := Rec."No.";
                            //         CommentLine2.Insert();
                            //         CommentLine.Delete(true);
                            //     until CommentLine.Next() = 0;
                            // //TLY-SD - 10/01/2025 - end

                            // Message('%1 has been posted.', Rec."No.");
                            // BOLLine.DeleteAll();
                            // CurrPage.Update();
                            // Rec.Delete();
                            // Commit();
                            BOLPrintPostChecks.BOLPost(BOLHeader, BOLNumber); //TLY-SD - 11/17/2026 - move to CU
                            ProcessedBOLHeader.Reset(); //TLY-SD - 11/17/2026 - needed since posting is in CU
                            ProcessedBOLHeader.SetRange("No.", BOLNumber); //TLY-SD - 11/17/2026 - needed since posting is in CU
                            if ProcessedBOLHeader.Find('-') then //TLY-SD - 11/17/2026 - needed since posting is in CU
                                TorlysDocPrint.PrintProcessedBillOfLading(ProcessedBOLHeader);

                        until BOLHeader.Next() = 0; //TLY-SD - 11/17/2026 - added so can post multiple at a time
                    end; //TLY-SD - 11/17/2026 - added so can post multiple at a time
                end;
            }

            action(PrintShippingLabel)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Print Shipping Label';
                Caption = 'Print Shipping Label';
                Image = Print;
                trigger OnAction()
                begin
                    TorlysDocPrint.PrintBOLShippingLabel(Rec);
                end;
            }

            action(Comments)
            {
                ApplicationArea = Comments;
                Caption = 'Comments';
                Image = ViewComments;
                RunObject = Page "Comment Sheet";
                RunPageLink = "Table Name" = const("Bill of Lading"),
                                  "No." = field("No.");
                ToolTip = 'View or add comments for the record.';
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
        BOLPrintPostChecks: Codeunit TlyBOLCheckPrintPost;
        TorlysDocPrint: Codeunit TlyDocumentPrint;
        LookupUserId: Codeunit TlyLookupUserID;
}