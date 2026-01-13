pageextension 50145 TlyPostedPurchRcptList extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("No.")
        {
            field("Order No."; Rec."Order No.")
            {
                Caption = 'Order No.';
                ToolTip = 'Order No.';
                ApplicationArea = All;
            }
        }

        moveafter("Order No."; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from Country/Region Code", "Location Code", "Posting Date")

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
            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                Caption = 'Vendor Shipment No.';
                ToolTip = 'Vendor Shipment No.';
                ApplicationArea = All;
            }
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
        LookupUserId: Codeunit TlyLookupUserID;
}
