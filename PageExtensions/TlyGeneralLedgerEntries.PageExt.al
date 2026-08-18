pageextension 50020 TlyGeneralLedgerEntries extends "General Ledger Entries"
{
    layout
    {
        moveafter(Description; "External Document No.")

        modify("External Document No.")
        {
            Visible = true;
        }
    }
}