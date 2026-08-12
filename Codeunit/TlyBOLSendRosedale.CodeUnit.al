codeunit 50033 TlyBatchSendBOLRosedale
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        ProcessedBOL: Record TlyProcessedBillOfLadingHeader;
        TempProcessedBOL: Record TlyProcessedBillOfLadingHeader;
        Customer: Record Customer;
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        LastCustomerNo: Code[20];
        LastShipToCode: Code[20];
        AttachmentName: Text;
        varEmail: Text;
        varBOL: Code[20];
        EmailBody: Text;
    begin
        ProcessedBOL.Reset();

        ProcessedBOL.SetCurrentKey("Customer No.", "Ship-to Code");

        // Carrier filter
        ProcessedBOL.SetFilter(
            "Shipping Agent Code",
            'ROSE PPD|ROSE ED BD|ROSE PU ED');

        // Province filter
        ProcessedBOL.SetFilter(
            "Ship-To County",
            'AB|MB|SK');

        // Filter for today's records
        // ProcessedBOL.SetRange(
        //     SystemCreatedAt,
        //     CreateDateTime(WorkDate(), 0T),
        //     CurrentDateTime());
        ProcessedBOL.SetRange(
            SystemCreatedAt,
            CreateDateTime(CalcDate('<-1D>', WorkDate()), 0T),
            CreateDateTime(WorkDate(), 0T));


        if ProcessedBOL.FindSet() then
            repeat
                // Prevent duplicate emails for the same Customer/Ship-to grouping combination
                if (LastCustomerNo <> ProcessedBOL."Customer No.") or
                   (LastShipToCode <> ProcessedBOL."Ship-to Code")
                then begin

                    LastCustomerNo := ProcessedBOL."Customer No.";
                    LastShipToCode := ProcessedBOL."Ship-to Code";

                    if Customer.Get(ProcessedBOL."Customer No.") then begin

                        //dataset specifically for Report 50009
                        TempProcessedBOL.Reset();
                        TempProcessedBOL.SetRange(
                            "Customer No.",
                            ProcessedBOL."Customer No.");

                        TempProcessedBOL.SetRange(
                            "Ship-to Code",
                            ProcessedBOL."Ship-to Code");

                        TempProcessedBOL.SetFilter(
                            "Shipping Agent Code",
                            'ROSE PPD|ROSE ED BD|ROSE PU ED');

                        TempProcessedBOL.SetFilter(
                            "Ship-To County",
                            'AB|MB|SK');

                        // TempProcessedBOL.SetRange(
                        //     SystemCreatedAt,
                        //     CreateDateTime(WorkDate(), 0T),
                        //     CurrentDateTime());
                        TempProcessedBOL.SetRange(
                            SystemCreatedAt,
                            CreateDateTime(CalcDate('<-1D>', WorkDate()), 0T),
                            CreateDateTime(WorkDate(), 0T));

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

                        // Get correct recipient address and tracking variables
                        varEmail := GetEmailAddress(ProcessedBOL."Customer No.", ProcessedBOL."Ship-to Code");
                        varBOL := ProcessedBOL."No.";

                        EmailBody := 'Shipping Notification<br>' +
                                     '(This is not a pick-up notification)<br><br>' +
                                     'Dear Valued Customer ' + varEmail + ',<br><br>' +
                                     'Please be advised that your cargo was shipped from our Warehouse with Rosedale today<br><br>' +
                                     'Please find attached BOL for your ready reference:<br><br>' +
                                     '• TORLYS’ BOL no. indicated in Box no 4: Consignor’s no <b>' + varBOL + '</b>,<br><br>' +
                                     'Please feel free to track this shipment through the link below on Rosedale’s website using TORLYS BOL <b>' + varBOL + '</b><br><br>' +
                                     '<a href="https://rosedale.net">https://rosedale.net</a><br><br>' +
                                     'At the time of pick up, at Rosedale depot, please do present:<br><br>' +
                                     '• Copy of the attached TORLYS BOL<br>' +
                                     '• Validate the total number of pieces and labels to make sure you pick up the correct cargo.<br><br>' +
                                     'For any further information, please reach out to customer service team at TORLYS <a href="mailto:customerservice@torlys.com">customerservice@torlys.com</a><br><br>' +
                                     'Regards,<br>' +
                                     'TORLYS Customer Service';

                        EmailMessage.Create(
                            varEmail,
                            StrSubstNo('TORLYS Shipping Notification - BOL %1', varBOL),
                            EmailBody,
                            true); // 'true' so Business Central renders your <br> tags as formatting line breaks

                        AttachmentName := StrSubstNo('%1.pdf', varBOL);

                        EmailMessage.AddAttachment(
                            AttachmentName,
                            'application/pdf',
                            InStr);

                        Email.Send(EmailMessage);
                    end;
                end;
            until ProcessedBOL.Next() = 0;
    end;

    local procedure GetEmailAddress(CustomerNo: Code[20]; ShipToCode: Code[20]): Text
    var
        DocumentLayout: Record "Custom Report Selection";
    begin
        DocumentLayout.Reset();
        DocumentLayout.SetRange("Source No.", CustomerNo);
        DocumentLayout.SetRange("Ship-to Code", ShipToCode);

        if DocumentLayout.FindFirst() then
            if DocumentLayout."Send To Email" <> '' then
                exit(DocumentLayout."Send To Email");

        exit('itsupport@torlys.com');
    end;
}
