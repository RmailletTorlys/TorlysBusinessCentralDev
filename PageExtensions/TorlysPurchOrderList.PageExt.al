pageextension 59307 TorlysPurchOrderList extends "Purchase Order List"
{
    layout
    {
        moveafter("No."; "Status", "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from Country/Region Code", "Location Code", "Posting Date")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
            }
        }

        moveafter("Order Date"; "Document Date", "Vendor Order No.")

        addafter("Vendor Order No.")
        {
            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                Caption = 'Vendor Shipment No.';
                ToolTip = 'Vendor Shipment No.';
                ApplicationArea = All;
            }
            field("Vendor Invoice No."; Rec."Vendor Invoice No.")
            {
                Caption = 'Vendor Invoice No.';
                ToolTip = 'Vendor Invoice No.';
                ApplicationArea = All;
            }
        }

        moveafter("Vendor Invoice No."; "Currency Code")

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
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
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

        modify("Vendor Order No.")
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

        modify(Status)
        {
            Visible = true;
        }

        modify("Requested Receipt Date")
        {
            visible = false;
        }

        modify("Location Code")
        {
            visible = true;
        }

        modify("Assigned User ID")
        {
            visible = false;
        }

        modify("Vendor Authorization No.")
        {
            visible = false;
        }

        modify("Amount Including VAT")
        {
            visible = false;
        }
    }

    var
        LookupUserId: Codeunit "TorlysLookupUserID";

}
