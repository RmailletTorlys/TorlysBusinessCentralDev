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
    }

    actions
    {
        addlast(Category_Category6)
        {
            actionref(SOLink; "View and Fill Linked SO")
            {
            }
        }

        addlast(Documents)
        {
            action("View and Fill Linked SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Linked SO';
                ToolTip = 'View and Fill Linked SO';
                Image = Order;
                RunObject = Page TorlysLinkedSOtoTO;
                RunPageLink = "Transfer Order No." = field("No."), Type = const(Item);
            }
        }
    }
}