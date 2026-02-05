pageextension 50466 TlyTaxJurisdictions extends "Tax Jurisdictions"
{
    layout
    {
        moveafter("Description"; "Print Description")

        modify("Print Description")
        {
            Visible = true;
        }
    }
}