
codeunit 57015 TlyPurchasePriceListTriggers
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchase Line - Price", 'OnAfterFillBuffer', '', false, false)]
    local procedure OnAfterFillBuffer(var PriceCalculationBuffer: Record "Price Calculation Buffer"; PurchaseHeader: Record "Purchase Header"; PurchaseLine: Record "Purchase Line")
    begin
        PriceCalculationBuffer."Shipment Method Code" := PurchaseLine."Shipment Method Code";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation Buffer Mgt.", 'OnAfterSetFilters', '', false, false)]
    local procedure OnAfterSetFilters(var PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type"; var PriceCalculationBuffer: Record "Price Calculation Buffer"; ShowAll: Boolean)
    begin
        //     PriceListLine."Shipment Method Code" := PriceCalculationBuffer."Shipment Method Code";
        PriceListLine.SetRange("Shipment Method Code", PriceCalculationBuffer."Shipment Method Code");
    end;
}
