reportextension 51600 "TorlysCustomerStatementNew" extends "Standard Statement"
{
    dataset
    {
        add(CustLedgEntry2)
        {
            column(PoNumber; "External Document No.")
            {

            }
            column(Amount; Amount)
            {

            }
            column(Document_Type; "Document Type")
            {

            }
            column(Document_Date; "Document Date")
            {

            }

        }
        add(Customer)
        {
            column(CustName; "Name")
            {

            }
        }
        add(DtldCustLedgEntries)
        {
            column(Amount1; Amount)
            {

            }
            column(Document_Type1; "Document Type")
            {

            }
            column(ponumber1; CustLedgEntry2."External Document No.")
            {

            }
            // column(Document_Date1; "Document Date")
            // {

            // }
        }
        // add(openitem)
        // {
        //     column(tempPONumber; TempCustLedgEntry."External Document No.")
        //     {

        //     }
        // }
    }
}