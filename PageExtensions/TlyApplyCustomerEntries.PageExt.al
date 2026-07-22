pageextension 50232 TlyApplyCustomerEntries extends "Apply Customer Entries"
{
    layout
    {
        addafter("ApplyingCustLedgEntry.""Document No.""")
        {
            field("ApplyingCustLedgEntry.""External Document No."""; TempApplyingCustLedgEntry."External Document No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'External Document No.';
                Editable = false;
                ToolTip = 'Specifies the external document number of the entry to be applied.';
            }
        }

        moveafter("Document No."; "External Document No.")

        modify("External Document No.")
        {
            Visible = true;
        }
    }
}