pageextension 55743 TorlysPostedTransShpt extends "Posted Transfer Shipment"
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

        moveafter("Transfer-from Code"; "Transfer-to Code", "Direct Transfer", "In-Transit Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Posting Date", "Shipment Date", "Receipt Date", "Shipping Agent Code", "Transfer Order No.", "Transfer Order Date")

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
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified Date';
                ToolTip = 'Modified Date';
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

        addlast("&Shipment")
        {
            action("View and Fill Joined SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Joined SO';
                ToolTip = 'View and Fill Joined SO';
                Image = Order;
                RunObject = Page TorlysJoinedSOtoTO;
                RunPageLink = "Transfer Order No." = field("No."), Type = const(Item);
            }
        }
    }
    var
        LookupUserId: Codeunit TorlysLookupUserID;
}