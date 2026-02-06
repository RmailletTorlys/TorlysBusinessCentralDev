codeunit 50158 TlyPostPurchaseReceipt
{
    [EventSubscriber(ObjectType::Table, Database::"Purch. Rcpt. Line", 'OnAfterInitFromPurchLine', '', false, false)]
    local procedure OnAfterInitFromPurchLine(PurchRcptHeader: Record "Purch. Rcpt. Header"; PurchLine: Record "Purchase Line"; var PurchRcptLine: Record "Purch. Rcpt. Line")
    begin
        // new fields to bring over
        PurchLine.CalcFields(PurchLine."Container No.");
        PurchRcptLine."Container No. (TPS)" := PurchLine."Container No.";
    end;
}