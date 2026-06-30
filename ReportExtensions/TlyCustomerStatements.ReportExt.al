reportextension 51800 TlyCustomerStatements extends "Customer Statements"
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
        add("OpenItem")
        {
            // column(Document_Date; "Document Date")
            // {

            // }
            column(ponumber2; ponumber2)
            {

            }
            column(tempPONumber; TempCustLedgEntry."External Document No.")
            {

            }
        }

        modify(OpenItem)
        {
            trigger OnAfterAfterGetRecord()
            begin
                // CustLedgerEntry1.Get(Cust);
                DocDate := CustLedgerEntry1."Document Date";
                ponumber2 := CustLedgerEntry1."External Document No.";
            end;
        }
    }
    var
        CustLedgerEntry1: Record "Cust. Ledger Entry";
        DocDate: Date;
        ponumber2: code[20];
}