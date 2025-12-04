pageextension 55740 TorlysTransferOrder extends "Transfer Order"
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
            }
        }

        moveafter("Transfer-from Code"; "Transfer-to Code", "Direct Transfer", "In-Transit Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Posting Date", "Shipment Date", "Receipt Date", "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
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

        modify("Assigned User ID")
        {
            Visible = false;
        }
    }

    actions
    {
        addlast(Category_Category6)
        {
            actionref(JoinedSO; "View and Fill Joined SO")
            {
            }
            actionref(LinkededSO; "View and Fill Linked SO")
            {
            }
        }

        addlast(Documents)
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
            action("View and Fill Linked SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Linked SO';
                ToolTip = 'View and Fill Linked SO';
                Image = OrderTracking;
                RunObject = Page TorlysLinkedSOtoTO;
                RunPageLink = "Linked Transfer Order No." = field("No."), Type = const(Item);
            }
        }
    }
    var
        LookupUserId: Codeunit TorlysLookupUserID;
}