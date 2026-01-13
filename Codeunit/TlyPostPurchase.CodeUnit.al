codeunit 50031 TlyPostPurchase
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterValidatePostingAndDocumentDate', '', false, false)]
    local procedure OnAfterValidatePostingAndDocumentDate(var PurchaseHeader: Record "Purchase Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    begin
        // we want the posting date to be today
        PurchaseHeader."Posting Date" := WorkDate();
        PurchaseHeader.Validate("Currency Code");
        PurchaseHeader.Modify(true);
    end;
}