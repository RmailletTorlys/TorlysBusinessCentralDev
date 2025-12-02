pageextension 50136 TorlysPostedPurchRcpt extends "Posted Purchase Receipt"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from")

        moveafter("Buy-from"; "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from County", "Buy-from Post Code", "Buy-from Country/Region Code", "Location Code", "Shipment Method Code", "Posting Date")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Order Date"; "Order No.", "Document Date", "Vendor Order No.", "Vendor Shipment No.", "No. Printed")

        addafter("No. Printed")
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        modify("Buy-from")
        {
            Visible = false;
        }

        modify("Buy-from Contact")
        {
            Visible = false;
        }

        modify("No.")
        {
            Visible = false;
        }

        modify("Buy-from Contact No.")
        {
            Visible = false;
        }

        modify("Requested Receipt Date")
        {
            Visible = false;
        }

        modify("Promised Receipt Date")
        {
            Visible = false;
        }

        modify("Quote No.")
        {
            Visible = false;
        }

        modify("Purchaser Code")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(BuyFromContactPhoneNo)
        {
            Visible = false;
        }

        modify(BuyFromContactMobilePhoneNo)
        {
            Visible = false;
        }

        modify(BuyFromContactEmail)
        {
            Visible = false;
        }

        modify("TPS CMG Transfer Order No.")
        {
            Importance = Additional;
        }

    }
    actions
    {
        addlast(Category_Category4)
        {
            actionref(LinkededSO; "View and Fill Linked SO")
            {
            }
        }

        addlast("&Receipt")
        {
            action("View and Fill Linked SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Linked SO';
                ToolTip = 'View and Fill Linked SO';
                Image = OrderTracking;
                RunObject = Page TorlysLinkedSOtoPO;
                RunPageLink = "Linked Purchase Order No." = field("No."), Type = const(Item);
            }
        }
    }
    var
        LookupUserId: Codeunit "TorlysLookupUserID";
}
