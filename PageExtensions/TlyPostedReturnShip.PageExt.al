pageextension 56650 TlyPostedReturnShip extends "Posted Return Shipment"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.")

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

        moveafter("Manufacturer Code"; "Buy-from Vendor Name", "Buy-from")

        moveafter("Buy-from"; "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from County", "Buy-from Post Code", "Buy-from Country/Region Code", "Location Code", "Posting Date", "Document Date", "Return Order No.", "No. Printed")

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

        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                Caption = 'Currency Factor';
                ToolTip = 'Currency Factor';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Currency Factor"; "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")

        modify("Posting Date")
        {
            Importance = Promoted;
            Editable = false;
        }

        modify("Buy-from Vendor No.")
        {
            Importance = Standard;
            Visible = true;
            Caption = 'Vendor No.';
        }

        modify("Buy-from Contact No.")
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

        modify("Buy-from Contact")
        {
            Visible = false;
        }

        modify("Order Address Code")
        {
            Visible = true;
            Importance = Additional;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Importance = Promoted;
        }

        modify("Currency Code")
        {
            Importance = Standard;
        }

        modify("Location Code")
        {
            Editable = true;
            Importance = Standard;
        }

        modify("Purchaser Code")
        {
            Visible = false;
        }

        modify("No.")
        {
            Visible = false;
        }


        modify("Vendor Authorization No.")
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Importance = Standard;
        }

        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }

        modify("Applies-to Doc. No.")
        {
            Visible = false;
        }

        modify("Buy-from Address")
        {
            Importance = Additional;
        }

        modify("Buy-from Address 2")
        {
            Importance = Additional;
        }

        modify("Buy-from City")
        {
            Importance = Additional;
        }

        modify("Buy-from County")
        {
            Importance = Additional;
        }

        modify("Buy-from Post Code")
        {
            Importance = Additional;
        }

        modify("Buy-from Country/Region Code")
        {
            Importance = Additional;
        }

        modify("No. Printed")
        {
            Importance = Additional;
        }

    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}
