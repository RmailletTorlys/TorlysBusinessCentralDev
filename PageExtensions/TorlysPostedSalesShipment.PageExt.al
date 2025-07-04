pageextension 50043 TorlysPostedSalesShipment extends "Posted Sales Shipment"
{
    layout
    {
        moveafter("Sell-to Customer No."; "Ship-to Code")

        addafter("Sell-to")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
            }

            field("Rollout Order"; Rec."Roll out Order")
            {
                Caption = 'Rollout Order';
                ToolTip = 'Rollout Order';
                ApplicationArea = All;
            }

            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
            }

            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
            }
        }

        moveafter("Tag Name"; "Shipment Date", "Requested Delivery Date")

        addafter("Requested Delivery Date")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                Caption = 'Your Reference';
                ToolTip = 'Your Reference';
                ApplicationArea = All;
            }
        }

        moveafter("Your Reference"; "Salesperson Code")

        addafter("Salesperson Code")
        {

            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                Caption = 'Salesperson Code 2';
                ToolTip = 'Salesperson Code 2';
                ApplicationArea = All;
            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                Caption = 'Salesperson Commission 2';
                ToolTip = 'Salesperson Commission 2';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                Caption = 'Salesperson Code 3';
                ToolTip = 'Salesperson Code 3';
                ApplicationArea = All;
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                Caption = 'Salesperson Commission 3';
                ToolTip = 'Salesperson Commission 3';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }
        }

        moveafter("Salesperson Commission 3"; "Shortcut Dimension 2 Code")

        addafter("Shortcut Dimension 2 Code")
        {

            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'SystemCreatedAtd';
                ToolTip = 'SystemCreatedAtd';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'SystemModifiedBy';
                ToolTip = 'SystemModifiedBy';
                ApplicationArea = All;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'SystemModifiedAt';
                ToolTip = 'SystemModifiedAt';
                ApplicationArea = All;
            }
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
    }



}