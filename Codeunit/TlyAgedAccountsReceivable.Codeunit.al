codeunit 50141 "TlyAgedAccountsReceivables"
{
    TableNo = "Job Queue Entry";

    var
        ReportId: Integer;
        LayoutName: Text;
        DateFieldName: Text;
        DefaultRecipient: Text;

    trigger OnRun()
    var
        Recipient: Text;
    begin
        InitSettings();
        Recipient := Rec."Parameter String";
        if Recipient = '' then
            Recipient := DefaultRecipient;
        RunAndEmail(Recipient);
    end;

    local procedure InitSettings()
    begin
        ReportId := 10040;
        LayoutName := 'Aged Accounts Receivable Jeff';
        DateFieldName := 'AgedAsOf';
        DefaultRecipient := 'Jeff.Conley@torlys.com';
    end;

    local procedure RunAndEmail(Recipient: Text)
    var
        TempBlob: Codeunit "Temp Blob";
        DesignTimeReportSelection: Codeunit "Design-time Report Selection";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        OutStr: OutStream;
        InStr: InStream;
        AsOfDate: Date;
        Params: Text;
    begin
        // Last Friday: -CW = Monday of this week, -3D = previous Friday
        AsOfDate := CalcDate('<-CW-3D>', Today());

        Params :=
            '<?xml version="1.0" standalone="yes"?>' +
            '<ReportParameters id="' + Format(ReportId) + '">' +
            '<Options>' +
            '<Field name="' + DateFieldName + '">' + Format(AsOfDate, 0, 9) + '</Field>' +
            '</Options>' +
            '</ReportParameters>';

        DesignTimeReportSelection.SetSelectedLayout(LayoutName);

        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(ReportId, Params, ReportFormat::Pdf, OutStr);
        TempBlob.CreateInStream(InStr);

        EmailMessage.Create(Recipient,
            StrSubstNo('Report %1 as of %2', ReportId, AsOfDate),
            StrSubstNo('Please find attached the report as of %1.', AsOfDate), false);
        EmailMessage.AddAttachment(
            StrSubstNo('Report_%1_%2.pdf', ReportId, Format(AsOfDate, 0, '<Year4>-<Month,2>-<Day,2>')),
            'application/pdf', InStr);
        SendFromSharedMailbox(EmailMessage);
    end;

    local procedure SendFromSharedMailbox(var EmailMessage: Codeunit "Email Message")
    var
        TempEmailAccount: Record "Email Account" temporary;
        EmailAccount: Codeunit "Email Account";
        Email: Codeunit Email;
        SharedMailbox: Text;
    begin
        SharedMailbox := 'No-reply@torlys.com';

        EmailAccount.GetAllAccounts(false, TempEmailAccount);
        TempEmailAccount.SetRange("Email Address", SharedMailbox);
        if not TempEmailAccount.FindFirst() then
            Error('Email account %1 is not set up in Email Accounts.', SharedMailbox);

        Email.Send(EmailMessage, TempEmailAccount."Account Id", TempEmailAccount.Connector);
    end;
}
