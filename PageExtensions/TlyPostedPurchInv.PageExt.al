pageextension 50138 TlyPostedPurchInv extends "Posted Purchase Invoice"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from")

        moveafter("Buy-from"; "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from County", "Buy-from Post Code", "Buy-from Country/Region Code", "Location Code", "Shipment Method Code")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Order Date"; "Order No.", "Document Date", "Vendor Order No.", "Vendor Invoice No.", "No. Printed")

        addafter("No. Printed")
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
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

        moveafter("Currency Factor"; "Vendor Posting Group")

        addafter("Vendor Posting Group")
        {
            field("Payment Method Code"; Rec."Payment Method Code")
            {
                Caption = 'Payment Method Code';
                ToolTip = 'Payment Method Code';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Payment Method Code"; "Payment Terms Code", "Due Date", "Pmt. Discount Date", "Payment Discount %", "Tax Liable", "Tax Area Code", "Tax Exemption No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")

        modify("Posting Date")
        {
            Importance = Promoted;
            Editable = false;
        }

        modify("Vendor Order No.")
        {
            Importance = Promoted;
        }

        modify("Buy-from Vendor No.")
        {
            Importance = Standard;
            Visible = true;
            Caption = 'Vendor No.';
        }

        modify("Buy-from Contact No.")
        {
            Visible = false;
        }

        modify(BuyFromContactPhoneNo)
        {
            Visible = false;
        }

        modify(BuyFromContactMobilePhoneNo)
        {
            Visible = false;
        }

        modify(BuyFromContactEmail)
        {
            Visible = false;
        }

        modify("Buy-from Contact")
        {
            Visible = false;
        }

        modify("Quote No.")
        {
            Visible = false;
        }

        modify("Order Address Code")
        {
            Visible = true;
            Importance = Additional;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Provincial Tax Area Code")
        {
            Visible = false;
        }

        modify("Payment Reference")
        {
            Visible = false;
        }

        modify("Creditor No.")
        {
            Visible = false;
        }

        modify("Remit-to Code")
        {
            Visible = false;
        }

        modify("Payment Terms Code")
        {
            Visible = true;
            Importance = Standard;
        }

        modify("Payment Discount %")
        {
            Visible = true;
        }

        modify("Currency Code")
        {
            Importance = Standard;
        }

        modify("Tax Liable")
        {
            Importance = Promoted;
        }

        modify("Tax Area Code")
        {
            Importance = Promoted;
        }

        modify("Location Code")
        {
            Importance = Standard;
        }

        modify("Purchaser Code")
        {
            Visible = false;
        }

        modify("No.")
        {
            Visible = false;
        }

        modify("Due Date")
        {
            Importance = Standard;
        }

        modify("Expected Receipt Date")
        {
            Visible = false;
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

        modify("Vendor Posting Group")
        {
            Importance = Standard;
        }

        modify("Pmt. Discount Date")
        {
            Importance = Standard;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
        }

        modify("Shipment Method Code")
        {
            Importance = Standard;
        }

        modify("Document Date")
        {
            Importance = Standard;
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}