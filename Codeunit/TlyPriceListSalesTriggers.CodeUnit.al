codeunit 57000 TlyPriceListSalesTriggers
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    // // this is validating price on the sales order page
    // // TLY-SD - 09/29/2026 - discontinued and changed to validating on table
    // [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterNoOnAfterValidate', '', true, true)]
    // local procedure OnAfterNoOnAfterValidate(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    // begin
    //     UpdateUnitPrice(SalesLine);
    // end;

    // this is validating price on the table
    // pricing on the table uses "UpdateUnitPriceByField" procedure which fires on change of:
    // item #, quantity, customer price group, work type code, variant code, unit of measure code, quantity base, customer discount group
    // TLY-SD - 09/29/2026 - started to use this instead of on page above, seems to only fire when item entered, other triggers above not happening
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnValidateNoOnAfterUpdateUnitPrice', '', true, true)]
    local procedure OnValidateNoOnAfterUpdateUnitPrice(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line" temporary)
    begin
        UpdateUnitPrice(SalesLine);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterGetAssetType', '', false, false)]
    local procedure OnAfterGetAssetType(SalesLine: Record "Sales Line"; var AssetType: Enum "Price Asset Type")
    begin
        if SalesLine.Type = SalesLine.Type::"Sales Price Code" then
            AssetType := AssetType::"Sales Price Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnUpdateUnitPriceOnBeforeFindPrice', '', true, true)]
    local procedure OnUpdateUnitPriceOnBeforeFindPrice(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; CalledByFieldNo: Integer; CallingFieldNo: Integer; var IsHandled: Boolean; xSalesLine: Record "Sales Line")
    begin
        // this is the key piece to run our custom pricing, without this it will do the out of the box "lowest price"
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterGetLineWithPrice', '', true, true)]
    local procedure OnAfterGetLineWithPrice(var LineWithPrice: Interface "Line With Price")
    var
        TorlysLineWithPrice: Codeunit TlyPriceSalesLineWithPrice;
    begin
        LineWithPrice := TorlysLineWithPrice;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation Buffer Mgt.", 'OnAfterGetAssets', '', true, true)]
    local procedure OnAfterGetAssets(PriceCalculationBuffer: Record "Price Calculation Buffer"; var NewPriceAssetList: Codeunit "Price Asset List");
    var
        Item: Record "Item";
        AssetType: Enum "Price Asset Type";
    begin
        // this is what populates the "Get Price" page with the out of the box "item #" and custom "sales price code"
        if not (PriceCalculationBuffer."Asset Type" <> Enum::"Price Asset Type"::Item) then begin
            Item.Reset();
            Item.Get(PriceCalculationBuffer."Asset No.");
            NewPriceAssetList.Add(AssetType::"Sales Price Code", Item."Sales Price Code");
        end;
    end;

    procedure UpdateUnitPrice(var SalesLine: Record "Sales Line")
    var
        Item: Record "Item";
        PriceListLine: Record "Price List Line";
    begin
        if SalesLine."Type" <> SalesLine.Type::Item then
            exit;

        Item.Reset();
        Item.Get(SalesLine."No.");
        // TLY-SD - 10/08/2026 - start
        // added the below 1 line becasue of the repeats added below, need to add this here so can start calculating price from the highest
        SalesLine.Validate("Unit Price", Item."Unit Price");
        // TLY-SD - 10/08/2026 - end

        // check for pricing for this item, if find then use, if dont find move on
        PriceListLine.Reset();
        PriceListLine.SetRange("Price List Code", SalesLine."Price List");
        PriceListLine.SetRange("Product No.", SalesLine."No.");
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/17/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/17/2026 - added
        if PriceListLine.Find('-') then begin
            repeat // TLY-SD - 10/08/2026
                if PriceListLine."Unit Price" < SalesLine."Unit Price" then begin // TLY-SD - 10/08/2026
                    SalesLine.Validate("Unit Price", PriceListLine."Unit Price");
                end; // TLY-SD - 10/08/2026
            until PriceListLine.Next() = 0; // TLY-SD - 10/08/2026
            exit;
        end;

        // check for pricing for this sales price code, if find then use, if dont find move on
        PriceListLine.SetRange("Product No.", SalesLine."Sales Price Code");
        if PriceListLine.Find('-') then begin
            repeat // TLY-SD - 10/08/2026
                if PriceListLine."Unit Price" < SalesLine."Unit Price" then begin // TLY-SD - 10/08/2026
                    SalesLine.Validate("Unit Price", PriceListLine."Unit Price");
                end; // TLY-SD - 10/08/2026
            until PriceListLine.Next() = 0; // TLY-SD - 10/08/2026
            exit;
        end;

        // use unit price from item card
        SalesLine.Validate("Unit Price", Item."Unit Price");
        SalesLine.Validate("Price List", ''); //TLY-SD - 10/07/2026 - since item is not on customers price list and we are pulling list price, blank out the price lists        
        SalesLine.Validate("Default Price List", ''); //TLY-SD - 10/07/2026 - since item is not on customers price list and we are pulling list price, blank out the price lists        
    end;
}