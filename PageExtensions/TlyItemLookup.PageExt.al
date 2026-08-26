pageextension 50032 TlyItemLookup extends "Item Lookup"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                Caption = 'Description 2';
                ToolTip = 'Description 2';
                ApplicationArea = All;
            }
        }

        moveafter("Description 2"; "Item Category Code")

        addafter("Item Category Code")
        {
            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
            }
        }

        modify("Base Unit of Measure")
        {
            Visible = false;
        }

        modify("Unit Price")
        {
            Visible = false;
        }

        modify(InventoryCtrl)
        {
            Visible = false;
        }

        modify("Unit Cost")
        {
            Visible = false;
        }

        modify("Vendor No.")
        {
            Visible = false;
        }

        modify("Item Category Code")
        {
            visible = true;
        }
    }
}