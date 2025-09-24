pageextension 50055 TorlysPurchaseInvoiceSubform extends "Purch. Invoice Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Reference No."; Rec."Vendor Item No.")
            {
                Caption = 'Vendor Reference No.';
                ToolTip = 'Vendor Reference No.';
                ApplicationArea = All;
            }
        }
        modify("Item Reference No.")
        {
            Visible = false;
        }
    }
}