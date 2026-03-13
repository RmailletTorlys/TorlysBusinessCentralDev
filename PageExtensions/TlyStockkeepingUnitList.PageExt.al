pageextension 55701 TlyStockkeepingUnitList extends "Stockkeeping Unit List"
{
    layout
    {

        moveafter(Description; "Location Code", "Replenishment System")

        addafter("Replenishment System")
        {
            field("Vendor No."; Rec."Vendor No.")
            {
                ApplicationArea = All;
                Caption = 'Vendor No.';
                ToolTip = 'Vendor No.';
            }
            field("Vendor Item No."; Rec."Vendor Item No.")
            {
                ApplicationArea = All;
                Caption = 'Vendor Item No.';
                ToolTip = 'Vendor Item No.';
            }
            field("Last Direct Cost"; Rec."Last Direct Cost")
            {
                ApplicationArea = All;
                Caption = 'Last Direct Cost';
                ToolTip = 'Last Direct Cost';
            }
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
            }
        }
        addafter(Inventory)
        {
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = All;
                Caption = 'Qty. on Sales Order';
                ToolTip = 'Qty. on Sales Order';
            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = All;
                Caption = 'Qty. on Purch. Order';
                ToolTip = 'Qty. on Purch. Order';
            }
            field("Qty. in Transit"; Rec."Qty. in Transit")
            {
                ApplicationArea = All;
                Caption = 'Qty. in Transit';
                ToolTip = 'Qty. in Transit';
            }

            field("Safety Stock"; Rec."Safety Stock Quantity")
            {
                ApplicationArea = All;
                Caption = 'Safety Stock';
                ToolTip = 'Safety Stock';
            }

            // add fields here about physical inventory counting
        }

        modify("Variant Code")
        {
            Visible = false;
        }
    }
}