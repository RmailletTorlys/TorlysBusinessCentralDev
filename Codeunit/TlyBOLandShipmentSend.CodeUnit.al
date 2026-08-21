codeunit 50035 TlyBOLandShipmentBatchSend
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        DocumentLayout: Record "Custom Report Selection";
        ProcessedBOL: Record TlyProcessedBillOfLadingHeader;
        TempProcessedBOL: Record TlyProcessedBillOfLadingHeader;
        BOLLine: Record "TlyProcessedBillOfLadingLine";
        SalesShipmentHeader: Record "Sales Shipment Header"; // Used to filter shipments for Report 50018
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        TempBlob: Codeunit "Temp Blob";
        TempBlobReport50018: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        OutStr50018: OutStream;
        InStr50018: InStream;
        AttachmentName: Text;
        AttachmentName50018: Text;
        EmailBody: Text;
        ShipmentFilterText: Text;
        TableRowsText: Text;
        PickupDateText: Text;
    begin
        // Scans Document Layout table
        DocumentLayout.Reset();
        DocumentLayout.SetRange("Report ID", 50009);
        DocumentLayout.SetFilter("Send To Email", '<>%1', '');

        if DocumentLayout.FindSet() then
            repeat
                // Look for processed BOLs matching strictly by customer and ship-to code
                ProcessedBOL.Reset();
                ProcessedBOL.SetRange("Customer No.", DocumentLayout."Source No.");
                ProcessedBOL.SetRange("Ship-to Code", DocumentLayout."Ship-to Code");

                // ProcessedBOL.SetRange(SystemCreatedAt, CreateDateTime(WorkDate(), 0T), CurrentDateTime());

                // Filter for yesterday's records
                ProcessedBOL.SetRange(
                    SystemCreatedAt,
                    CreateDateTime(CalcDate('<-1D>', WorkDate()), 0T),
                    CreateDateTime(WorkDate(), 0T));

                // Loop found BOLs and email them to the document layout specific email list
                if ProcessedBOL.FindSet() then
                    repeat
                        ShipmentFilterText := '';
                        TableRowsText := '';

                        BOLLine.Reset();
                        BOLLine.SetRange("BOL No.", ProcessedBOL."No.");
                        BOLLine.SetFilter("Shipment No.", '<>%1', '');
                        if BOLLine.FindSet() then
                            repeat
                                // Avoid duplicate entries if multiple lines feature the same shipment number
                                if (ShipmentFilterText = '') or (not ShipmentFilterText.Contains(BOLLine."Shipment No.")) then begin
                                    // Build Pipe Filter for the Report
                                    if ShipmentFilterText = '' then
                                        ShipmentFilterText := BOLLine."Shipment No."
                                    else
                                        ShipmentFilterText += '|' + BOLLine."Shipment No.";

                                    if SalesShipmentHeader.Get(BOLLine."Shipment No.") then
                                        TableRowsText += '<tr>' +
                                                         '<td style="border: 1px solid #dddddd; padding: 8px;">' + SalesShipmentHeader."No." + '</td>' +
                                                         '<td style="border: 1px solid #dddddd; padding: 8px;">' + SalesShipmentHeader."Order No." + '</td>' +
                                                         '<td style="border: 1px solid #dddddd; padding: 8px;">' + SalesShipmentHeader."External Document No." + '</td>' +
                                                         '</tr>';
                                end;
                            until BOLLine.Next() = 0;

                        // dataset specifically for this individual BOL record in Report 50009
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

                        // piped filter for report 50018
                        Clear(TempBlobReport50018);
                        if ShipmentFilterText <> '' then begin
                            SalesShipmentHeader.Reset();
                            SalesShipmentHeader.SetFilter("No.", ShipmentFilterText);

                            TempBlobReport50018.CreateOutStream(OutStr50018);
                            Report.SaveAs(
                                50018,
                                '',
                                ReportFormat::Pdf,
                                OutStr50018,
                                SalesShipmentHeader);
                            TempBlobReport50018.CreateInStream(InStr50018);
                        end;

                        Clear(EmailMessage);

                        if ProcessedBOL."Pickup Date" <> 0D then
                            PickupDateText := Format(ProcessedBOL."Pickup Date", 0, '<Month Text> <Day>, <Year4>')
                        else
                            PickupDateText := 'recently';

                        EmailBody := 'Shipping Notification<br>' +
                                     '(This is not a pick-up notification)<br><br>' +
                                     'Dear Valued Customer,<br><br>' +
                                     'Please be advised that your cargo was shipped from our Warehouse on <b>' + PickupDateText + '</b>.<br><br>' +
                                     'Please find attached BOL for your ready reference:<br><br>' +
                                     '• TORLYS’ BOL no. indicated in Box no 4: Consignor’s no <b>' + ProcessedBOL."No." + '</b>,<br><br>';

                        if TableRowsText <> '' then begin
                            EmailBody += '<b>Associated Shipment Details:</b><br>' +
                                         '<table style="font-family: Arial, sans-serif; border-collapse: collapse; width: 100%; margin-top: 8px; margin-bottom: 16px;">' +
                                         '  <tr style="background-color: #f2f2f2;">' +
                                         '    <th style="border: 1px solid #dddddd; text-align: left; padding: 8px;">Shipment No.</th>' +
                                         '    <th style="border: 1px solid #dddddd; text-align: left; padding: 8px;">Order No.</th>' +
                                         '    <th style="border: 1px solid #dddddd; text-align: left; padding: 8px;">External Document No.</th>' +
                                         '  </tr>' +
                                         TableRowsText +
                                         '</table><br>';
                        end;

                        EmailBody += 'At the time of pick up, please do present:<br><br>' +
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

                        // Attach Report 50009
                        AttachmentName := StrSubstNo('%1.pdf', ProcessedBOL."No.");
                        EmailMessage.AddAttachment(
                            AttachmentName,
                            'application/pdf',
                            InStr);

                        // Attach Report 50018 if shipments exist
                        if ShipmentFilterText <> '' then begin
                            AttachmentName50018 := StrSubstNo('Shipment_Report_%1.pdf', ProcessedBOL."No.");
                            EmailMessage.AddAttachment(
                                AttachmentName50018,
                                'application/pdf',
                                InStr50018);
                        end;

                        Email.Send(EmailMessage);
                    until ProcessedBOL.Next() = 0;
            until DocumentLayout.Next() = 0;
    end;
}
