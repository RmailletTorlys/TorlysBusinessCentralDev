pageextension 50042 TlySalesOrder extends "Sales Order"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")

        // moveafter("Sell-to Customer No."; "Ship-to Code", "Sell-to Customer Name", "Sell-to Address", "Sell-to Address 2", "Sell-to City", "Sell-to County", "Sell-to Post Code", "Sell-to Country/Region Code")

        addafter("Sell-to Customer No.")
        {
            field("Ship-to Code1"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
                Editable = ShipToOptions = ShipToOptions::"Alternate Shipping Address";
                ShowMandatory = Rec."Temporary Hold" = false;
            }
        }

        moveafter("Ship-to Code1"; "Sell-to Customer Name", "Sell-to Address", "Sell-to Address 2", "Sell-to City", "Sell-to County", "Sell-to Post Code", "Sell-to Country/Region Code")

        addafter("Sell-to Country/Region Code")
        {
            field("Order Method"; Rec."Order Method")
            {
                Caption = 'Order Method';
                ToolTip = 'Order Method';
                ApplicationArea = All;
                ShowMandatory = Rec."Temporary Hold" = false;
                trigger OnValidate()
                begin
                    if (Rec."Order Method" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
            }
        }

        moveafter("Order Method"; "Your Reference", "External Document No.")

        addafter("External Document No.")
        {
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
                ShowMandatory = Rec."Temporary Hold" = false;
                trigger OnValidate()
                begin
                    if (Rec."Tag Name" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
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
                ShowMandatory = true;
                // ShowMandatory = Rec."Temporary Hold" = false;
                trigger OnValidate()
                begin
                    if (MPOCount <> 0) and (ShortcutDimCode[3] = 'BUILDER') then
                        Message('There are %1 MPOs tied to this customer.', MPOCount);
                    if (MPOCount <> 0) and (ShortcutDimCode[3] = 'RENTAL') then
                        Message('There are %1 MPOs tied to this customer.', MPOCount);
                    if (ShortcutDimCode[3] = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released')
                    else
                        ValidateShortcutDimension(3);
                end;
            }
            // field("MPO Count"; MPOCount)
            // {
            //     Caption = 'MPO Count';
            //     ToolTip = 'MPO Count';
            //     ApplicationArea = All;
            //     Editable = false;
            //     Visible = (ShortcutDimCode[3] = 'BUILDER');
            // }
            field("Order Type"; Rec."Order Type")
            {
                Caption = 'Order Type';
                ToolTip = 'Order Type';
                ApplicationArea = All;
                ShowMandatory = Rec."Temporary Hold" = false;
                trigger OnValidate()
                begin
                    if (Rec."Order Type" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
            }
            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
                Importance = Additional;
                trigger OnValidate()
                begin
                    if (Rec."Temporary Hold") and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot change if order released');
                end;
            }
        }

        moveafter("Temporary Hold"; "Posting Date", "Order Date")

        addafter("Order Date")
        {
            field("Order Time"; Rec."Order Time")
            {
                Caption = 'Order Time';
                ToolTip = 'Order Time';
                ApplicationArea = All;
                Importance = Additional;
                Editable = false;
            }
        }

        moveafter("Order Time"; "Location Code", "Shipment Date")

        addafter("Shipment Date")
        {
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                ApplicationArea = All;
                Importance = Standard;
                ShowMandatory = Rec."Temporary Hold" = false;
                trigger OnValidate()
                begin
                    if (Rec."Shipping Instructions" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
            }
            field("Order Comment"; Rec."Order Comment")
            {
                Caption = 'Order Comment';
                ToolTip = 'Order Comment';
                ApplicationArea = All;
                Importance = Standard;
            }
        }
        moveafter("Order Comment"; Status)

        addafter(Status)
        {
            field("No. Printed"; Rec."No. Printed")
            {
                Caption = 'Quantity Printed';
                ToolTip = 'Quantity Printed';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
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
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified Date';
                ToolTip = 'Modified Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
        }

        addfirst("Invoice Details")
        {
            field("On Hold"; Rec."On Hold")
            {
                Caption = 'On Hold';
                ToolTip = 'On Hold';
                ApplicationArea = All;
                Importance = Promoted;
                Editable = false;
            }
        }

        moveafter("On Hold"; "Currency Code")

        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                Caption = 'Currency Factor';
                ToolTip = 'Currency Factor';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Currency Factor"; "Customer Posting Group", "Payment Method Code", "Payment Terms Code", "Due Date", "Pmt. Discount Date", "Payment Discount %", "Tax Liable", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field("Tax Exemption No."; Rec."Tax Exemption No.")
            {
                Caption = 'Tax Exemption No.';
                ToolTip = 'Tax Exemption No.';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Tax Exemption No."; "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                Caption = 'Salesperson Code 2';
                ToolTip = 'Salesperson Code 2';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                Caption = 'Salesperson Commission 2';
                ToolTip = 'Salesperson Commission 2';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                Caption = 'Salesperson Code 3';
                ToolTip = 'Salesperson Code 3';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                Caption = 'Salesperson Commission 3';
                ToolTip = 'Salesperson Commission 3';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter(ShippingOptions; "Ship-to Code")

        addafter("Ship-to Code")
        {
            field("Temporary Posting Hold"; Rec."Temporary Posting Hold")
            {
                Caption = 'Temporary Posting Hold';
                ToolTip = 'Temporary Posting Hold';
                ApplicationArea = All;
                Importance = Additional;

            }

        }

        moveafter("Shipping Agent Code"; "Shipping Agent Service Code")

        addafter("Shipping Agent Service Code")
        {
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Importance = Standard;
                MultiLine = true;
            }
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
                ApplicationArea = All;
                Importance = Standard;
                TableRelation = TlyFreightZone;
            }
        }

        moveafter("Freight Zone Code"; "Shipping Advice")

        addafter(BillToOptions)
        {
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                Caption = 'Bill-to Customer No.';
                ToolTip = 'Bill-to Customer No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        addafter(Control82)
        {
            group("Pick Slip Info")
            {
                Caption = 'Pick Slip Info';
                field("No. Pick Slips Printed"; Rec."No. Pick Slips Printed")
                {
                    Caption = 'No. Pick Slips Printed';
                    ToolTip = 'No. Pick Slips Printed';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }
                field("Pick Slip Printed By"; Rec."Pick Slip Printed By")
                {
                    Caption = 'Pick Slip Printed By';
                    ToolTip = 'Pick Slip Printed By';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }
                field("Pick Slip Printed Date"; Rec."Pick Slip Printed Date")
                {
                    Caption = 'Pick Slip Printed Date';
                    ToolTip = 'Pick Slip Printed Date';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }
                field("Pick Slip Printed Time"; Rec."Pick Slip Printed Time")
                {
                    Caption = 'Pick Slip Printed Time';
                    ToolTip = 'Pick Slip Printed Time';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }
            }
        }

        addafter("Shipping and Billing")
        {
            group("Marketing")
            {
                Caption = 'Marketing';
                // grid(Section1)
                // {
                group(Details)
                {
                    field(ShortcutDimCode5; ShortcutDimCode[5])
                    {
                        ApplicationArea = Dimensions;
                        CaptionClass = '1,2,5';
                        ToolTip = 'Global Dimension 5 Code';
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                        Visible = true;
                        ShowMandatory = true;
                        // ShowMandatory = Rec."Temporary Hold" = false;
                        trigger OnValidate()
                        begin
                            if (ShortcutDimCode[5] = '') and (Rec.Status = Rec.Status::Released) then
                                Error('Cannot delete if order released')
                            else
                                ValidateShortcutDimension(5);
                        end;
                    }
                    field("Club"; Rec."Club")
                    {
                        Caption = 'Club';
                        ToolTip = 'Club';
                        ApplicationArea = All;
                        Importance = Standard;
                    }
                    field("Power Up Level"; Rec."Power Up Level")
                    {
                        Caption = 'Power Up Level';
                        ToolTip = 'Power Up Level';
                        ApplicationArea = All;
                        Importance = Standard;
                    }
                    field("Sample Allowance Exclusion"; Rec."Sample Allowance Exclusion")
                    {
                        Caption = 'Sample Allowance Exclusion';
                        ToolTip = 'Sample Allowance Exclusion';
                        ApplicationArea = All;
                        Importance = Standard;
                    }
                }
                // }
                // grid(ManufacturingGrid)
                // {
                group(Manufacturing)
                {
                    field("MK Required"; Rec."MK Required")
                    {
                        Caption = 'MK Required';
                        ToolTip = 'MK Required';
                        ApplicationArea = All;
                    }
                    field("MK Required Type"; Rec."MK Required Type")
                    {
                        Caption = 'MK Required Type';
                        ToolTip = 'MK Required Type';
                        ApplicationArea = All;
                    }
                    field("MK Staged"; Rec."MK Staged")
                    {
                        Caption = 'MK Staged';
                        ToolTip = 'MK Staged';
                        ApplicationArea = All;
                    }

                    field("MK Staged Quantity"; Rec."MK Staged Quantity")
                    {
                        Caption = 'MK Staged Quantity';
                        ToolTip = 'MK Staged Quantity';
                        ApplicationArea = All;
                    }
                    field("MK Staged Location"; Rec."MK Staged Location")
                    {
                        Caption = 'MK Staged Location';
                        ToolTip = 'MK Staged Location';
                        ApplicationArea = All;
                    }

                    field("MK Intransit"; Rec."MK Intransit")
                    {
                        Caption = 'MK Intransit';
                        ToolTip = 'MK Intransit';
                        ApplicationArea = All;
                    }
                    field("MK Received"; Rec."MK Received")
                    {
                        Caption = 'MK Received';
                        ToolTip = 'MK Received';
                        ApplicationArea = All;
                    }
                }
                // }
            }
        }

        modify("Sell-to Customer No.")
        {
            Importance = Standard;
            Visible = true;
        }

        modify("Your Reference")
        {
            Importance = Standard;
            Caption = 'Ordered By';
            ShowMandatory = Rec."Temporary Hold" = false;
            trigger OnBeforeValidate()
            begin
                if (Rec."Your Reference" = '') and (Rec.Status = Rec.Status::Released) then
                    Error('Cannot delete if order released');
            end;
        }

        modify("Sell-to")
        {
            Visible = false;
        }

        modify("Shipment Method Code")
        {
            Importance = Standard;
            Caption = 'Shipment Method Code';
            Visible = false;
        }

        modify("Shipping Agent Code")
        {
            Importance = Standard;
            Caption = 'Shipping Agent Code';
        }

        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
            ToolTip = 'Ship-to Code';
            Editable = ShipToOptions = ShipToOptions::"Alternate Shipping Address";
            ShowMandatory = Rec."Temporary Hold" = false;
        }

        modify("BillToOptions")
        {
            Visible = true;
        }

        modify(Control1900201301)
        {
            Visible = false;
        }

        modify("Sell-to Address")
        {
            Importance = Additional;
        }

        modify("Sell-to Address 2")
        {
            Importance = Additional;
        }

        modify("Sell-to City")
        {
            Importance = Additional;
        }

        modify("Sell-to County")
        {
            Importance = Additional;
        }

        modify("Sell-to Post Code")
        {
            Importance = Additional;
        }

        modify("Sell-to Country/Region Code")
        {
            Importance = Additional;
        }

        modify("Sell-to Phone No.")
        {
            Importance = Additional;
        }

        modify("Order Date")
        {
            Importance = Additional;
        }

        modify("Posting Date")
        {
            Importance = Additional;
        }

        modify("Salesperson Code")
        {
            Importance = Standard;
            ShowMandatory = Rec."Temporary Hold" = false;
            trigger OnBeforeValidate()
            begin
                if (Rec."Salesperson Code" = '') and (Rec.Status = Rec.Status::Released) then
                    Error('Cannot delete if order released');
            end;
        }

        modify("Requested Delivery Date")
        {
            Visible = false;
        }

        modify("Payment Terms Code")
        {
            Importance = Promoted;
        }

        modify("Shipping Agent Service Code")
        {
            Importance = Standard;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
            ShowMandatory = Rec."Temporary Hold" = false;
        }
        modify("Currency Code")
        {
            Importance = Additional;
        }
        modify("Gen. Bus. Posting Group")
        {
            visible = false;
        }
        modify("Customer Posting Group")
        {
            Importance = Additional;
        }
        modify("Tax Liable")
        {
            Importance = Standard;
        }
        modify("Tax Area Code")
        {
            Importance = Standard;
            ShowMandatory = Rec."Temporary Hold" = false;
        }

        modify("Sell-to Contact")
        {
            Visible = false;
        }

        modify("Ship-to Contact")
        {
            Visible = false;
        }

        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }

        modify("Sell-to E-Mail")
        {
            Visible = false;
        }

        modify(BillToContactEmail)
        {
            Visible = false;
        }

        modify("Sell-to Contact No.")
        {
            Visible = false;
        }

        modify("No. of Archived Versions")
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Promised Delivery Date")
        {
            Visible = false;
        }

        modify("Campaign No.")
        {
            Visible = false;
        }

        modify("Opportunity No.")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Work Description")
        {
            Visible = false;
        }

        modify("Company Bank Account Code")
        {
            Visible = false;
        }

        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }

        modify(SelectedPayments)
        {
            Visible = false;
        }

        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }

        modify("Outbound Whse. Handling Time")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Shipping Time")
        {
            Visible = false;
        }

        modify("Late Order Shipping")
        {
            Visible = false;
        }

        modify("Combine Shipments")
        {
            Visible = false;
        }

        modify("Completely Shipped")
        {
            Visible = false;
        }

        modify("Bill-to Name")
        {
            Editable = false;
        }

        modify("Bill-to Address")
        {
            Editable = false;
        }

        modify("Bill-to Address 2")
        {
            Editable = false;
        }

        modify("Bill-to City")
        {
            Editable = false;
        }

        modify("Bill-to County")
        {
            Editable = false;
        }

        modify("Bill-to Post Code")
        {
            Editable = false;
        }

        modify("Bill-to Country/Region Code")
        {
            Editable = false;
        }

        modify("Bill-to Contact No.")
        {
            visible = false;
        }

        modify("Bill-to Contact")
        {
            visible = false;
        }

        modify(BillToContactPhoneNo)
        {
            visible = false;
        }

        modify(BillToContactMobilePhoneNo)
        {
            visible = false;
        }

        modify("No.")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Editable = false;
            Importance = Additional;
            ShowMandatory = Rec."Temporary Hold" = false;
        }

        modify("Payment Discount %")
        {
            Importance = Additional;
        }

        modify("Ship-to Country/Region Code")
        {
            Importance = Standard;
        }

        modify("Shipping Advice")
        {
            Importance = Standard;
        }

        modify("External Document No.")
        {
            Importance = Standard;
            trigger OnBeforeValidate()
            begin
                if (Rec."External Document No." = '') and (Rec.Status = Rec.Status::Released) then
                    Error('Cannot delete if order released');
            end;
        }
        modify("Location Code")
        {
            ShowMandatory = Rec."Temporary Hold" = false;
        }
    }

    actions
    {
        addafter("Print Confirmation_Promoted")
        {
            actionref(PrintLabel; "Print Label")
            { }
        }
        addlast(Category_Category11)
        {

            // actionref(PrintLabel; "Print Label")
            // { }
            actionref(B13_Sales; "B13 Sales")
            {
            }
            actionref(B13_Purchase; "B13 Purchase")
            {
            }
            actionref(SendEmailConfirmationTLY1; SendEmailConfirmationTLY)
            { }
        }

        modify(SendEmailConfirmation)
        {
            Visible = false;
        }

        addbefore("Print Confirmation")
        {
            action(SendEmailConfirmationTLY)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Email Confirmation';
                Image = Email;

                trigger OnAction()
                var
                    CustomReportSelection: Record "Custom Report Selection";
                    SalesHeader: Record "Sales Header";
                    EmailMsg: Codeunit "Email Message";
                    Email: Codeunit "Email";
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    RecipientList: List of [Text];
                    EmailAddr: Text;
                    ReportID: Integer;
                begin
                    // 1. Get Layout details for the BILL-TO Customer
                    CustomReportSelection.SetRange("Source Type", Database::Customer);
                    CustomReportSelection.SetRange("Source No.", Rec."Bill-to Customer No.");
                    CustomReportSelection.SetRange(Usage, CustomReportSelection.Usage::"S.Order");

                    if CustomReportSelection.FindFirst() then begin
                        EmailAddr := CustomReportSelection."Send To Email";
                        ReportID := CustomReportSelection."Report ID";
                    end;

                    // 2. Fallbacks if Layout is missing
                    if EmailAddr = '' then EmailAddr := Rec."Sell-to E-Mail";
                    if ReportID = 0 then ReportID := Report::"Standard Sales - Order Conf.";

                    // 3. Handle multiple emails (split by semicolon)
                    if EmailAddr.Contains(';') then
                        RecipientList := EmailAddr.Split(';')
                    else
                        RecipientList.Add(EmailAddr);

                    // 4. Generate the Attachment
                    SalesHeader.SetRange("Document Type", Rec."Document Type");
                    SalesHeader.SetRange("No.", Rec."No.");
                    TempBlob.CreateOutStream(OutStr);
                    Report.SaveAs(ReportID, '', ReportFormat::Pdf, OutStr, SalesHeader);
                    TempBlob.CreateInStream(InStr);

                    // 5. Create and Open Editor
                    EmailMsg.Create(RecipientList, 'Order Confirmation ' + Rec."No.", '', true);
                    EmailMsg.AddAttachment('Order_' + Rec."No." + '.pdf', 'application/pdf', InStr);

                    // Note: In v27.2, use OpenInEditor
                    Email.OpenInEditor(EmailMsg, Enum::"Email Scenario"::Default);
                end;


            }

        }

        addfirst(Action96)
        {
            action("Print Label")
            {
                ApplicationArea = Warehouse;
                Caption = 'Print Label';
                Image = Print;
                ToolTip = 'Print label for the sales order.';
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    TorlysDocPrint.PrintSalesOrderLabel(Rec);
                end;
            }
        }
        addlast(Action96)
        {
            // action("Print Label")
            // {
            //     ApplicationArea = Warehouse;
            //     Caption = 'Print Label';
            //     Image = Print;
            //     ToolTip = 'Print label for the sales order.';
            //     trigger OnAction()
            //     var
            //         SalesHeader: Record "Sales Header";
            //         TorlysDocPrint: Codeunit TlyDocumentPrint;
            //     begin
            //         TorlysDocPrint.PrintSalesOrderLabel(Rec);
            //     end;
            // }
            action("B13 Sales")
            {
                Caption = 'Print B13 Sales';
                Image = Print;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    // SalesLine: Record "Sales Line";
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    // SalesLine.SetFilter("Document No.", Rec."No.");
                    // Report.RunModal(50023, true, false, SalesLine);
                    TorlysDocPrint.PrintB13SalesFromSO(Rec);
                end;
            }
            action("B13 Purchase")
            {
                Caption = 'Print B13 Purchase';
                Image = Print;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    // SalesLine: Record "Sales Line";
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    // SalesLine.SetFilter("Document No.", Rec."No.");
                    // Report.RunModal(50020, true, false, SalesLine);
                    TorlysDocPrint.PrintB13PurchaseFromSO(Rec);
                end;
            }
        }

        addbefore(Category_New)
        {
            group("Customer History")
            {
                Visible = true;
                Caption = 'Customer History';
                actionref("OpenSalesOrders"; "Open Sales Orders")
                {
                }
                actionref("PostedSalesInvoices"; "Posted Sales Invoices")
                {
                }
                actionref("OpenCreditMemos"; "Open Credit Memos")
                {
                }
                actionref("OpenReturnOrders"; "Open Return Orders")
                {
                }
                actionref("PostedCreditMemos"; "Posted Credit Memos")
                {
                }
            }
        }

        addbefore(Category_New)
        {
            group("Credit Hold")
            {
                Visible = true;
                Caption = 'Credit Hold';
                actionref("RemoveCreditHold"; "Remove Credit Hold")
                {
                }
                actionref("PlaceOnCreditHold"; "Place On Credit Hold")
                {
                }
            }
        }

        addafter("Credit Hold")
        {
            actionref("AddFreight"; "Add Freight")
            {
            }
        }

        addfirst("F&unctions")
        {
            action(RemoveBOL)
            {
                ApplicationArea = All;
                Caption = 'Remove BOL #';
                Image = CheckList;
                ToolTip = 'Clear the BOL # from the current order.';
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    RemoveBOL: Boolean;
                begin
                    RemoveBOL := Dialog.Confirm('This will just remove the BOL # from this OR, the BOL line will still be populated. Proceed?');
                    if RemoveBOL then begin
                        SalesHeader.Reset();
                        SalesHeader.SetRange("No.", Rec."No.");
                        if SalesHeader.Find('-') then begin
                            SalesHeader."No. Pick Slips Printed" := 0;
                            SalesHeader."Pick Slip Printed By" := '';
                            SalesHeader."Pick Slip Printed Date" := 0D;
                            SalesHeader."Pick Slip Printed Time" := 0T;
                            SalesHeader."Picked By" := '';
                            SalesHeader."Audited By" := '';
                            SalesHeader."Last Shipping No." := '';
                            SalesHeader."BOL No." := '';
                            SalesHeader."Package Tracking No." := '';
                            SalesHeader.Modify(true);
                            Message('BOL # (plus 8 other fields) removed from %1.', Rec."No.");
                        end;
                    end;
                end;
            }
            action("Open Sales Orders")
            {
                Caption = 'Open Sales Orders';
                ToolTip = 'View open sales orders for this customer';
                ApplicationArea = All;
                Image = Order;
                RunObject = Page "Sales Lines";
                RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const(Order);
            }
            action("Posted Sales Invoices")
            {
                Caption = 'Posted Sales Invoices';
                ToolTip = 'View posted sales invoices for this customer';
                ApplicationArea = All;
                Image = Invoice;
                RunObject = Page "Posted Sales Invoice Lines";
                RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No.");
            }
            action("Open Credit Memos")
            {
                Caption = 'Open Credit Memos';
                ToolTip = 'View open credit memos for this customer';
                ApplicationArea = All;
                Image = CreditMemo;
                RunObject = Page "Sales Lines";
                RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const("Credit Memo");
            }
            action("Open Return Orders")
            {
                Caption = 'Open Return Orders';
                ToolTip = 'View open return orders for this customer';
                ApplicationArea = All;
                Image = ReturnOrder;
                RunObject = Page "Sales Lines";
                RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const("Return Order");
            }
            action("Posted Credit Memos")
            {
                Caption = 'Posted Credit Memos';
                ToolTip = 'View posted credt memos for this customer';
                ApplicationArea = All;
                Image = PostedCreditMemo;
                RunObject = Page "Posted Sales Credit Memo Lines";
                RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No.");
            }
            action("Remove Credit Hold")
            {
                ToolTip = 'Removes the Credit hold on an Order.';
                Caption = 'Remove Credit Hold';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    TorlysCreditHold.RemoveCreditHold(Rec, xRec);
                end;
            }
            action("Place On Credit Hold")
            {
                ToolTip = 'Places selected Order(s) on Credit Hold.';
                Caption = 'Place On Credit Hold';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    TorlysCreditHold.PlaceOnCreditHold(Rec, xRec);
                end;
            }

            action("Remove Posting Hold")
            {
                ToolTip = 'Removes the Posting hold on an Order.';
                Caption = 'Remove Posting Hold';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec."Temporary Posting Hold" := false;
                    Rec.Modify(true);
                    Message('Posting hold removed from %1.', Rec."No.");
                end;
            }

            action("Add Posting Hold")
            {
                ToolTip = 'Add the Posting hold on an Order.';
                Caption = 'Add Posting Hold';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec."Temporary Posting Hold" := true;
                    Rec.Modify(true);
                    Message('Posting hold removed from %1.', Rec."No.");
                end;
            }
            action("Add Freight")
            {
                ToolTip = 'Add Freight';
                Caption = 'Add Freight';
                Image = PickLines;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    InsertFreightLine.SOscreens(Rec);
                end;
            }
        }
        modify("Pick Instruction")
        {
            Visible = false;
        }
        modify(AttachAsPDF)
        {
            Visible = false;
        }
        modify("Work Order")
        {
            Visible = false;
        }
        modify(Release)
        {
            trigger OnBeforeAction()
            begin
                if (ShipToOptions <> ShipToOptions::"Custom Address") and (Rec."Ship-to Code" = '') then
                    Error('Ship-to Code not selected');
            end;
        }
    }

    var
        ShortcutDimCode: array[8] of Code[20];
        MPOCount: Integer;
        MPOSalesHeader: Record "Sales Header";
        MPOVisible: Boolean;
        LookupUserId: Codeunit TlyLookupUserID;
        InsertFreightLine: Codeunit TlyInsertFreightLine;
        TorlysCreditHold: Codeunit TlyCreditHold;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        MPOCount := 0;
        MPOSalesHeader.Reset();
        MPOSalesHeader.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        MPOSalesHeader.SetRange("Order Type", 'MASTER PROJECT ORDER');
        MPOCount := MPOSalesHeader.Count;
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;
}