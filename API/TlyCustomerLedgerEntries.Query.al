query 56019 TlyCustomerLedgerEntries
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(entry; "Cust. Ledger Entry")
        {
            DataItemTableFilter = Open = const(true);
            column(customerNo; "Customer No.") { }
            column(documentNo; "Document No.") { }
            column(dueDate; "Due Date") { }
            column(remainingAmountLCY; "Remaining Amt. (LCY)") { }
        }
    }
}