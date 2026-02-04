reportextension 51400 "TorlysCashRequirementbyDueDate" extends "Cash Requirements by Due Date"
{
    dataset
    {
        add("Vendor Ledger Entry")
        {
            column(Payment_Method_Code; "Payment Method Code")
            { }
            column(Remaining_Amount; "Remaining Amount")
            { }
        }
        modify("vendor ledger entry")
        {
            trigger OnAfterAfterGetRecord()
            begin
                if UseVendorCurrencyCode then begin
                    remianinamt := "Remaining Amount";

                end;
            end;
        }
    }
    var
        UseVendorCurrencyCode: Boolean;
        remianinamt: Decimal;
}