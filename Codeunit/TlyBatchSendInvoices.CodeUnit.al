codeunit 50220 TlyBatchSendInvoices
{
    TableNo = "Job Queue Entry";
    Permissions = TableData "Sales Invoice Header" = rm;

    trigger OnRun()
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        //Filter for invoices from today and No. Printer is 0
        // SalesInvHeader.SetRange("Posting Date", WorkDate());
        SalesInvHeader.SetRange("No. Printed", 0);

        if SalesInvHeader.FindSet() then
            repeat
                // EmailRecords(false) sends the email silently in the background using the Document Layout email address.
                SalesInvHeader.EmailRecords(false);
                SalesInvHeader."No. Printed" += 1;
                SalesInvHeader.Modify();
            // Commit();
            until SalesInvHeader.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", 'OnBeforeSendEmail', '', false, false)]
    local procedure OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary)
    begin
        // If the system failed to find an email address, apply the fallback
        if TempEmailItem."Send to" = '' then
            TempEmailItem."Send to" := 'MiscInvoices@torlys.com';
    end;
}
