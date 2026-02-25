codeunit 50030 TlyPostSales
{
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterValidatePostingAndDocumentDate', '', false, false)]
    // local procedure OnAfterValidatePostingAndDocumentDate(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; ReplacePostingDate: Boolean; ReplaceDocumentDate: Boolean)
    // begin
    //     // we want the posting date to be today
    //     SalesHeader."Posting Date" := WorkDate();
    //     SalesHeader.SynchronizeAsmHeader();
    //     SalesHeader.Validate("Currency Code");
    //     SalesHeader.Validate("Document Date", WorkDate()); // needed to calc due date and other
    //     SalesHeader.Modify(true);
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnValidatePostingAndDocumentDateOnAfterCalcPostingDateExists', '', false, false)]
    local procedure OnValidatePostingAndDocumentDateOnAfterCalcPostingDateExists(var PostingDateExists: Boolean; var ReplacePostingDate: Boolean; var ReplaceDocumentDate: Boolean; var PostingDate: Date; var SalesHeader: Record "Sales Header"; var ModifyHeader: Boolean; var VATDateExists: Boolean; var ReplaceVATDate: Boolean; var VATDate: Date)
    begin
        PostingDateExists := true;
        ReplacePostingDate := true;
        ReplaceDocumentDate := true;
        PostingDate := WorkDate();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeCheckMandatoryHeaderFields', '', false, false)]

    local procedure OnBeforeCheckMandatoryHeaderFields(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        IsHandled := false;
        if SalesHeader."Temporary Posting Hold" then
            Error(ErrorInfo.Create('Sales order was already posted. Please confirm if this order needs to be reposted.'))
        else
            IsHandled := false;
        SalesHeader."Temporary Posting Hold" := true;
        SalesHeader.Modify(true);
    end;
}