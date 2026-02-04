codeunit 50030 TlyPostSales
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterValidatePostingAndDocumentDate', '', false, false)]
    local procedure OnAfterValidatePostingAndDocumentDate(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; ReplacePostingDate: Boolean; ReplaceDocumentDate: Boolean)
    begin
        // we want the posting date to be today
        SalesHeader."Posting Date" := WorkDate();
        SalesHeader.SynchronizeAsmHeader();
        SalesHeader.Validate("Currency Code");
        SalesHeader."Document Date" := SalesHeader."Posting Date"; // needed to calc due date and other
        SalesHeader.Modify(true);
    end;
}