pageextension 50010 TorlysSalesCrMemoSubForm extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                visible = true;
                enabled = false;

            }
        }
    }
}


// If Compare UoM is not Case or Blank, error message
// Case or Pallet UoM not set up
