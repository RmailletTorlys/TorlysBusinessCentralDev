reportextension 50200 "TorlysCustomerStatement" extends "Customer Statements"
{
    dataset
    {
        add(CustLedgerEntry4)
        {
            column(PoNumber; "External Document No.")
            {

            }
        }
        add(Customer)
        {
            column(CustName; "Name")
            {

            }
        }
    }
}