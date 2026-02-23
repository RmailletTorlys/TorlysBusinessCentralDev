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
                Visible = false;
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                ApplicationArea = All;
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
            }
            field("Ships On - Monday"; Rec."Ships On - Monday")
            {
                Caption = 'Ships On - Monday';
                ToolTip = 'Ships On - Monday';
                ApplicationArea = All;
            }
            field("Ships On - Tuesday"; Rec."Ships On - Tuesday")
            {
                Caption = 'Ships On - Tuesday';
                ToolTip = 'Ships On - Tuesday';
                ApplicationArea = All;
            }
            field("Ships On - Wednesday"; Rec."Ships On - Wednesday")
            {
                Caption = 'Ships On - Wednesday';
                ToolTip = 'Ships On - Wednesday';
                ApplicationArea = All;
            }
            field("Ships On - Thursday"; Rec."Ships On - Thursday")
            {
                Caption = 'Ships On - Thursday';
                ToolTip = 'Ships On - Thursday';
                ApplicationArea = All;
            }
            field("Ships On - Friday"; Rec."Ships On - Friday")
            {
                Caption = 'Ships On - Friday';
                ToolTip = 'Ships On - Friday';
                ApplicationArea = All;
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
