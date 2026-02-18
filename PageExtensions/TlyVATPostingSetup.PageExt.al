pageextension 50742 TlyVATPostingSetup extends "VAT Posting Setup"
{
    layout
    {
        moveafter("VAT Calculation Type"; "Adjust for Payment Discount")

        modify("Adjust for Payment Discount")
        {
            Visible = true;
        }
    }
}