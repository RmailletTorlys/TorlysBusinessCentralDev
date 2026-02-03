codeunit 50039 TlyCopyFieldsPurchase
{
    // Purchase Header --> Purchase Line
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitHeaderDefaults', '', false, false)]
    local procedure OnAfterInitHeaderDefaults(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header"; var TempPurchLine: record "Purchase Line" temporary)
    begin
        PurchLine."Shipment Method Code" := PurchHeader."Shipment Method Code";
    end;
}