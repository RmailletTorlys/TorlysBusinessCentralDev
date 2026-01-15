pageextension 56630 TlySalesReturnOrder extends "Sales Return Order"
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }

        moveafter("Ship-to Code"; "Sell-to Customer Name", "Sell-to Address", "Sell-to Address 2", "Sell-to City", "Sell-to County", "Sell-to Post Code", "Sell-to Country/Region Code")

        addafter("Sell-to Country/Region Code")
        {
            field("Order Method"; Rec."Order Method")
            {
                Caption = 'Order Method';
                ToolTip = 'Order Method';
                ShowMandatory = true;
                ApplicationArea = All;
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
                ShowMandatory = true;
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
                trigger OnValidate()
                begin
                    if (ShortcutDimCode[3] = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released')
                    else
                        ValidateShortcutDimension(3);
                end;
            }
            field("Reason Code"; Rec."Reason Code")
            {
                Caption = 'Reason Code';
                ToolTip = 'Reason Code';
                ApplicationArea = All;
                ShowMandatory = true;
                trigger OnValidate()
                begin
                    if (Rec."Reason Code" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
            }
            field("Original Invoice No."; Rec."Original Invoice No.")
            {
                Caption = 'Original Invoice No.';
                ToolTip = 'Original Invoice No.';
                ApplicationArea = All;
                Importance = Standard;
                ShowMandatory = true;
                trigger OnValidate()
                // have to do this on the screen and not the table
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    DimensionSetEntry: Record "Dimension Set Entry";
                begin
                    SalesInvoiceHeader.Get(Rec."Original Invoice No.");
                    DimensionSetEntry.Reset();
                    DimensionSetEntry.SetRange("Dimension Set ID", SalesInvoiceHeader."Dimension Set ID");
                    DimensionSetEntry.SetFilter("Dimension Code", 'CHANNEL');
                    if DimensionSetEntry.Find('-') then
                        ShortcutDimCode[3] := DimensionSetEntry."Dimension Value Code";
                end;
            }
            field("Rebill Invoice No."; Rec."Rebill Invoice No.")
            {
                Caption = 'Rebill Invoice No.';
                ToolTip = 'Rebill Invoice No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Rebill Invoice No."; "Posting Date", "Order Date")

        addafter("Order Date")
        {
            field("Order Time"; Rec."Order Time")
            {
                Caption = 'Order Time';
                ToolTip = 'Order Time';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
        }

        moveafter("Order Time"; "Location Code", Status)

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

        moveafter("Currency Factor"; "Customer Posting Group", "Tax Liable", "Tax Area Code")

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

        moveafter("Salesperson Commission 3"; "Applies-to Doc. Type", "Applies-to Doc. No.", "Applies-to ID")

        addbefore("Ship-to Name")
        {
            field("Ship-to Code1"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        addbefore("Bill-to Name")
        {
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                Caption = 'Bill-to Customer No.';
                ToolTip = 'Bill-to Customer No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        addafter("Shipping and Billing")
        {
            group("Marketing")
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
        }

        modify("Sell-to Customer No.")
        {
            Importance = Standard;
            Visible = true;
        }

        modify("Your Reference")
        {
            Importance = Standard;
            ShowMandatory = true;
            Caption = 'Requested By';
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

        modify("Shipping Agent Code")
        {
            Importance = Standard;
            Caption = 'Shipping Agent Code';
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
            ShowMandatory = true;
            trigger OnBeforeValidate()
            begin
                if (Rec."Salesperson Code" = '') and (Rec.Status = Rec.Status::Released) then
                    Error('Cannot delete if order released');
            end;
        }

        modify("Payment Terms Code")
        {
            Visible = false;
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
            ShowMandatory = true;
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
            ShowMandatory = true;
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

        modify("External Document No.")
        {
            Visible = true;
            Importance = Standard;
            ShowMandatory = true;
            trigger OnBeforeValidate()
            begin
                if (Rec."External Document No." = '') and (Rec.Status = Rec.Status::Released) then
                    Error('Cannot delete if order released');
            end;
        }

        modify("Campaign No.")
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

        modify("Company Bank Account Code")
        {
            Visible = false;
        }

        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
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
            ShowMandatory = true;
        }

        modify("Ship-to Country/Region Code")
        {
            Importance = Standard;
        }

        modify("Payment Method Code")
        {
            Visible = false;
        }

        modify("Applies-to Doc. Type")
        {
            Importance = Standard;
        }

        modify("Applies-to Doc. No.")
        {
            Importance = Standard;
        }

        modify("Applies-to ID")
        {
            Importance = Standard;
        }

        modify("Shipment Date")
        {
            Visible = false;
        }

        modify("EU 3-Party Trade")
        {
            Visible = false;
        }

        modify("Shipment Method")
        {
            Visible = true;
        }
    }

    actions
    {
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
        addafter("Customer History")
        {
            actionref("AddRestocking"; "Add Restocking")
            {
            }
        }

        addfirst("F&unctions")
        {
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
            action("Add Restocking")
            {
                ToolTip = 'Add Restocking';
                Caption = 'Add Restocking';
                Image = PickLines;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    AddRestockingLine;
                end;
            }
        }
        // modify(GetPostedDocumentLinesToReverse)
        // {
        //     // ApplicationArea = SalesReturnOrder;
        //     // Caption = 'Test';
        //     // ToolTip = 'Test tip';
        //     trigger OnAction()
        //     begin
        //         // Rec.GetPstdDocLinesToReverse();
        //         // CurrPage.SalesLines.Page.ForceTotalsCalculation();
        //         // CurrPage.Update();
        //     end;
        // }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;

    local procedure AddRestockingLine()
    var
        Cust: Record "Customer";
        OrderAmount: Decimal;
        RestockingAmount: Decimal;
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get;
        Cust.Get(Rec."Sell-to Customer No.");
        if Cust."Restocking Fee %" = 0 then Error('No Restocking Fee % setup on customer card for %1.', Rec."Sell-to Customer No.");
        if Cust."Restocking Fee Minimum" = 0 then Error('No Restocking Fee Minimum setup on customer card for %1.', Rec."Sell-to Customer No.");

        // Check if restocking line exists
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetRange(Type, SalesLine.Type::"G/L Account");
        // SalesLine.SetRange("No.", '40500');
        SalesLine.SetFilter("No.", SalesSetup."Restocking G/L Acc. No.");
        if SalesLine.Find('-') then
            Error('Restocking line already exists, please remove before adding new.');

        // Get the total of the sales order
        OrderAmount := 0.0;
        RestockingAmount := 0.0;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.find('-') then begin
            repeat
                OrderAmount := OrderAmount + SalesLine."Line Amount";
            until SalesLine.next = 0;
        end;

        // Check if max has been reached and calculate amount to be charged
        if OrderAmount > 0 THEN
            if Round(OrderAmount * Cust."Restocking Fee %" / 100, 0.01, '=') < Cust."Restocking Fee Minimum" then
                RestockingAmount := Cust."Restocking Fee Minimum"
            else
                RestockingAmount := Round(OrderAmount * Cust."Restocking Fee %" / 100, 0.01, '=');
        if RestockingAmount <> 0 then begin
            // Fill in the Sales Line
            SalesLine.Reset;
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."No.");
            SalesLine.Find('+');
            SalesLine."Line No." := SalesLine."Line No." + 10000;
            SalesLine.Init;
            SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
            // SalesLine.Validate("No.", '40500');
            SalesLine.Validate("No.", SalesSetup."Restocking G/L Acc. No.");
            SalesLine.Validate(Quantity, -1);
            SalesLine.Validate("Unit Price", RestockingAmount);
            SalesLine.Insert;
        end;
    end;
}
