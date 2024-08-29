pageextension 50116 TorlysVendorCard extends "Vendor Card"
{
    layout
    {

        addafter("No.")
        {
            field("Account No."; Rec."Account No.")
            {
                ApplicationArea = All;
                Caption = 'Account No.';
                Visible = true;
                ToolTip = 'This field is the Vendor Provided Account Number';
            }

            field("Default G/L Account"; Rec."Default G/L Account")
            {
                ApplicationArea = All;
                Caption = 'Default G/L Account';
                Visible = true;
                ToolTip = 'This field is the default General Ledger Account for this vendor';
            }
        }

        addbefore("Prepayment %")
        {
            field("Payer ID"; Rec."Payer ID")
            {
                ApplicationArea = All;
                Caption = 'Payer ID';
                Visible = true;
                ToolTip = 'This field is the Payer ID assigned to this vendor';
            }
            field("Payer ID 2"; Rec."Payer ID 2")
            {
                ApplicationArea = All;
                Caption = 'Payer ID 2';
                Visible = true;
                ToolTip = 'This field is the backup Payer ID.';
            }
        }

        addafter("Location Code")
        {
            field("Invoice Unit of Measure"; Rec."Invoice Unit of Measure")
            {
                ApplicationArea = All;
                Caption = 'Invoice Unit of Measure';
                Visible = true;
                ToolTip = 'This field is the unit of measurement for invoicing purposes.';
            }
        }

    }
}
