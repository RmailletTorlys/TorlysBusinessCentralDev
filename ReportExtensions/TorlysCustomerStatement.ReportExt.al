reportextension 50200 "TorlysCustomerStatement" extends "Standard Statement"
{
    dataset
    {
        add(CustLedgEntry2)
        {
            column(PoNumber; "External Document No.")
            {

            }
        }
    }
}