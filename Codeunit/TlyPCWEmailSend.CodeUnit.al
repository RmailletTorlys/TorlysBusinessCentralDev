codeunit 50032 "SendShippingReport"
{
    trigger OnRun()
    begin
        SendReportEmail();
    end;

    local procedure SendReportEmail()
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit "Email";
        TempBlob: Codeunit "Temp Blob";
        OStream: OutStream;
        IStream: InStream;
        RecRef: RecordRef;
        SalesShipmentHeader: Record "Sales Shipment Header";
        EmailList: List of [Text];
        FileName: Text;
        Yesterday: Date;
    begin
        // Calculate date T-1
        // Yesterday := 20260602D;
        Yesterday := CalcDate('<-1D>', WorkDate());

        // Filter Setup for Sales Shipment Header
        SalesShipmentHeader.SetFilter("Shipping Agent Code", 'PCW*');
        SalesShipmentHeader.SetRange("Shipment Date", Yesterday);
        RecRef.GetTable(SalesShipmentHeader);

        TempBlob.CreateOutStream(OStream);
        if not Report.SaveAs(50018, '', ReportFormat::Pdf, OStream, RecRef) then
            Error('Could not generate report 50018.');
        TempBlob.CreateInStream(IStream);

        EmailList.Add('amanda@pcwcanada.com; dawn@pcwcanada.com'); // Replace with your target email
        FileName := 'TORLYS PCW Shipping_Report_' + Format(Yesterday, 0, '<Year4><Month,2><Day,2>') + '.pdf';

        EmailMessage.Create(
            EmailList,
            'TORLYS PCW Shipping Report - ' + Format(Yesterday, 0, '<Month Text> <Day>, <Year4>'),
            'Please find attached the shipping report for yesterday. For any issues please reach out to calgarywarehouse@torlys.com.',
            true
        );

        EmailMessage.AddAttachment(FileName, 'application/pdf', IStream);

        // Updated sender address here
        SendFromSpecificAccount(Email, EmailMessage, 'no-reply@torlys.com');
    end;

    local procedure SendFromSpecificAccount(var Email: Codeunit "Email"; var EmailMessage: Codeunit "Email Message"; FromAddress: Text)
    var
        EmailAccount: Record "Email Account";
    begin
        EmailAccount.SetRange("Email Address", FromAddress);
        if EmailAccount.FindFirst() then
            Email.Send(EmailMessage, EmailAccount."Account Id", EmailAccount.Connector)
        else
            // Fallback to default account if specific address is not configured
            Email.Send(EmailMessage);
    end;
}
