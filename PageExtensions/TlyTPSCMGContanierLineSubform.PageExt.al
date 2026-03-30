pageextension 59741 TlyTPSCMGContanierLineSubform extends "TPS CMG Contanier Line Subform"
{
    layout
    {
        addafter("Quantity Shipped")
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
    }
}