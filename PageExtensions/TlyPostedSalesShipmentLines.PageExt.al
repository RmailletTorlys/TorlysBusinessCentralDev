pageextension 50525 TlyPostedSalesShipmentLines extends "Posted Sales Shipment Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                Caption = 'Posting Date';
                ToolTip = 'Posting Date';
                ApplicationArea = All;
            }
            field("Order No."; Rec."Order No.")
            {
                Caption = 'Order No.';
                ToolTip = 'Order No.';
                ApplicationArea = All;
            }
        }

        moveafter("Order No."; "Sell-to Customer No.")

        addafter("Sell-to Customer No.")
        {
            field("External Document No."; Rec."External Document No.")
            {
                Caption = 'External Document No.';
                ToolTip = 'External Document No.';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                Caption = 'Salesperson Code';
                ToolTip = 'Salesperson Code';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        addafter("No.")
        {
            field("Item Reference No."; Rec."Item Reference No.")
            {
                Caption = 'Item Reference No.';
                ToolTip = 'Item Reference No.';
                ApplicationArea = All;
            }
        }

        moveafter("Item Reference No."; Description, "Location Code", "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
            }
            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
            }
            field("Qty. Shipped Not Invoiced"; Rec."Qty. Shipped Not Invoiced")
            {
                Caption = 'Qty. Shipped Not Invoiced';
                ToolTip = 'Qty. Shipped Not Invoiced';
                ApplicationArea = All;
            }
        }

        moveafter("Qty. Shipped Not Invoiced"; "Quantity Invoiced", "Shipment Date")

        addafter("Shipment Date")
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Visible = true;
            }

            //     field("Sales Price Code"; Rec."Sales Price Code")
            //     {
            //         Caption = 'Sales Price Code';
            //         ToolTip = 'Sales Price Code';
            //         ApplicationArea = All;
            //         Editable = false;
            //         Visible = true;
            //     }
            //     field("Default Price List"; Rec."Default Price List")
            //     {
            //         Caption = 'Default Price List';
            //         ToolTip = 'Default Price List';
            //         ApplicationArea = All;
            //         Editable = false;
            //         Visible = true;
            //     }

            //     field("Price List"; Rec."Price List")
            //     {
            //         Caption = 'Price List';
            //         ToolTip = 'Price List';
            //         ApplicationArea = All;
            //         Editable = false;
            //         Visible = true;
            //     }
            // }

            // moveafter("Price List"; "Unit Price")

            // addafter("Unit Price")
            // {
            //     field("Line Amount"; Rec."Line Amount")
            //     {
            //         Caption = 'Line Amount';
            //         ToolTip = 'Line Amount';
            //         ApplicationArea = All;
            //         Editable = false;
            //         Visible = true;
            //     }
            //     field("Unit Cost"; Rec."Unit Cost")
            //     {
            //         Caption = 'Unit Cost';
            //         ToolTip = 'Unit Cost';
            //         ApplicationArea = All;
            //         Editable = false;
            //         Visible = true;
            //     }
            // }

            // moveafter("Unit Cost"; "Unit Cost (LCY)")

            // addafter("Unit Cost (LCY)")
            // {
            //     field("Tax Group Code"; Rec."Tax Group Code")
            //     {
            //         Caption = 'Tax Group Code';
            //         ToolTip = 'Tax Group Code';
            //         ApplicationArea = All;
            //         Visible = true;
            //     }
            //     field("Tax Area Code"; Rec."Tax Area Code")
            //     {
            //         Caption = 'Tax Area Code';
            //         ToolTip = 'Tax Area Code';
            //         ApplicationArea = All;
            //         Visible = true;
            //     }
            field("Builder Description"; Rec."Builder Description")
            {
                Caption = 'Builder Description';
                ToolTip = 'Builder Description';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order No."; Rec."Master Project Order No.")
            {
                Caption = 'Master Project Order No.';
                ToolTip = 'Master Project Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order Line No."; Rec."Master Project Order Line No.")
            {
                Caption = 'Master Project Order Line No.';
                ToolTip = 'Master Project Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Purchasing Code"; Rec."Purchasing Code")
            {
                Caption = 'Purchasing Code';
                ToolTip = 'Purchasing Code';
                ApplicationArea = All;
                Visible = true;
            }
            field("Drop Shipment"; Rec."Drop Shipment")
            {
                Caption = 'Drop Shipment';
                ToolTip = 'Drop Shipment';
                ApplicationArea = All;
                Visible = true;
            }
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Created Date"; Rec."SystemCreatedAt")
            {
                Caption = 'Created Date';
                ToolTip = 'Created Date';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}