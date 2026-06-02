pageextension 59745 TlyTPSCMGContainerlinesList extends "TPS CMG Container lines List"
{
    layout
    {
        moveafter("Container No."; "Line No.", "Document No.", "Document Line No")

        moveafter("Item Description"; "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("PO Quantity"; Rec."Source Quantity")
            {
                Caption = 'PO Quantity';
                ToolTip = 'PO Quantity';
                ApplicationArea = All;
                Editable = false;
            }
            field("PO Qty. to Ship"; Rec."Qty. to Ship")
            {
                Caption = 'PO Qty. to Ship';
                ToolTip = 'PO Qty. to Ship';
                ApplicationArea = All;
                Editable = false;
            }
            field("PO Quantity Shipped"; Rec."Quantity Shipped")
            {
                Caption = 'PO Quantity Shipped';
                ToolTip = 'PO Quantity Shipped';
                ApplicationArea = All;
                Editable = false;
            }
            field("TR Quantity"; Rec."Qty. to Receive")
            {
                Caption = 'TR Quantity';
                ToolTip = 'TR Quantity';
                ApplicationArea = All;
                Editable = false;
            }
            field("TR Quantity Received"; Rec."Quantity Received")
            {
                Caption = 'TR Quantity Received';
                ToolTip = 'TR Quantity Received';
                ApplicationArea = All;
                Editable = false;
            }
            field("Weight"; Rec."Weight")
            {
                Caption = 'Weight';
                ToolTip = 'Weight';
                ApplicationArea = All;
                Editable = false;
            }
            field("Cube"; Rec."Cube")
            {
                Caption = 'Cube';
                ToolTip = 'Cube';
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter(Cube)
        {
            field("Quantity Linked via PO"; Rec."Quantity Linked via PO")
            {
                Caption = 'Quantity Linked via PO';
                ToolTip = 'Quantity Linked via PO';
                ApplicationArea = All;
                Editable = false;
            }
            field("Qty. to Ship Linked via PO"; Rec."Qty. to Ship Linked via PO")
            {
                Caption = 'Qty. to Ship Linked via PO';
                ToolTip = 'Qty. to Ship Linked via PO';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("Transfer Order No."; Rec."Transfer Order No.")
            {
                Caption = 'Transfer Order No.';
                ToolTip = 'Transfer Order No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Transfer Order Line No."; Rec."Transfer Order Line No.")
            {
                Caption = 'Transfer Order Line No.';
                ToolTip = 'Transfer Order Line No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Quantity Linked via TO"; Rec."Quantity Linked via TO")
            {
                Caption = 'Quantity Linked via TO';
                ToolTip = 'Quantity Linked via TO';
                ApplicationArea = All;
                Editable = false;
            }
            field("Qty. to Ship Linked via TO"; Rec."Qty. to Ship Linked via TO")
            {
                Caption = 'Qty. to Ship Linked via TO';
                ToolTip = 'Qty. to Ship Linked via TO';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
        }

        modify("Variant Code")
        {
            Visible = false;
        }

        modify("Document Type")
        {
            Visible = false;
        }

        modify("Quantity")
        {
            Caption = 'Container Quantity';
        }

        modify("Outstanding Quantity")
        {
            Visible = false;
        }
    }
}