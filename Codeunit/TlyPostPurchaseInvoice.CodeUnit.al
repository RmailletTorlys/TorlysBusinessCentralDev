codeunit 50131 TlyPostPurchaseInvoice
{
    [EventSubscriber(ObjectType::Table, Database::"Purch. Inv. Line", 'OnAfterInitFromPurchLine', '', false, false)]
    local procedure OnAfterInitFromPurchLine(PurchInvHeader: Record "Purch. Inv. Header"; PurchLine: Record "Purchase Line"; var PurchInvLine: Record "Purch. Inv. Line")
    begin
        // new fields to bring over
        PurchLine.CalcFields(PurchLine."Container No.");
        PurchInvLine."Container No." := PurchLine."Container No.";
    end;
}