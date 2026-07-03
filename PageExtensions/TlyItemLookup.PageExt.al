pageextension 50032 TlyItemLookup extends "Item Lookup"
{
    layout
    {
        moveafter(Description; "Search Description", "Item Category Code")

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

        modify("Search Description")
        {
            Visible = true;
        }

        modify("Item Category Code")
        {
            visible = true;
        }
    }
}