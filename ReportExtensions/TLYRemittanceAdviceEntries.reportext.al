reportextension 52800 "TorlysRemittanceAdviceEntries" extends "Remittance Advice - Entries"
{
    dataset
    {
        add("Vendor Ledger Entry")
        {
            column(FormattedPostingDate; Format("Posting Date", 0, '<Day,2> <Month Text,3>, <Year4>'))
            {
            }
        }
    }
}