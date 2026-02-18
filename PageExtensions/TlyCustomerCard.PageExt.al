
pageextension 50021 TlyCustomerCard extends "Customer Card"
{
    DeleteAllowed = false;

    layout
    {
        moveafter("No."; Name, "Search Name")
        addafter("Search Name")
        {
            field("Collector ID"; Rec."Collector ID")
            {
                ApplicationArea = All;
                Caption = 'Collector ID';
                Visible = true;
                ToolTip = 'This field is the Primary Credit Collector assigned to the customer account.';
            }
        }

        moveafter("Collector ID"; "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the salesperson.';

            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 2';
                Visible = true;
                ToolTip = 'This field is the second salesperson assigned to the customer account.';
                Importance = Additional;
            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 2';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the second salesperson.';
                Importance = Additional;
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 3';
                Visible = true;
                ToolTip = 'This field is the third salesperson assigned to the customer account.';
                Importance = Additional;
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 3';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the third salesperson.';
                Importance = Additional;
            }

            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
                Importance = Additional;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(3);
                end;
            }

            field("Date Opened"; Rec."Date Opened")
            {
                ApplicationArea = All;
                Caption = 'Date Opened';
                Visible = true;
                ToolTip = 'This field is the date the customer account was opened.';
                Importance = Additional;
            }

            field("Date Closed"; Rec."Date Closed")
            {
                ApplicationArea = All;
                Caption = 'Date Closed';
                Visible = true;
                ToolTip = 'This field is the date the customer account was closed.';
                Importance = Additional;
            }

        }

        moveafter("Date Closed"; "Blocked", "Balance (LCY)", "Balance Due (LCY)")

        addafter("Balance Due (LCY)")
        {
            field("Outstanding Orders"; Rec."Outstanding Orders")
            {
                ApplicationArea = All;
                Caption = 'Outstanding Orders';
                Visible = true;
                ToolTip = 'This field is the number of outstanding orders for the customer account.';
            }
        }

        moveafter("Outstanding Orders"; "Credit Limit (LCY)")
        addafter("Credit Limit (LCY)")
        {
            field("Credit Limit Modified Date"; Rec."Credit Limit Modified Date")
            {
                ApplicationArea = All;
                Caption = 'Credit Limit Modified Date';
                Visible = true;
                ToolTip = 'This field is the date the credit limit was last modified.';
                Importance = Additional;
            }

            field("Credit Limit Modified By"; Rec."Credit Limit Modified By")
            {
                ApplicationArea = All;
                Caption = 'Credit Limit Modified By';
                Visible = true;
                ToolTip = 'This field is the user who last modified the credit limit.';
                Importance = Additional;
            }

            field("Prev. Credit Limit (LCY)"; Rec."Previous Credit Limit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Prev. Credit Limit (LCY)';
                Visible = true;
                ToolTip = 'This field is the previous credit limit of the customer account.';
                Importance = Additional;
            }

            field("Temp. Credit Limit (LCY)"; Rec."Temp. Credit Limit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Temp. Credit Limit (LCY)';
                Visible = true;
                ToolTip = 'This field is the temporary credit limit of the customer account.';
                Importance = Additional;
            }

            field("Temp. Credit Limit Expiry Date"; Rec."Temp. Credit Limit Expiry Date")
            {
                ApplicationArea = All;
                Caption = 'Temp. Credit Limit Expiry Date';
                Visible = true;
                ToolTip = 'This field is the date the temporary credit limit expires.';
                Importance = Additional;
            }
        }
        moveafter("Temp. Credit Limit Expiry Date"; "Document Sending Profile")

        addafter("Document Sending Profile")
        {
            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = true;
                ToolTip = 'This field is the user who created the customer account.';
                Importance = Additional;
            }

            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was created.';
                Importance = Additional;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("SystemModifiedAt"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was last modified.';
                Importance = Additional;
            }
        }

        moveafter("Address 2"; "City", "County", "Country/Region Code", "Post Code", ShowMap, "Phone No.")

        addafter("Phone No.")
        {
            field("Website"; Rec."Home Page")
            {
                ApplicationArea = All;
                Caption = 'Website';
                ToolTip = 'This field is the website of the customer account.';
            }
        }


        moveafter(Website; MobilePhoneNo, "Fax No.", "E-Mail", "Language Code")

        addafter("Bill-to Customer No.")
        {
            field("Credit Warnings"; Rec."Credit Warnings")
            {
                ApplicationArea = All;
                Caption = 'Credit Warnings';
                ToolTip = 'Specifies the number of times that the customer''s credit limit has been exceeded.';
            }
        }

        moveafter("Credit Warnings"; "Tax Liable", "Tax Area Code", "Tax Identification Type", "Registration Number", "VAT Registration No.", "Tax Exemption No.")

        addafter("Customer Posting Group")

        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Global Dimension 1 Code';
            }
        }

        addfirst(PricesandDiscounts)
        {
            field("Default Price List Code"; Rec."Default Price List Code")
            {
                ApplicationArea = All;
                Caption = 'Default Price List Code';
                Visible = true;
                ToolTip = 'This field is the default price list assigned to the customer account.';
            }
            field("Remove Regular Price On PL"; Rec."Remove Regular Price On PL")
            {
                ApplicationArea = All;
                Caption = 'Remove Regular Price On PL';
                Visible = true;
                ToolTip = 'Remove Regular Price On PL';
            }
        }

        addafter("Currency Code")
        {
            field("Restocking Fee %"; Rec."Restocking Fee %")
            {
                ApplicationArea = All;
                Caption = 'Restocking Fee %';
                DecimalPlaces = 2 : 1;
                ToolTip = 'Specifies the percentage of the item that is restocked when the item is restocked.';
            }

            field("Restocking Fee Minimum"; Rec."Restocking Fee Minimum")
            {
                ApplicationArea = All;
                Caption = 'Restocking Fee Minimum';
                DecimalPlaces = 2;
                ToolTip = 'Specifies the minimum amount of the item that is restocked when the item is restocked.';
            }

            group(Marketing)
            {
                Caption = 'Marketing';

                field(ShortcutDimCode5; ShortcutDimCode[5])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,5';
                    ToolTip = 'Global Dimension 5 Code';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = true;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(5);
                    end;
                }

                field("Club"; Rec."Club")
                {
                    ApplicationArea = All;
                    CaptionClass = 'Club';
                    ToolTip = 'Club';
                    Visible = true;
                }

                field("Power Up Level"; Rec."Power Up Level")
                {
                    ApplicationArea = All;
                    Caption = 'Power Up Level';
                    ToolTip = 'Specifies the level of the power up.';
                }

                field("Program Fees Amount (LCY)"; Rec."Program Fees Amount (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Program Fees Amount';
                    DecimalPlaces = 2;
                    ToolTip = 'Specifies the amount of the program fees that you have paid for the customer.';
                }

                field("Co-op Entitlement %"; Rec."Co-op Entitlement %")
                {
                    ApplicationArea = All;
                    Caption = 'Co-op Entitlement %';
                    DecimalPlaces = 2 : 1;
                    ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s co-op.';
                }

                field("Sample Allowance %"; Rec."Sample Allowance %")
                {
                    ApplicationArea = All;
                    Caption = 'Sample Allowance %';
                    DecimalPlaces = 2 : 1;
                    ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s sample.';
                }
            }

        }

        movefirst(Payments; "Application Method", "Payment Terms Code", "Payment Method Code", "Print Statements", "Last Statement No.", "Block Payment Tolerance")

        addafter("Block Payment Tolerance")
        {
            field("A/R Notes"; Rec."A/R Notes")
            {
                ApplicationArea = All;
                Caption = 'A/R Notes';
                ToolTip = 'Specifies the notes that you have entered for the customer.';
                Importance = Additional;
            }

            field("On Hold Count"; Rec."On Hold Count")
            {
                ApplicationArea = All;
                Caption = 'On Hold Count';
                ToolTip = 'Specifies the number of times that the customer has been put on hold.';
                Importance = Additional;
            }

            field("NSF Count"; Rec."NSF Count")
            {
                ApplicationArea = All;
                Caption = 'NSF Count';
                ToolTip = 'Specifies the number of times that the customer has been marked with NSF cheques.';
                Importance = Additional;
            }
        }

        moveafter("Ship-to Code"; "Location Code", "Reserve", "Shipping Advice")

        addafter("Shipping Advice")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = All;
                Caption = 'Freight Zone Code';
                ToolTip = 'Specifies the freight zone that the customer is assigned to.';
                Visible = false;
            }
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                ApplicationArea = All;
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                Visible = false;
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                ApplicationArea = All;
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                Visible = false;
            }
        }

        moveafter("Shipping Comment"; "Shipping Time")

        modify(Blocked)
        {
            Importance = Additional;
        }

        modify("Country/Region Code")
        {
            Importance = Additional;
        }

        modify(MobilePhoneNo)
        {
            Importance = Additional;
        }

        modify(County)
        {
            Importance = Additional;
        }

        modify("Post Code")
        {
            Importance = Additional;
        }

        modify(ShowMap)
        {
            Importance = Additional;
        }

        modify("Fax No.")
        {
            Importance = Additional;
        }

        modify("E-Mail")
        {
            Visible = false;
        }

        modify("Language Code")
        {
            Importance = Additional;
        }

        modify("Primary Contact No.")
        {
            Importance = Additional;
        }

        modify(ContactName)
        {
            Importance = Additional;
        }

        modify("Search Name")
        {
            ApplicationArea = All;
            Visible = true;
            ToolTip = 'This field is the name of the customer account.';
        }

        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify(BalanceAsVendor)
        {
            Visible = false;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        // modify("Document Sending Profile")
        // {
        //     Visible = false;
        // }
        modify(TotalSales2)
        {
            Visible = false;
        }
        modify(AdjCustProfit)
        {
            Visible = false;
        }
        modify(AdjProfitPct)
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify("Disable Search by Name")
        {
            Visible = false;
        }
        modify("Home Page")
        {
            Visible = false;
        }
        modify("Format Region")
        {
            Visible = false;
        }
        modify(GLN)
        {
            Visible = false;
        }
        modify("Use GLN in Electronic Document")
        {
            Visible = false;
        }
        modify("Copy Sell-to Addr. to Qte From")
        {
            Visible = false;
        }
        modify("Price Calculation Method")
        {
            Visible = false;
        }
        modify("Customer Price Group")
        {
            Visible = false;
        }
        modify("Customer Disc. Group")
        {
            Visible = false;
        }
        modify("Allow Line Disc.")
        {
            Visible = false;
        }
        modify("Invoice Disc. Code")
        {
            Visible = false;
        }
        modify("Prepayment %")
        {
            Visible = false;
        }
        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Intrastat Partner Type")
        {
            Visible = false;
        }
        modify("Reminder Terms Code")
        {
            Visible = false;
        }
        modify("Fin. Charge Terms Code")
        {
            Visible = false;
        }
        modify("Cash Flow Payment Terms Code")
        {
            Visible = false;
        }
        modify("Preferred Bank Account Code")
        {
            Visible = false;
        }
        modify("Bank Communication")
        {
            Visible = false;
        }
        modify("Check Date Format")
        {
            Visible = false;
        }
        modify("Check Date Separator")
        {
            Visible = false;
        }
        modify("Exclude from Pmt. Practices")
        {
            Visible = false;
        }
        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }
        modify("Base Calendar Code")
        {
            Visible = false;
        }
        modify("Customized Calendar")
        {
            Visible = false;
        }
        modify("Combine Shipments")
        {
            Visible = false;
        }
        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Visible = false;
        }
        modify("Address")
        {
            Importance = Promoted;
        }
        modify("City")
        {
            Importance = Promoted;
        }
        modify("Bill-to Customer No.")
        {
            Importance = Promoted;
        }
        modify("Application Method")
        {
            Importance = Additional;
        }
        modify("Payment Method Code")
        {
            Importance = Additional;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
        modify("Print Statements")
        {
            Importance = Additional;
        }
        modify("Last Statement No.")
        {
            Importance = Additional;
        }
        modify("Block Payment Tolerance")
        {
            Importance = Additional;
        }
        modify("Ship-to Code")
        {
            Importance = Promoted;
        }
        modify("Location Code")
        {
            Importance = Promoted;
        }
        modify("Reserve")
        {
            Importance = Additional;
        }
        modify("Shipping Advice")
        {
            Importance = Additional;
        }
        modify("Shipping Time")
        {
            Importance = Additional;
        }
        modify("Registration Number")
        {
            Importance = Additional;
        }
        modify("Shipping Agent Code")
        {
            Visible = false;
        }
    }

    actions
    {
        addlast(processing)
        {
            // action(SendStatementReview)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Print/Send Statement';
            //     Image = Email;

            //     trigger OnAction()
            //     var
            //         Cust: Record Customer;
            //         Choice: Integer;
            //         Options: Label 'Email,Print/Preview,Cancel';
            //         ReportId: Integer;
            //         Params: Text;
            //         RecRef: RecordRef;
            //         TmpBlob: Codeunit "Temp Blob";
            //         InStr: InStream;
            //         Email: Codeunit Email;
            //         EmailMsg: Codeunit "Email Message";
            //         FileName: Text;
            //         SubjectTxt: Text;
            //         BodyHtml: Text;
            //         ToAddr: Text;
            //         Rendered: Boolean;
            //         Err: Text;
            //         outstr: OutStream;
            //     begin
            //         Cust.Get(Rec."No.");
            //         ReportId := 50036;

            //         Choice := StrMenu(Options, 1);

            //         if Choice = 3 then
            //             exit;



            //         Cust.SetRange("No.", Rec."No.");
            //         RecRef.GetTable(Cust);

            //         Params := Report.RunRequestPage(ReportId);
            //         if Params = '' then
            //             exit;

            //         case Choice of
            //             1:
            //                 begin
            //                     // EMAIL FLOW (your existing logic)
            //                     Clear(TmpBlob);
            //                     TmpBlob.CreateOutStream(OutStr);
            //                     Rendered := TryRenderToPdf(ReportId, Params, RecRef, TmpBlob, Err);
            //                     if not Rendered then
            //                         Error('Could not render Customer Statement. Details: %1', Err);


            //                     TmpBlob.CreateInStream(InStr);

            //                     ToAddr := Cust."E-Mail";
            //                     if ToAddr = '' then
            //                         Error('Customer %1 has no email address.', Cust."No.");

            //                     SubjectTxt := StrSubstNo('Statement for %1 (%2)', Cust.Name, Cust."No.");
            //                     BodyHtml :=
            //                         StrSubstNo(
            //                             '<p>Hello %1,</p>' +
            //                             '<p>Please find your latest account statement attached.</p>' +
            //                             '<p>Regards,<br/>%2</p>',
            //                             Cust.Name, UserId());

            //                     FileName := StrSubstNo('Statement_%1_%2.pdf', Cust."No.", Format(Today(), 0, 9));

            //                     EmailMsg.Create(ToAddr, SubjectTxt, BodyHtml, true);
            //                     EmailMsg.AddAttachment(FileName, 'application/pdf', InStr);

            //                     Email.OpenInEditor(EmailMsg);
            //                 end;

            //             2:
            //                 begin
            //                     // PRINT / PREVIEW / EXPORT FLOW
            //                     Report.RunModal(ReportId, true, false, Cust);
            //                     // Report.Execute(ReportId, Params, RecRef);
            //                 end;
            //         end;
            //     end;
            // }
            action(SendStatementReview)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print/Send Statement';
                Image = Email;

                trigger OnAction()
                var
                    Cust: Record Customer;
                    Params: Text;
                    TmpBlob: Codeunit "Temp Blob";
                    InStr: InStream;
                    Choice: Integer;
                    OutStr: OutStream;
                    Email: Codeunit Email;
                    EmailMsg: Codeunit "Email Message";
                    SubjectTxt: Text;
                    BodyHtml: Text;
                    Options: Label 'Email,Print/Preview,Cancel';
                    // Must use a report variable
                    StatementReport: Report "Customer Statements TLY";
                begin
                    if not Cust.Get(Rec."No.") then exit;

                    Choice := StrMenu(Options, 1);
                    if (Choice = 0) or (Choice = 3) then exit;

                    // 1. Apply filter to the record
                    Cust.SetRange("No.", Rec."No.");

                    // 2. Get parameters from the request page
                    // Passing Cust.GetView() ensures the filter stays in the XML
                    // Params := StatementReport.RunRequestPage(Cust.GetFilters());
                    // if Params = '' then exit;

                    // Clear(StatementReport);

                    case Choice of
                        1: // EMAIL
                            begin
                                Params := StatementReport.RunRequestPage(Cust.GetFilters());
                                if Params = '' then exit;
                                Clear(StatementReport);
                                Clear(TmpBlob);
                                TmpBlob.CreateOutStream(OutStr);

                                // Call SaveAs on the INSTANCE, not the static Report object
                                StatementReport.SaveAs(Params, ReportFormat::Pdf, OutStr);

                                TmpBlob.CreateInStream(InStr);
                                SubjectTxt := StrSubstNo('Statement for %1 (%2)', Cust.Name, Cust."No.");
                                BodyHtml :=
                                    StrSubstNo(
                                        '<p>Hello %1,</p>' +
                                        '<p>Please find your latest account statement attached.</p>' +
                                        '<p>Regards,<br/>%2</p>',
                                        Cust.Name, UserId());
                                EmailMsg.Create(Cust."E-Mail", SubjectTxt, BodyHtml, true);
                                EmailMsg.AddAttachment('Statement.pdf', 'application/pdf', InStr);
                                Email.OpenInEditorModally(EmailMsg);
                            end;

                        2: // PRINT / PREVIEW
                            begin
                                // Execute handles both the XML parameters and the UI flow
                                // StatementReport.Execute(Params);
                                // Report.Run(Report::"Customer Statements TLY", true, false, Cust);
                                // if not Cust.Get(Rec."No.") then exit;

                                // 2. Apply the filter so the Request Page knows which customer to show
                                // Cust.SetRange("No.", Rec."No.");

                                // 3. Run the report directly
                                // Parameter 1: Report ID
                                // Parameter 2: TRUE (This shows the standard Request Page with Preview/Print/Email)
                                // Parameter 3: FALSE (Don't force it to a specific system printer)
                                // Parameter 4: Cust (Passes the filtered record)
                                Report.Run(Report::"Customer Statements TLY", true, false, Cust);
                            end;
                    end;
                end;
            }
        }


        addafter(ShipToAddresses)
        {
            action(Displays)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer Displays';
                Image = Database;
                RunObject = Page TlyCustomerDisplayList;
                RunPageLink = "CustNo." = field("No.");
                ToolTip = 'View or edit customer display programs for this customer.';
            }
        }

        addafter(ShipToAddresses_Promoted)
        {
            actionref(Displays_Promoted; Displays) { }
        }

        addfirst(Category_Report)
        {
            actionref(SendStatementReview1; SendStatementReview)
            {

            }
        }
        modify("Report Statement_Promoted")
        {
            Visible = false;
        }
    }

    protected var
        ShortcutDimCode: array[8] of Code[20];

    var
        LookupUserId: Codeunit TlyLookupUserID;
        CustLedgEntry: Record "Cust. Ledger Entry";
        DocumentMailing: Codeunit "Document-Mailing";
        R: Report 10072;



    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;

    [TryFunction]
    local procedure RenderToPdfInternal(ReportId: Integer; RequestPageXml: Text; RecRef: RecordRef; var TmpBlob: Codeunit "Temp Blob")
    var
        OutStr: OutStream;
    begin
        TmpBlob.CreateOutStream(OutStr);

        Report.SaveAs(
            ReportId,
            RequestPageXml,
            ReportFormat::Pdf,
            OutStr,
            RecRef);
    end;

    local procedure TryRenderToPdf(ReportId: Integer; RequestPageXml: Text; RecRef: RecordRef; var TmpBlob: Codeunit "Temp Blob"; var ErrorText: Text): Boolean
    begin
        if RenderToPdfInternal(ReportId, RequestPageXml, RecRef, TmpBlob) then
            exit(true);

        ErrorText := GetLastErrorText();
        exit(false);
    end;
}