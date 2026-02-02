pageextension 50132 TlyPostedSalesInv extends "Posted Sales Invoice"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")

        moveafter("Sell-to Customer No."; "Ship-to Code", "Sell-to Customer Name", "Sell-to Address", "Sell-to Address 2", "Sell-to City", "Sell-to County", "Sell-to Post Code", "Sell-to Country/Region Code")

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
            field("Order Type"; Rec."Order Type")
            {
                Caption = 'Order Type';
                ToolTip = 'Order Type';
                ApplicationArea = All;
            }
        }

        moveafter("Order Type"; "Posting Date")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
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
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Importance = Standard;
            }
        }
        moveafter("Shipping Comment"; "Order No.", "No. Printed")

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
                Importance = Standard;
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

        addbefore("Ship-to Name")
        {
            field("Ship-to Code1"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
        }

        addafter("Shipping Agent Code")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
                ApplicationArea = All;
                Importance = Standard;
                TableRelation = TlyFreightZone;
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

        modify("No.")
        {
            visible = false;
        }

        modify("Sell-to")
        {
            visible = false;
        }

        modify("Sell-to Customer No.")
        {
            visible = true;
        }

        modify("Sell-to Contact No.")
        {
            visible = false;
        }

        modify(SellToPhoneNo)
        {
            visible = false;
        }

        modify(SellToMobilePhoneNo)
        {
            visible = false;
        }

        modify(SellToEmail)
        {
            visible = false;
        }

        modify("Sell-to Contact")
        {
            visible = false;
        }

        modify("Document Date")
        {
            visible = false;
        }

        modify("Quote No.")
        {
            visible = false;
        }

        modify("Pre-Assigned No.")
        {
            visible = false;
        }

        modify("Responsibility Center")
        {
            visible = false;
        }

        modify("Work Description")
        {
            visible = false;
        }

        modify("Company Bank Account Code")
        {
            visible = false;
        }

        modify(SelectedPayments)
        {
            visible = false;
        }

        modify("Direct Debit Mandate ID")
        {
            visible = false;
        }

        modify("Shipment Method Code")
        {
            Importance = Standard;
            Caption = 'Shipment Method Code';
        }

        modify("Shipping Agent Code")
        {
            Importance = Standard;
            Caption = 'Shipping Agent Code';
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Location Code")
        {
            Importance = Standard;
        }

        modify("Salesperson Code")
        {
            Importance = Standard;
        }

        modify("Payment Discount %")
        {
            Importance = Additional;
        }

        modify(Cancelled)
        {
            Visible = false;
        }

        modify(Corrective)
        {
            Visible = false;
        }

        modify(Closed)
        {
            Visible = false;
        }

        modify("Dispute Status")
        {
            Visible = false;
        }

        modify("Your Reference")
        {
            Importance = Standard;
            Caption = 'Ordered By';
        }

        modify("External Document No.")
        {
            Importance = Standard;
        }

        modify("Promised Pay Date")
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Ship-to Contact")
        {
            Visible = false;
        }

        modify("Bill-to Contact")
        {
            Visible = false;
        }

        modify("Bill-to Contact No.")
        {
            Visible = false;
        }

        modify(BillToContactMobilePhoneNo)
        {
            Visible = false;
        }

        modify(BillToContactEmail)
        {
            Visible = false;
        }

        modify(BillToContactPhoneNo)
        {
            Visible = false;
        }
    }

    actions
    {
        //     addlast(Category_Category11)
        //     {

        //         actionref(B13_Sales; "B13 Sales")
        //         {
        //         }
        //         actionref(B13_Purchase; "B13 Purchase")
        //         {
        //         }
        //     }

        // addlast(Action96)
        // {
        //     action("B13 Sales")
        //     {
        //         Caption = 'Print B13 Sales';
        //         Image = Print;
        //         ApplicationArea = Basic, Suite;
        //         trigger OnAction()
        //         var
        //             TorlysDocPrint: Codeunit TlyDocumentPrint;
        //         begin
        //             TorlysDocPrint.PrintB13SalesFromInvoice(Rec);
        //         end;
        //     }
        //     action("B13 Purchase")
        //     {
        //         Caption = 'Print B13 Purchase';
        //         Image = Print;
        //         ApplicationArea = Basic, Suite;
        //         trigger OnAction()
        //         var
        //             // SalesLine: Record "Sales Line";
        //             TorlysDocPrint: Codeunit TlyDocumentPrint;
        //         begin
        //             TorlysDocPrint.PrintB13PurchaseFromInvoice(Rec);
        //         end;
        //     }
        // }

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



    var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;
}