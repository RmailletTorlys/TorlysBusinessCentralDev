pageextension 59309 TlyPurchCrMemoList extends "Purchase Credit Memos"
{
    layout
    {
        moveafter("No."; "Status", "Buy-from Vendor No.")

        addafter("Buy-from Vendor No.")
        {
            field("Manufacturer Code"; Rec."Manufacturer Code")
            {
                Caption = 'Manufacturer Code';
                ToolTip = 'Manufacturer Code';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Manufacturer Code"; "Buy-from Vendor Name", "Buy-from Country/Region Code", "Location Code", "Posting Date", "Document Date")

        moveafter("Document Date"; "Vendor Cr. Memo No.", "Currency Code")

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

        modify("Currency Code")
        {
            Visible = true;
        }

        modify(Status)
        {
            Visible = true;
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

        modify("Document Date")
        {
            visible = true;
        }

        modify("Due Date")
        {
            visible = false;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;


}
