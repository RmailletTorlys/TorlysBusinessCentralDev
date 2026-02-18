pageextension 50466 TlyTaxJurisdictions extends "Tax Jurisdictions"
{
    layout
    {
        moveafter("Description"; "Print Description", "Adjust for Payment Discount")

        modify("Print Description")
        {
            Visible = true;
        }
        modify("Adjust for Payment Discount")
        {
            Visible = true;
        }
    }
}