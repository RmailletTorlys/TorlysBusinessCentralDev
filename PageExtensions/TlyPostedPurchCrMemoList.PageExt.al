pageextension 50147 TlyPostedPurchCrMemoList extends "Posted Purchase Credit Memos"
{
    layout
    {
        addafter("No.")
        {
            field("Return Order No."; Rec."Return Order No.")
            {
                Caption = 'Return Order No.';
                ToolTip = 'Return Order No.';
                ApplicationArea = All;
            }
        }

        moveafter("Return Order No."; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from Country/Region Code", "Location Code", "Posting Date", "Document Date")

        addafter("Document Date")
        {
            field("Vendor Cr. Memo No."; Rec."Vendor Cr. Memo No.")
            {
                Caption = 'Vendor Cr. Memo No.';
                ToolTip = 'Vendor Cr. Memo No.';
                ApplicationArea = All;
            }
        }

        moveafter("Vendor Cr. Memo No."; "Currency Code")

        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                Caption = 'Currency Factor';
                ToolTip = 'Currency Factor';
                ApplicationArea = All;
            }
        }

        addafter("Currency Factor")
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

        modify("Location Code")
        {
            visible = true;
        }

        modify("Document Date")
        {
            visible = true;
        }

        modify("Due Date")
        {
            visible = false;
        }

        modify("Amount Including VAT")
        {
            visible = false;
        }

        modify("Remaining Amount")
        {
            visible = false;
        }

        modify("Paid")
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

        modify("No. Printed")
        {
            visible = false;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}
