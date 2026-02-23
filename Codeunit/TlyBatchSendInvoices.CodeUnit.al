codeunit 50220 "BatchSendInvoices"
{
    TableNo = "Job Queue Entry";
    Permissions = TableData "Sales Invoice Header" = rm;

    trigger OnRun()
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        //Filter for invoices from today and No. Printer is 0
        SalesInvHeader.SetRange("Posting Date", WorkDate());
        SalesInvHeader.SetRange("No. Printed", 0);

        if SalesInvHeader.FindSet() then
            repeat
                // EmailRecords(false) sends the email silently in the background using the Document Layout email address.
                SalesInvHeader.EmailRecords(false);
                SalesInvHeader."No. Printed" += 1;
                SalesInvHeader.Modify();
            until SalesInvHeader.Next() = 0;
    end;
}
