pageextension 50301 TlyShiptoAddressList extends "Ship-to Address List"
{
    layout
    {
        moveafter("Code"; "Name", "Address", "Address 2", "City")

        addafter("City")
        {
            field("County"; Rec."County")
            {
                ApplicationArea = All;
                Caption = 'County';
                ToolTip = 'County';
            }
        }

        moveafter(County; "Post Code", "Country/Region Code", "Phone No.", "Fax No.")

        addafter("Fax No.")
        {
            field("E-mail"; Rec."E-mail")
            {
                ApplicationArea = All;
                Caption = 'E-mail';
                ToolTip = 'E-mail';
                Visible = false;
            }
        }

        moveafter("E-mail"; "Location Code")

        addafter("Location Code")
        {
            field("Shipping Agent Code"; Rec."Shipping Agent Code")
            {
                ApplicationArea = All;
                Caption = 'Shipping Agent Code';
                ToolTip = 'Shipping Agent Code';
            }
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = All;
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
            }
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                ApplicationArea = All;
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                ApplicationArea = All;
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
            }
        }

        modify(Address)
        {
            Visible = true;
        }

        modify("Address 2")
        {
            Visible = true;
        }

        modify("Post Code")
        {
            Visible = true;
        }
        modify("Country/Region Code")
        {
            Visible = false;
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        modify("Fax No.")
        {
            Visible = false;
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}
