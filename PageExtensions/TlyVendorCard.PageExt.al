pageextension 50026 TlyVendorCard extends "Vendor Card"
{
    DeleteAllowed = false;

    layout
    {
        moveafter("No."; Name, "Search Name")

        addafter("Search Name")
        {
            field("Payer ID"; Rec."Payer ID")
            {
                ApplicationArea = All;
                Caption = 'Payer ID';
                Visible = true;
                ToolTip = 'Payer ID';
            }
        }

        moveafter("Payer ID"; "Purchaser Code", "Our Account No.")

        addafter("Our Account No.")
        {
            field("Default G/L Account"; Rec."Default G/L Account")
            {
                ApplicationArea = All;
                Caption = 'Default G/L Account';
                Visible = true;
                ToolTip = 'This field is the default General Ledger Account for this vendor';
            }
        }

        moveafter("Default G/L Account"; Blocked, "Balance (LCY)", "Balance Due (LCY)")

        addafter("Balance Due (LCY)")
        {
            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = true;
                ToolTip = 'This field is the user who created the customer account.';
                Importance = Additional;
            }

            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was created.';
                Importance = Additional;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("SystemModifiedAt"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was last modified.';
                Importance = Additional;
            }
        }

        moveafter("Pay-to Vendor No."; "Tax Liable", "Tax Area Code", "Tax Identification Type", "VAT Registration No.")

        // moveafter("Posting Details"; "Gen. Bus. Posting Group", "Vendor Posting Group")

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

        moveafter("Application Method"; "Payment Terms Code", "Payment Method Code", Priority, "Block Payment Tolerance", "Preferred Bank Account Code", "Check Date Format", "Check Date Separator")

        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Format Region")
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify(BalanceAsCustomer)
        {
            Visible = false;
        }
        modify("Document Sending Profile")
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
        modify("Disable Search by Name")
        {
            Visible = false;
        }
        modify("Company Size Code")
        {
            Visible = false;
        }
        // modify("Sust. Cert. Name")
        // {
        //     Visible = false;
        // }
        // modify("Sust. Cert. No.")
        // {
        //     Visible = false;
        // }
        // modify("Carbon Pricing Paid")
        // {
        //     Visible = false;
        // }
        modify("Primary Contact No.")
        {
            Visible = false;
        }
        modify("Price Calculation Method")
        {
            Visible = false;
        }
        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Cash Flow Payment Terms Code")
        {
            Visible = false;
        }
        modify("Federal ID No.")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("Base Calendar Code")
        {
            Visible = false;
        }
        modify("Registration Number")
        {
            Visible = false;
        }
        modify("Invoice Disc. Code")
        {
            Visible = false;
        }
        modify("Intrastat Partner Type")
        {
            Visible = false;
        }
        modify("Exclude from Pmt. Practices")
        {
            Visible = false;
        }
        // modify("Receive E-Document To")
        // {
        //     Visible = false;
        // }
        // modify("E-Document Service Participation Ids")
        // {
        //     Visible = false;
        // }
        modify("Customized Calendar")
        {
            Visible = false;
        }
        modify(GLN)
        {
            Visible = false;
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
        }
        modify("SCX Fields")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Importance = Standard;
        }
        modify("Gen. Bus. Posting Group")
        {
            Importance = Standard;
        }
        modify("Vendor Posting Group")
        {
            Importance = Standard;
        }
        modify("Currency Code")
        {
            Importance = Standard;
        }
        modify("Pay-to Vendor No.")
        {
            Importance = Standard;
        }
        modify("Prepayment %")
        {
            Importance = Standard;
        }
        modify("Bank Communication")
        {
            Visible = false;
        }
    }

    actions
    {
        addfirst("F&unctions")
        {
            action("Freight Forwarder Costs")
            {
                Caption = 'Freight Forwarder Costs';
                ToolTip = 'Freight Forwarder Costs';
                ApplicationArea = All;
                Image = Order;
                RunObject = Page TlyFreightForwarderCosts;
                RunPageLink = "Vendor No." = field("No.");
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}
