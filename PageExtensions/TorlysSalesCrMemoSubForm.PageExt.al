pageextension 50012 TorlysSalesCrMemoSubForm extends "Sales Cr. Memo Subform"
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


// If Compare UoM is not Case or Blank, error message
// Case or Pallet UoM not set up
