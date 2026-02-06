codeunit 50031 TlyPostPurchase
{
    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterValidatePostingAndDocumentDate', '', false, false)]
    //     local procedure OnAfterValidatePostingAndDocumentDate(var PurchaseHeader: Record "Purchase Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    //     begin
    //         // we want the posting date to be today
    //         PurchaseHeader."Posting Date" := WorkDate();
    //         PurchaseHeader.Validate("Currency Code");
    //         PurchaseHeader.Modify(true);
    //     end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnValidatePostingAndDocumentDateOnAfterCalcPostingDateExists', '', false, false)]
    local procedure OnValidatePostingAndDocumentDateOnAfterCalcPostingDateExists(var PurchHeader: Record "Purchase Header"; var PostingDateExists: Boolean; var ReplacePostingDate: Boolean; var PostingDate: Date; var ReplaceDocumentDate: Boolean; var ModifyHeader: Boolean; var VATDateExists: Boolean; var ReplaceVATDate: Boolean; var VATDate: Date)
    begin
        PostingDateExists := true;
        ReplacePostingDate := true;
        ReplaceDocumentDate := true;
        PostingDate := WorkDate();
    end;
}