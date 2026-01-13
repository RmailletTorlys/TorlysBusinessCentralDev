pageextension 50140 TlyPostedPurchCrMemo extends "Posted Purchase Credit Memo"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from")

        moveafter("Buy-from"; "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from County", "Buy-from Post Code", "Buy-from Country/Region Code", "Location Code", "Posting Date", "Document Date", "Vendor Cr. Memo No.")

        addafter("Vendor Cr. Memo No.")
        {
            field("Return Order No."; Rec."Return Order No.")
            {
                Caption = 'Return Order No.';
                ToolTip = 'Return Order No.';
                ApplicationArea = All;
                Importance = Additional;
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
                Visible = true;
            }
            field("Payment Terms Code"; Rec."Payment Terms Code")
            {
                Caption = 'Payment Terms Code';
                ToolTip = 'Payment Terms Code';
                ApplicationArea = All;
                Importance = Standard;
                Visible = true;
            }
            field("Due Date"; Rec."Due Date")
            {
                Caption = 'Due Date';
                ToolTip = 'Due Date';
                ApplicationArea = All;
                Importance = Standard;
                Visible = true;
            }
            field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
            {
                Caption = 'Pmt. Discount Date';
                ToolTip = 'Pmt. Discount Date';
                ApplicationArea = All;
                Importance = Standard;
                Visible = true;
            }
        }

        moveafter("Pmt. Discount Date"; "Tax Liable", "Tax Area Code", "Tax Exemption No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")

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

        modify("Ship-to Phone No.")
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

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Importance = Promoted;
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
        LookupUserId: Codeunit TlyLookupUserID;

}
