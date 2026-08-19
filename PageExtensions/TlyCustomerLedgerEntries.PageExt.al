pageextension 50025 TlyCustomerLedgerEntries extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Customer No.")
        {
            field("Sell-to Customer No."; Rec."Sell-to Customer No.")
            {
                ApplicationArea = All;
                Caption = 'Sell-to Customer No.';
                ToolTip = 'Sell-to Customer No.';
                Visible = true;
            }
        }

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