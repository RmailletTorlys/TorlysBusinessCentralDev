reportextension 51800 "TorlysCustomerStatement1" extends "Customer Statements"
{
    dataset
    {
        add("OpenItem")
        {
            // column(Document_Date; "Document Date")
            // {

            // }
            column(ponumber2; ponumber2)
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