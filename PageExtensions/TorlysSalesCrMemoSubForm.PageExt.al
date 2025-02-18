pageextension 50004 TorlysSalesCrMemoSubForm extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Case Quantity"; Rec."Quantity Case")
            {
                ToolTip = 'Case Quantity';
                Caption = 'Case Quantity';
                ApplicationArea = All;

            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                ToolTip = 'Pallet Quantity';
                Caption = 'Pallet Quantity';
                ApplicationArea = All;

            }
        }
    }
}
