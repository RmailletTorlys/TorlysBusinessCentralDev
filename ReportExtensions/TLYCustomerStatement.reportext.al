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
            // column(ponumber1; CustLedgEntry2."External Document No.")
            column(ponumber2; ponumber2)
            {

            }
            column(DocDate; DocDate)
            {

            }
        }
        modify(DtldCustLedgEntries)
        {
            trigger OnAfterAfterGetRecord()
            begin
                CustLedgerEntry1.Get("Cust. Ledger Entry No.");
                DocDate := CustLedgerEntry1."Document Date";
                ponumber2 := CustLedgerEntry1."External Document No.";
            end;
        }
        // add(openitem)
        // {
        //     column(tempPONumber; TempCustLedgEntry."External Document No.")
        //     {

        //     }
        // }
    }
    var
        CustLedgerEntry1: Record "Cust. Ledger Entry";
        DocDate: Date;
        ponumber2: code[20];
}