codeunit 50320 TlyBatchSendCreditMemo
{
    TableNo = "Job Queue Entry";
    Permissions = TableData "Sales Cr.Memo Header" = rm;

    trigger OnRun()
    var
        SalesCreditMemoHeader: Record "Sales Cr.Memo Header";
    begin
        //Filter for Cr memo from today and No. Printer is 0
        SalesCreditMemoHeader.SetRange("No. Printed", 0);

        if SalesCreditMemoHeader.FindSet() then
            repeat
                // EmailRecords(false) sends the email silently in the background using the Document Layout email address.
                SalesCreditMemoHeader.EmailRecords(false);
                SalesCreditMemoHeader."No. Printed" += 1;
                SalesCreditMemoHeader.Modify();
            // Commit();
            until SalesCreditMemoHeader.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", 'OnBeforeSendEmail', '', false, false)]
    local procedure OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary)
    begin
        // If the system failed to find an email address, apply the fallback
        if TempEmailItem."Send to" = '' then
            TempEmailItem."Send to" := 'MiscInvoices@torlys.com';
    end;
}
