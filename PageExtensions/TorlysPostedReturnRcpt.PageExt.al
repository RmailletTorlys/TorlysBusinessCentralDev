pageextension 56660 TorlysPostedReturnRcpt extends "Posted Return Receipt"
{
    layout
    {
        moveafter("Sell-to Customer No."; "Ship-to Code", "Sell-to Customer Name", "Sell-to Address", "Sell-to Address 2", "Sell-to City", "Sell-to County", "Sell-to Post Code", "Sell-to Country/Region Code")

        addafter("Sell-to Country/Region Code")
        {
            field("Order Method"; Rec."Order Method")
            {
                Caption = 'Order Method';
                ToolTip = 'Order Method';
                ApplicationArea = All;
            }
        }

        addafter("Order Method")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                Caption = 'Your Reference';
                ToolTip = 'Your Reference';
                ApplicationArea = All;
            }
        }


        moveafter("Your Reference"; "External Document No.")

        addafter("External Document No.")
        {
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
            }
            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
                Editable = false;
            }
            field("Reason Code"; Rec."Reason Code")
            {
                Caption = 'Reason Code';
                ToolTip = 'Reason Code';
                ApplicationArea = All;
            }
            field("Original Invoice No."; Rec."Original Invoice No.")
            {
                Caption = 'Original Invoice No.';
                ToolTip = 'Original Invoice No.';
                ApplicationArea = All;
                Importance = Standard;
            }
            field("Rebill Invoice No."; Rec."Rebill Invoice No.")
            {
                Caption = 'Rebill Invoice No.';
                ToolTip = 'Rebill Invoice No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Rebill Invoice No."; "Return Order No.", "Posting Date")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Standard;
            }
            field("Order Time"; Rec."Order Time")
            {
                Caption = 'Order Time';
                ToolTip = 'Order Time';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
        }

        moveafter("Order Time"; "Location Code", "No. Printed")

        addafter("No. Printed")
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

        addbefore("Ship-to Name")
        {
            field("Ship-to Code1"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
        }

        moveafter("Shortcut Dimension 2 Code"; "Salesperson Code")

        modify("Sell-to Contact No.")
        {
            Visible = false;
        }

        modify("Sell-to")
        {
            Visible = false;
        }

        modify("Sell-to Contact")
        {
            Visible = false;
        }

        modify(SellToPhoneNo)
        {
            Visible = false;
        }

        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }

        modify(SellToEmail)
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify("Bill-to Contact No.")
        {
            Visible = false;
        }

        modify("Bill-to Contact")
        {
            Visible = false;
        }

        modify(BillToContactPhoneNo)
        {
            Visible = false;
        }

        modify(BillToContactMobilePhoneNo)
        {
            Visible = false;
        }

        modify(BillToContactEmail)
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Ship-to Contact")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Shipment Date")
        {
            Visible = false;
        }

        modify("Shipping Agent Code")
        {
            Importance = Standard;
        }

    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;
}
