
codeunit 57015 TlyPriceListPurchaseTriggers
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


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchase Line - Price", 'OnAfterIsPriceUpdateNeeded', '', false, false)]
    // local procedure OnAfterIsPriceUpdateNeeded(AmountType: Enum "Price Amount Type"; FoundPrice: Boolean; CalledByFieldNo: Integer; PurchaseLine: Record "Purchase Line"; var Result: Boolean; IsSKU: Boolean)
    // begin
    //     Result := (CalledByFieldNo = PurchaseLine.FieldNo("Shipment Method Code"));
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price List Management", 'OnAfterSetHeadersFilters', '', false, false)]
    local procedure OnAfterSetHeadersFilters(PriceListLine: Record "Price List Line"; var DuplicatePriceListLine: Record "Price List Line")
    begin
        DuplicatePriceListLine.SetRange("Shipment Method Code", PriceListLine."Shipment Method Code");
    end;
}
