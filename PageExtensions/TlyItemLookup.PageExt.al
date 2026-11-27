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
            field("New Item"; Rec."New Item")
            {
                Caption = 'New Item';
                ToolTip = 'New Item';
                ApplicationArea = All;
                Visible = true;
            }

            field("Current Item"; Rec."Current Item")
            {
                Caption = 'Current Item';
                ToolTip = 'Current Item';
                ApplicationArea = All;
                Visible = true;
            }

            field("Inactive Current Item"; Rec."Inactive Current Item")
            {
                Caption = 'Inactive Current Item';
                ToolTip = 'Inactive Current Item';
                ApplicationArea = All;
                Visible = true;
            }

            field("Sunset Item"; Rec."Sunset Item")
            {
                Caption = 'Sunset Item';
                ToolTip = 'Sunset Item';
                ApplicationArea = All;
                Visible = true;
            }

            field("Discontinued Item"; Rec."Discontinued Item")
            {
                Caption = 'Discontinued Item';
                ToolTip = 'Discontinued Item';
                ApplicationArea = All;
                Visible = true;
            }

            field("Landed Cost (CAD)"; Rec."Unit Cost")
            {
                Caption = 'Landed Cost (CAD)';
                ToolTip = 'Landed Cost (CAD)';
                ApplicationArea = All;
                Visible = true;
            }

            field("Sales (Qty.) - 13W"; Rec."Sales (Qty.) - 90D")
            {
                Caption = 'Sales (Qty.) - 13W';
                ToolTip = 'Sales (Qty.) - 13W';
                ApplicationArea = All;
                Visible = true;
            }

            field("Purchases (Qty.) - 13W"; Rec."Purchases (Qty.) - 90D")
            {
                Caption = 'Purchases (Qty.) - 13W';
                ToolTip = 'Purchases (Qty.) - 13W';
                ApplicationArea = All;
                Visible = true;
            }

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Visible = true;
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

    trigger OnOpenPage()
    begin
        Rec.SetRange(Rec."90D Filter", WorkDate() - 91, WorkDate());
    end;
}