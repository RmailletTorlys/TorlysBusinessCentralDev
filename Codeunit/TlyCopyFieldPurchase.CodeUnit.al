codeunit 50039 TlyCopyFieldsPurchase
{
    // Purchase Header --> Purchase Line
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitHeaderDefaults', '', false, false)]
    local procedure OnAfterInitHeaderDefaults(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header"; var TempPurchLine: record "Purchase Line" temporary)
    begin
        PurchLine."Shipment Method Code" := PurchHeader."Shipment Method Code";
    end;

    // creating Purchase Invoice from "GetReceipts"
    [EventSubscriber(ObjectType::Table, Database::"Purch. Rcpt. Line", 'OnAfterCopyFromPurchRcptLine', '', false, false)]
    local procedure OnAfterCopyFromPurchRcptLine(var PurchaseLine: Record "Purchase Line"; PurchRcptLine: Record "Purch. Rcpt. Line"; var TempPurchLine: Record "Purchase Line")
    begin
        // new fields to bring over
        PurchaseLine."Container No. (TPS)" := PurchRcptLine."Container No. (TPS)";
    end;
}