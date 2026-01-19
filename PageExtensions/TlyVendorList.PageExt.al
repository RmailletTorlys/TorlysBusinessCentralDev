pageextension 50027 TlyVendorList extends "Vendor List"
{
    layout
    {
        moveafter("No."; Name)

        addafter(Name)
        {
            field("Payer ID"; Rec."Payer ID")
            {
                ApplicationArea = All;
                Caption = 'Payer ID';
                Visible = true;
                ToolTip = 'Payer ID';
            }
        }

        moveafter("Payer ID"; "Purchaser Code", Address, City, "Post Code", "Phone No.", Contact, "Balance (LCY)", "Balance Due (LCY)")

        addafter("Balance Due (LCY)")
        {
            field("Our Account No."; Rec."Our Account No.")
            {
                ApplicationArea = All;
                Caption = 'Our Account No.';
                Visible = true;
                ToolTip = 'Our Account No.';
            }
            field("Default G/L Account"; Rec."Default G/L Account")
            {
                ApplicationArea = All;
                Caption = 'Default G/L Account';
                Visible = true;
                ToolTip = 'This field is the default General Ledger Account for this vendor';
            }
            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = false;
                ToolTip = 'This field is the user who created the customer account.';
                Importance = Additional;
            }

            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = false;
                ToolTip = 'This field is the date the customer account was created.';
                Importance = Additional;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
                Visible = false;
            }
            field("SystemModifiedAt"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Visible = false;
                ToolTip = 'This field is the date the customer account was last modified.';
                Importance = Additional;
            }
        }

        // moveafter("Pay-to Vendor No."; "Tax Liable", "Tax Area Code", "Tax Identification Type", "VAT Registration No.")

        moveafter(SystemModifiedAt; "Gen. Bus. Posting Group", "Vendor Posting Group")

        addafter("Vendor Posting Group")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                Caption = 'Global Dimension 1 Code';
                Visible = true;
                ToolTip = 'Global Dimension 1 Code';
                Importance = Standard;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
                Caption = 'Global Dimension 2 Code';
                Visible = true;
                ToolTip = 'Global Dimension 2 Code';
                Importance = Standard;
            }
        }

        moveafter("Global Dimension 2 Code"; "Currency Code", "Payment Terms Code")

        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Base Calendar Code")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = true;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = true;
        }
        modify("Vendor Posting Group")
        {
            Visible = true;
        }
        modify("Currency Code")
        {
            Visible = true;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
        modify(Address)
        {
            Visible = true;
        }

        modify(City)
        {
            Visible = true;
        }
        modify("Post Code")
        {
            Visible = true;
        }
        modify("Payments (LCY)")
        {
            Visible = false;
        }
        modify("Payment Terms Code")
        {
            Visible = true;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}
