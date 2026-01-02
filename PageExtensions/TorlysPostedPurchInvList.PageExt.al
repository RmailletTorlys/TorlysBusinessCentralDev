pageextension 50146 TorlysPostedPurchInvList extends "Posted Purchase Invoices"
{
    layout
    {
        moveafter("No."; "Order No.", "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from Country/Region Code", "Location Code", "Posting Date")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
            }
        }

        moveafter("Order Date"; "Document Date")

        addafter("Document Date")
        {
            field("Vendor Order No."; Rec."Vendor Order No.")
            {
                Caption = 'Vendor Order No.';
                ToolTip = 'Vendor Order No.';
                ApplicationArea = All;
            }
        }

        moveafter("Vendor Order No."; "Vendor Invoice No.", "Currency Code")

        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                Caption = 'Currency Factor';
                ToolTip = 'Currency Factor';
                ApplicationArea = All;
            }
        }

        moveafter("Currency Factor"; "Payment Method Code", "Payment Terms Code", "Due Date")

        addafter("Due Date")
        {
            field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
            {
                Caption = 'Pmt. Discount Date';
                ToolTip = 'Pmt. Discount Date';
                ApplicationArea = All;
            }
        }

        moveafter("Pmt. Discount Date"; "Payment Discount %")

        addafter("Payment Discount %")
        {
            field("Tax Liable"; Rec."Tax Liable")
            {
                Caption = 'Tax Liable';
                ToolTip = 'Tax Liable';
                ApplicationArea = All;
            }
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
            }
        }

        moveafter("Tax Area Code"; "Amount")

        addafter("Amount")
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
            }
        }

        modify("Buy-from Vendor No.")
        {
            Visible = true;
        }

        modify("Buy-from Contact")
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = true;
        }

        modify("Order Address Code")
        {
            Visible = true;
        }

        modify("Buy-from Country/Region Code")
        {
            Visible = true;
        }

        modify("Posting Date")
        {
            Visible = true;
        }

        modify("Currency Code")
        {
            Visible = true;
        }

        modify("Payment Method Code")
        {
            Visible = true;
        }

        modify("Payment Terms Code")
        {
            Visible = true;
        }

        modify("Due Date")
        {
            Visible = true;
        }

        modify("Payment Discount %")
        {
            Visible = true;
        }

        modify("Location Code")
        {
            visible = true;
        }

        modify("Amount Including VAT")
        {
            visible = false;
        }

        modify("No. Printed")
        {
            visible = false;
        }

        modify("Remaining Amount")
        {
            visible = false;
        }

        modify("Closed")
        {
            visible = false;
        }

        modify("Cancelled")
        {
            visible = false;
        }

        modify("Corrective")
        {
            visible = false;
        }

        modify("Order No.")
        {
            visible = true;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;


}
