pageextension 50130 TlyPostedSalesShipment extends "Posted Sales Shipment"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")

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
            field("Order Type"; Rec."Order Type")
            {
                Caption = 'Order Type';
                ToolTip = 'Order Type';
                ApplicationArea = All;
            }
            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Temporary Hold"; "Posting Date")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
            field("Order Time"; Rec."Order Time")
            {
                Caption = 'Order Time';
                ToolTip = 'Order Time';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
        }

        moveafter("Order Time"; "Location Code", "Shipment Date")

        addafter("Shipment Date")
        {
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                ApplicationArea = All;
                Importance = Standard;
            }
            field("Order Comment"; Rec."Order Comment")
            {
                Caption = 'Order Comment';
                ToolTip = 'Order Comment';
                ApplicationArea = All;
                Importance = Standard;
            }
        }
        moveafter("Order Comment"; "Order No.", "No. Printed")

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

        addfirst(Shipping)
        {
            field("Ship-to Code1"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
                Editable = false;
                Importance = Standard;
            }
        }

        moveafter("Shipping Agent Code"; "Shipping Agent Service Code")

        addafter("Shipping Agent Service Code")
        {
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Importance = Standard;
                MultiLine = true;
            }
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
                ApplicationArea = All;
                Importance = Standard;
                TableRelation = TlyFreightZone;
            }
            field("BOL No."; Rec."BOL No.")
            {
                Caption = 'BOL No.';
                ToolTip = 'BOL No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Shortcut Dimension 2 Code"; "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                Caption = 'Salesperson Code 2';
                ToolTip = 'Salesperson Code 2';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                Caption = 'Salesperson Commission 2';
                ToolTip = 'Salesperson Commission 2';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                Caption = 'Salesperson Code 3';
                ToolTip = 'Salesperson Code 3';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                Caption = 'Salesperson Commission 3';
                ToolTip = 'Salesperson Commission 3';
                ApplicationArea = All;
                Importance = Additional;
            }
        }


        // addafter("Billing")
        // {
        //     group("Marketing")
        //     {
        //         Caption = 'Marketing';

        //         field("Sample Allowance Exclusion"; Rec."Sample Allowance Exclusion")
        //         {
        //             Caption = 'Sample Allowance Exclusion';
        //             ToolTip = 'Sample Allowance Exclusion';
        //             ApplicationArea = All;
        //         }

        //         field("MK Required"; Rec."MK Required")
        //         {
        //             Caption = 'MK Required';
        //             ToolTip = 'MK Required';
        //             ApplicationArea = All;
        //         }

        //         field("MK Required Type"; Rec."MK Required Type")
        //         {
        //             Caption = 'MK Required Type';
        //             ToolTip = 'MK Required Type';
        //             ApplicationArea = All;
        //         }
        //         field("MK Staged Location"; Rec."MK Staged Location")
        //         {
        //             Caption = 'MK Staged Location';
        //             ToolTip = 'MK Staged Location';
        //             ApplicationArea = All;
        //         }
        //         field("MK Staged By"; Rec."MK Staged By")
        //         {
        //             Caption = 'MK Staged By';
        //             ToolTip = 'MK Staged By';
        //             ApplicationArea = All;
        //         }

        //         field("MK Staged Date"; Rec."MK Staged Date")
        //         {
        //             Caption = 'MK Staged Date';
        //             ToolTip = 'MK Staged Date';
        //             ApplicationArea = All;
        //         }

        //         field("Marketing Shipment Transfer"; Rec."Marketing Shipment Transfer")
        //         {
        //             Caption = 'Marketing Shipment or Transfer';
        //             ToolTip = 'Specifies if the order is a Shipment or a Transfer';
        //             ApplicationArea = All;
        //         }
        //     }
        // }

        modify("No.")
        {
            Visible = false;
        }

        modify("Sell-to Customer No.")
        {
            Visible = true;
            Caption = 'Customer No.';
        }

        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }

        modify(SellToEmail)
        {
            Visible = false;
        }

        modify("Sell-to Contact")
        {
            Visible = false;
        }

        modify("Sell-to")
        {
            Visible = false;
        }

        modify("Sell-to Contact No.")
        {
            Visible = false;
        }

        modify(SellToPhoneNo)
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Promised Delivery Date")
        {
            Visible = false;
        }

        modify("Quote No.")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(GetWorkDescription)
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

        modify("Outbound Whse. Handling Time")
        {
            Visible = false;
        }

        modify("Shipping Time")
        {
            Visible = false;
        }

        modify("Shipping Agent Code")
        {
            Importance = Standard;
        }

        modify("Package Tracking No.")
        {
            Importance = Standard;
        }

        modify(BillToContactPhoneNo)
        {
            Visible = false;
        }

        modify(BillToContactMobilePhoneNo)
        {
            Visible = false;
        }

        modify("Bill-to Contact No.")
        {
            Visible = false;
        }

        modify(BillToContactEmail)
        {
            Visible = false;
        }

        modify("Bill-to Contact")
        {
            Visible = false;
        }

        modify("External Document No.")
        {
            Importance = Standard;
        }
        modify("Shipment Method Code")
        {
            Visible = false;
        }
    }

    actions
    {
        addfirst("F&unctions")
        {
            action(RemoveBOL)
            {
                ApplicationArea = All;
                Caption = 'Remove BOL #';
                Image = CheckList;
                ToolTip = 'Clear the BOL # from the current shipment.';
                trigger OnAction()
                var
                    ShipmentHeaderEdit: Codeunit "Shipment Header - Edit";
                begin
                    ShipmentHeaderEdit.Run(Rec);
                end;
            }
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