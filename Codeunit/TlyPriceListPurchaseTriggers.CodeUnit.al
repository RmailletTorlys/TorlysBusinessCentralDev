
codeunit 57015 TlyPriceListPurchaseTriggers
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchase Line - Price", 'OnAfterFillBuffer', '', false, false)]
    local procedure OnAfterFillBuffer(var PriceCalculationBuffer: Record "Price Calculation Buffer"; PurchaseHeader: Record "Purchase Header"; PurchaseLine: Record "Purchase Line")
    begin
        // this is for when adding a line to a PO, we want this extra check
        PriceCalculationBuffer."Shipment Method Code" := PurchaseLine."Shipment Method Code";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation Buffer Mgt.", 'OnAfterSetFilters', '', false, false)]
    local procedure OnAfterSetFilters(var PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type"; var PriceCalculationBuffer: Record "Price Calculation Buffer"; ShowAll: Boolean)
    begin
        // this is for when adding a line to a PO, we want this extra check
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
        // these are the extra checks we want to run when verifying price lists (both sales and purchases)
        DuplicatePriceListLine.SetRange("Shipment Method Code", PriceListLine."Shipment Method Code"); //this is for purchases, never use this field for sales
        DuplicatePriceListLine.SetRange("Ending Date", PriceListLine."Ending Date"); //this is for sales, but doesn't hurt applying to purchases
    end;
}
