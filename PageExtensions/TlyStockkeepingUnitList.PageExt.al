pageextension 55701 TlyStockkeepingUnitList extends "Stockkeeping Unit List"
{
    layout
    {

        addafter(Description)
        {
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

            // add fields here about physical inventory counting
        }

        modify("Variant Code")
        {
            Visible = false;
        }
    }
}