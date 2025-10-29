pageextension 50052 TorlysPurchCrMemo extends "Purchase Credit Memo"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from")

        moveafter("Buy-from"; "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from County", "Buy-from Post Code", "Buy-from Country/Region Code", "Location Code", "Posting Date", "Document Date", "Vendor Cr. Memo No.", Status)

        addafter(Status)
        {
            field("No. Printed"; Rec."No. Printed")
            {
                Caption = 'Quantity Printed';
                ToolTip = 'Quantity Printed';
                ApplicationArea = All;
                Importance = Additional;
            }
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
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
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

        moveafter("Currency Factor"; "Vendor Posting Group", "Payment Method Code", "Payment Terms Code", "Due Date", "Pmt. Discount Date", "Payment Discount %", "Tax Liable", "Tax Area Code", "Tax Exemption No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")

        modify("Posting Date")
        {
            Importance = Promoted;
            Editable = false;
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

        modify("Order Address Code")
        {
            Visible = true;
            Importance = Additional;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(Status)
        {
            Visible = true;
            Importance = Standard;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }

        modify("Provincial Tax Area Code")
        {
            Visible = false;
        }

        modify("Vendor Posting Group")
        {
            Visible = true;
            Importance = Standard;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Importance = Promoted;
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
            Editable = true;
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

        modify("Pmt. Discount Date")
        {
            Importance = Standard;
        }

        modify("Due Date")
        {
            Importance = Standard;
        }

        modify("Payment Method Code")
        {
            Importance = Standard;
        }

        modify("Expected Receipt Date")
        {
            Visible = false;
        }

        modify("Vendor Authorization No.")
        {
            Visible = false;
        }

        modify("Campaign No.")
        {
            Visible = false;
        }

        modify(Correction)
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Importance = Standard;
        }
    }

    var
        LookupUserId: Codeunit "TorlysLookupUserID";
}
