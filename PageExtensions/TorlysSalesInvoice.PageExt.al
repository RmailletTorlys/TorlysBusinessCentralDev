pageextension 50043 TorlysSalesInvoice extends "Sales Invoice"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")

        moveafter("Sell-to Customer No."; "Ship-to Code")

        addafter("Sell-to")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
            }

            field("Sample Allowance Exclusion"; Rec."Sample Allowance Exclusion")
            {
                Caption = 'Sample Allowance Exclusion';
                ToolTip = 'Sample Allowance Exclusion';
                ApplicationArea = All;
            }

            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
            }

            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
            }
        }

        moveafter("Order Date"; "Posting Date")

        moveafter("Tag Name"; "Shipment Date")

        addafter("Shipment Date")
        {
            field("Requested Delivery Date"; Rec."Requested Delivery Date")
            {
                Caption = 'Requested Delivery Date';
                ToolTip = 'Requested Delivery Date';
                ApplicationArea = All;
            }

        }

        moveafter("Requested Delivery Date"; "Your Reference", "Salesperson Code")

        addafter("Salesperson Code")
        {

            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                Caption = 'Salesperson Code 2';
                ToolTip = 'Salesperson Code 2';
                ApplicationArea = All;
            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                Caption = 'Salesperson Commission 2';
                ToolTip = 'Salesperson Commission 2';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                Caption = 'Salesperson Code 3';
                ToolTip = 'Salesperson Code 3';
                ApplicationArea = All;
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                Caption = 'Salesperson Commission 3';
                ToolTip = 'Salesperson Commission 3';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }
        }

        moveafter("Salesperson Commission 3"; "Shortcut Dimension 2 Code")

        addafter("Shortcut Dimension 2 Code")
        {

            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'SystemCreatedAtd';
                ToolTip = 'SystemCreatedAtd';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'SystemModifiedBy';
                ToolTip = 'SystemModifiedBy';
                ApplicationArea = All;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'SystemModifiedAt';
                ToolTip = 'SystemModifiedAt';
                ApplicationArea = All;
            }
        }

        addfirst("Invoice Details")
        {
            field("Bill-to"; Rec."Bill-to Customer No.")
            {
                Caption = 'Bill-to Customer No.';
                ToolTip = 'Bill-to Customer No.';
                ApplicationArea = All;
            }

            field("Total Excl. Tax"; Rec.Amount)
            {
                Caption = 'Total Excl. Tax';
                ToolTip = 'Total Excl. Tax';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Total Tax"; Rec."Amount Including VAT" - Rec.Amount)
            {
                Caption = 'Total Tax';
                ToolTip = 'Total Tax';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Total Incl. Tax"; Rec."Amount Including VAT")
            {
                Caption = 'Total Incl. Tax';
                ToolTip = 'Total Incl. Tax';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

        }

        moveafter("Total Incl. Tax"; "Shortcut Dimension 1 Code", "Currency Code", "Gen. Bus. Posting Group", "Customer Posting Group", "Payment Terms Code", "Due Date", "Tax Liable", "Tax Area Code")


        movefirst("Shipping and Billing"; "Shipment Method")

        addafter("Shipping Agent Code")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
                ApplicationArea = All;
            }
        }

        moveafter("Freight Zone Code"; "Location Code")

        addafter("Location Code")
        {
            field("Shipping Advice"; Rec."Shipping Advice")
            {
                Caption = 'Shipping Advice';
                ToolTip = 'Shipping Advice';
                ApplicationArea = All;
            }
        }

        modify("No.")
        {
            Visible = false;
        }

        modify("Sell-to Customer No.")
        {
            Visible = true;
            Caption = 'Customer No.';
        }

        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }

        modify(SellToEmail)
        {
            Visible = false;
        }

        modify("Sell-to Contact")
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Quote No.")
        {
            Visible = false;
        }

        modify("External Document No.")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(Status)
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

        modify("Payment Discount %")
        {
            Visible = false;
        }

        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Ship-to Code")
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

    }
}