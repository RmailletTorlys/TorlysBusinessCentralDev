reportextension 51400 "TorlysCashRequirementbyDueDate" extends "Cash Requirements by Due Date"
{
    dataset
    {
        add("Vendor Ledger Entry")
        {
            column(Payment_Method_Code; "Payment Method Code")
            { }
        }
    }
}