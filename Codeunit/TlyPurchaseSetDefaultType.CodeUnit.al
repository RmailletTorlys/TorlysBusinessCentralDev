codeunit 50128 TlyPurchaseSetDefaultType
{
    [EventSubscriber(ObjectType::Page, Page::"Purchase Order Subform", 'OnBeforeSetDefaultType', '', false, false)]
    local procedure OnBeforeSetDefaultType(var PurchaseLine: Record "Purchase Line"; var xPurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
        IsHandled := true;
        // Purchases & Payables setup sets default type for all purchases documents, here we set for PO manually and other documents use setup option
        if xPurchaseLine."Document No." = '' then
            PurchaseLine.Type := PurchaseLine.Type::Item;
    end;
}