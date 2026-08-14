codeunit 50034 TlyBOLBatchSend
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        DocumentLayout: Record "Custom Report Selection";
        ProcessedBOL: Record TlyProcessedBillOfLadingHeader;
        TempProcessedBOL: Record TlyProcessedBillOfLadingHeader;
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        AttachmentName: Text;
        EmailBody: Text;
    begin
        // Scans Document Layout table
        DocumentLayout.Reset();
        DocumentLayout.SetRange("Report ID", 50009);
        DocumentLayout.SetFilter("Send To Email", '<>%1', '');

        if DocumentLayout.FindSet() then
            repeat
                // Look for yesterday's processed BOLs matching strictly by customer and ship-to code
                ProcessedBOL.Reset();
                ProcessedBOL.SetRange("Customer No.", DocumentLayout."Source No.");
                ProcessedBOL.SetRange("Ship-to Code", DocumentLayout."Ship-to Code");

                // Filter for yesterday's records
                ProcessedBOL.SetRange(
                    SystemCreatedAt,
                    CreateDateTime(CalcDate('<-1D>', WorkDate()), 0T),
                    CreateDateTime(WorkDate(), 0T));

                // Loop found BOLs and email them to the document layout specific email list
                if ProcessedBOL.FindSet() then
                    repeat
                        // Isolating dataset specifically for this individual BOL record in Report
                        TempProcessedBOL.Reset();
                        TempProcessedBOL.SetRange("No.", ProcessedBOL."No.");

                        Clear(TempBlob);
                        TempBlob.CreateOutStream(OutStr);

                        Report.SaveAs(
                            50009,
                            '',
                            ReportFormat::Pdf,
                            OutStr,
                            TempProcessedBOL);

                        TempBlob.CreateInStream(InStr);

                        Clear(EmailMessage);

                        EmailBody := 'Shipping Notification<br>' +
                                     '(This is not a pick-up notification)<br><br>' +
                                     'Dear Valued Customer ' + DocumentLayout."Send To Email" + ',<br><br>' +
                                     'Please be advised that your cargo was shipped from our Warehouse today<br><br>' +
                                     'Please find attached BOL for your ready reference:<br><br>' +
                                     '• TORLYS’ BOL no. indicated in Box no 4: Consignor’s no <b>' + ProcessedBOL."No." + '</b>,<br><br>' +
                                     'At the time of pick up, please do present:<br><br>' +
                                     '• Copy of the attached TORLYS BOL<br>' +
                                     '• Validate the total number of pieces and labels to make sure you pick up the correct cargo.<br><br>' +
                                     'For any further information, please reach out to customer service team at TORLYS <a href="mailto:customerservice@torlys.com">customerservice@torlys.com</a><br><br>' +
                                     'Regards,<br>' +
                                     'TORLYS Customer Service';

                        EmailMessage.Create(
                            DocumentLayout."Send To Email",
                            StrSubstNo('TORLYS Shipping Notification - BOL %1', ProcessedBOL."No."),
                            EmailBody,
                            true);

                        AttachmentName := StrSubstNo('%1.pdf', ProcessedBOL."No.");

                        EmailMessage.AddAttachment(
                            AttachmentName,
                            'application/pdf',
                            InStr);

                        Email.Send(EmailMessage);
                    until ProcessedBOL.Next() = 0;
            until DocumentLayout.Next() = 0;
    end;
}
