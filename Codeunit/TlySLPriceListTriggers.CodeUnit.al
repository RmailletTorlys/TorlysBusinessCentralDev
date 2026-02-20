codeunit 57000 TlySLPriceListTriggers
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterNoOnAfterValidate', '', true, true)]
    local procedure OnAfterNoOnAfterValidate(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
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
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterGetLineWithPrice', '', true, true)]
    local procedure OnAfterGetLineWithPrice(var LineWithPrice: Interface "Line With Price")
    var
        TorlysLineWithPrice: Codeunit TlySalesLinePrice;
    begin
        LineWithPrice := TorlysLineWithPrice;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation Buffer Mgt.", 'OnAfterGetAssets', '', true, true)]
    local procedure OnAfterGetAssets(PriceCalculationBuffer: Record "Price Calculation Buffer"; var NewPriceAssetList: Codeunit "Price Asset List");
    var
        Item: Record "Item";
        AssetType: Enum "Price Asset Type";

    begin
        if not (PriceCalculationBuffer."Asset Type" <> Enum::"Price Asset Type"::Item) then begin
            Item.Reset();
            Item.Get(PriceCalculationBuffer."Asset No.");
            NewPriceAssetList.Add(AssetType::"Sales Price Code", Item."Sales Price Code");
        end;
    end;

    //local
    procedure UpdateUnitPrice(var SalesLine: Record "Sales Line")
    var
        Customer: Record "Customer";
        Item: Record "Item";
        PriceListLine: Record "Price List Line";

    begin
        if SalesLine."Type" <> SalesLine.Type::Item then
            exit;
        Customer.Reset();
        Customer.Get(SalesLine."Sell-to Customer No.");
        Item.Reset();
        Item.Get(SalesLine."No.");

        SalesLine."Sales Price Code" := Item."Sales Price Code";
        SalesLine."Default Price List" := Customer."Default Price List Code";
        SalesLine."Price List" := Customer."Default Price List Code";
        SalesLine."Unit Price" := 0;

        Commit();

        PriceListLine.Reset();
        PriceListLine.SetRange("Price List Code", SalesLine."Price List");
        PriceListLine.SetRange("Product No.", SalesLine."No.");

        if (PriceListLine.FindFirst())
        then begin

            SalesLine."Unit Price" := PriceListLine."Unit Price";
            Commit();
            exit;
        end;

        PriceListLine.SetRange("Product No.", SalesLine."Sales Price Code");

        if (PriceListLine.FindFirst())
        then begin

            SalesLine."Unit Price" := PriceListLine."Unit Price";
            Commit();
            exit;
        end;

        SalesLine."Unit Price" := Item."Unit Price";
        Commit();
    end;
}