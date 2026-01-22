pageextension 55745 TlyPostedTransRcpt extends "Posted Transfer Receipt"
{
    layout
    {
        addbefore("Transfer-from Code")
        {
            field("Transfer Type"; Rec."Transfer Type")
            {
                Caption = 'Transfer Type';
                ToolTip = 'Transfer Type';
                ApplicationArea = All;
                Editable = false;
            }
        }

        moveafter("Transfer-from Code"; "Transfer-to Code", "Direct Transfer", "In-Transit Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Posting Date", "Shipment Date", "Receipt Date", "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Editable = false;
                Importance = Standard;
            }
            field("Picked By"; Rec."Picked By")
            {
                Caption = 'Picked By';
                ToolTip = 'Picked By';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
            field("Audited By"; Rec."Audited By")
            {
                Caption = 'Audited By';
                ToolTip = 'Audited By';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
            field("Received By"; Rec."Received By")
            {
                Caption = 'Received By';
                ToolTip = 'Received By';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
            // field("Put Away By"; Rec."Put Away By")
            // {
            //     Caption = 'Put Away By';
            //     ToolTip = 'Put Away By';
            //     ApplicationArea = All;
            //     Importance = Standard;
            //     Editable = false;
            // }
            field("BOL No."; Rec."BOL No.")
            {
                Caption = 'BOL No.';
                ToolTip = 'BOL No.';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field("Package Tracking No."; Rec."Package Tracking No.")
            {
                Caption = 'Package Tracking No.';
                ToolTip = 'Package Tracking No.';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field("Booking No."; Rec."Booking No.")
            {
                Caption = 'Booking No.';
                ToolTip = 'Booking No.';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
        }

        moveafter("Booking No."; "Transfer Order No.", "Transfer Order Date")

        addafter("Transfer Order Date")
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created Date';
                ToolTip = 'Created Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
        }
    }

    actions
    {
        addlast(Category_Category4)
        {
            actionref(SOJoin; "View and Fill Joined SO")
            {
            }
        }

        addlast("&Receipt")
        {
            action("View and Fill Joined SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Joined SO';
                ToolTip = 'View and Fill Joined SO';
                Image = Order;
                RunObject = Page TlyJoinedSOtoTO;
                RunPageLink = "Transfer Order No." = field("No."), Type = const(Item);
            }
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}