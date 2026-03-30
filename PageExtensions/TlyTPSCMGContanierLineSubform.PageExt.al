pageextension 59741 TlyTPSCMGContanierLineSubform extends "TPS CMG Contanier Line Subform"
{
    layout
    {
        addafter("Quantity Shipped")
        {
            field("Quantity Linked"; Rec."Quantity Linked")
            {
                Caption = 'Quantity Linked';
                ToolTip = 'Quantity Linked';
                ApplicationArea = All;
                Editable = false;
            }
            field("Qty. to Ship Linked"; Rec."Qty. to Ship Linked")
            {
                Caption = 'Qty. to Ship Linked';
                ToolTip = 'Qty. to Ship Linked';
                ApplicationArea = All;
                Editable = false;
            }
        }

        modify("Variant Code")
        {
            Visible = false;
        }
    }
}