pageextension 50005 TorlysSalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        movebefore(Quantity; "Unit of Measure")

        addafter(Quantity)
        {
            field("Case Quantity"; Rec."Quantity Case")
            {
                Caption = 'Case Quantity';
                ToolTip = 'Case Quantity';
                ApplicationArea = All;

            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;

            }
        }

        moveafter("Pallet Quantity"; "Qty. to Ship")
        addafter("Qty. to Ship")
        {
            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;

            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;

            }

        }
        moveafter("Qty. to Ship Pallet"; "Quantity Shipped")
        addafter("Quantity Shipped")
        {
            field("Qty. Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
            {
                Caption = 'Qty. Shipped Not Invoiced';
                ToolTip = 'Qty. Shipped Not Invoiced';
                ApplicationArea = All;
            }
        }

        addafter("Qty. Shipped Not Invoiced")
        {
            field("Quantity to Invoice"; Rec."Qty. to Invoice")
            {
                Caption = 'Quantity to Invoice';
                ToolTip = 'Quantity to Invoice';
                ApplicationArea = All;

            }
        }

        addafter("Unit of Measure Code")
        {
            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
            }

            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
            }

            field("Price List"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
            }
        }

        moveafter("Quantity to Invoice"; "Quantity Invoiced", "Total Amount Excl. VAT", "Unit Cost (LCY)", "Line Amount", "Purchasing Code", "Drop Shipment")

        addafter("Drop Shipment")
        {
            field("PO No."; Rec."Purchase Order No.")
            {
                Caption = 'PO Number';
                ToolTip = 'Purchase Order No.';
                ApplicationArea = All;

            }
        }

        addafter("PO No.")
        {
            field("PO Line No."; Rec."Purch. Order Line No.")
            {
                Caption = 'PO Line No.';
                ToolTip = 'Purch. Order Line No.';
                ApplicationArea = All;

            }
        }

        moveafter("PO Line No."; "Special Order")

        addafter("Special Order")
        {
            field("Special Order PO No."; Rec."Special Order Purchase No.")
            {
                Caption = 'Special Order PO No.';
                ToolTip = 'Special Order PO No.';
                ApplicationArea = All;

            }
        }

        addafter("Special Order PO No.")
        {
            field("Special Order PO Line No."; Rec."Special Order Purch. Line No.")
            {
                Caption = 'Special Order PO Line No.';
                ToolTip = 'Special Order Line No.';
                ApplicationArea = All;

            }
        }





        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }
    }
}



