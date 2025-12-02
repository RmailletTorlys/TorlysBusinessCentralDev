pageextension 56652 TorlysPostedReturnShipList extends "Posted Return Shipments"
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

        modify("No. Printed")
        {
            visible = false;
        }
    }

    var
        LookupUserId: Codeunit "TorlysLookupUserID";

}
