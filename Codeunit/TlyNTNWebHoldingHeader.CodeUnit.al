codeunit 50038 TlyNTNWebHoldingHeader
{
    trigger OnRun()
    var
        NTNWebHoldHead: Record "NTN Web Holding Header";
        OrdCount: Integer;
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        NTNWebHoldHead.Reset();
        OrdCount := NTNWebHoldHead.Count;

        if OrdCount > 0 then begin
            EmailMsg.Create('sameer.patel@torlys.com;robert.maillet@torlys.com;sean.dwyer@torlys.com', 'TSS orders stuck (BC)',
                    StrSubstNo('There are currently %1 orders stuck in NTN Web Holding', OrdCount));
            Email.Send(EmailMsg);
        end;
    end;
}