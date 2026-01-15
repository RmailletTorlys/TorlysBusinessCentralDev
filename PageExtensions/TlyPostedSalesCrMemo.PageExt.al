pageextension 50134 TlyPostedSalesCrMemo extends "Posted Sales Credit Memo"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")

        addafter("Sell-to Customer No.")
        {
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
            }
        }

        moveafter("Ship-to Code"; "Sell-to Customer Name", "Sell-to Address", "Sell-to Address 2", "Sell-to City", "Sell-to County", "Sell-to Post Code", "Sell-to Country/Region Code")

        addafter("Sell-to Country/Region Code")
        {
            field("Order Method"; Rec."Order Method")
            {
                Caption = 'Order Method';
                ToolTip = 'Order Method';
                ApplicationArea = All;
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
                Editable = false;
            }
        }

        addafter(ShortcutDimCode3)
        {
            field("Reason Code"; Rec."Reason Code")
            {
                Caption = 'Reason Code';
                ToolTip = 'Reason Code';
                ApplicationArea = All;
                Importance = Standard;
            }
            field("Original Invoice No."; Rec."Original Invoice No.")
            {
                Caption = 'Original Invoice No.';
                ToolTip = 'Original Invoice No.';
                ApplicationArea = All;
                Importance = Standard;
            }
            field("Rebill Invoice No."; Rec."Rebill Invoice No.")
            {
                Caption = 'Rebill Invoice No.';
                ToolTip = 'Rebill Invoice No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Rebill Invoice No."; "Posting Date", "Location Code")

        addafter("Location Code")
        {
            field("Return Order No."; Rec."Return Order No.")
            {
                Caption = 'Return Order No.';
                ToolTip = 'Return Order No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Return Order No."; "No. Printed")

        addafter("No. Printed")
        {
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

        moveafter("Salesperson Commission 3"; Correction, "Applies-to Doc. Type", "Applies-to Doc. No.")

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
                    Editable = false;
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
        }

        modify("Sell-to")
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

        modify("Posting Date")
        {
            Importance = Standard;
        }

        modify("Salesperson Code")
        {
            Importance = Standard;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
        }
        modify("Currency Code")
        {
            Importance = Additional;
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
        }

        modify("Sell-to Contact")
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

        modify("Document Date")
        {
            Visible = false;
        }

        modify("External Document No.")
        {
            Visible = true;
            Importance = Standard;
        }

        modify("Responsibility Center")
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
            editable = false;
            Importance = Additional;
        }

        modify("Location Code")
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

        modify("Pre-Assigned No.")
        {
            Visible = false;
        }

        modify(Cancelled)
        {
            Visible = false;
        }

        modify(Corrective)
        {
            Visible = false;
        }

        modify(Correction)
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Shipment Method Code")
        {
            Importance = Standard;
        }

        modify("Shipping Agent Code")
        {
            Importance = Standard;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Ship-to Contact")
        {
            Visible = false;
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
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;
}
