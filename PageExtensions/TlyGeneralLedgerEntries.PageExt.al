pageextension 50020 TlyGeneralLedgerEntries extends "General Ledger Entries"
{
    layout
    {
        moveafter(Description; "External Document No.", "Reason Code")

        modify("External Document No.")
        {
            Visible = true;
        }

        modify("Reason Code")
        {
            Visible = true;
        }
    }
}