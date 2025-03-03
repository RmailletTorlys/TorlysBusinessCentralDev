namespace Microsoft.Pricing.Asset;

using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Pricing.Calculation;
using Microsoft.Pricing.PriceList;

codeunit 50303 "Price Asset - Item Category" implements "Price Asset"

{
    var
        ItemCategory: Record "Item Category";

    procedure GetNo(var PriceAsset: Record "Price Asset")
    begin
        PriceAsset."Table Id" := Database::"Item Category";
        if ItemCategory.GetBySystemId(PriceAsset."Asset ID") then begin
            PriceAsset."Asset No." := ItemCategory."Code";
            FillAdditionalFields(PriceAsset);
        end else
            PriceAsset.InitAsset();
    end;

    procedure GetId(var PriceAsset: Record "Price Asset")
    begin
        PriceAsset."Table Id" := Database::"Item Category";
        if ItemCategory.Get(PriceAsset."Asset No.") then begin
            PriceAsset."Asset ID" := ItemCategory.SystemId;
            FillAdditionalFields(PriceAsset);
        end else
            PriceAsset.InitAsset();
    end;

    procedure IsLookupOK(var PriceAsset: Record "Price Asset"): Boolean
    var
        xPriceAsset: Record "Price Asset";
    begin
        Message('%1', 'I am getting here');
        if Page.RunModal(Page::"Item Categories", ItemCategory) = ACTION::LookupOK then begin
            xPriceAsset.Validate("Asset No.", ItemCategory."Code");
            PriceAsset := xPriceAsset;
            exit(true);
        end;
    end;

    procedure IsLookupUnitOfMeasureOK(var PriceAsset: Record "Price Asset"): Boolean
    begin
    end;

    procedure IsLookupVariantOK(var PriceAsset: Record "Price Asset"): Boolean
    begin
        exit(false)
    end;

    procedure ValidateUnitOfMeasure(var PriceAsset: Record "Price Asset"): Boolean
    begin
    end;

    procedure IsAssetNoRequired(): Boolean;
    begin
        exit(true)
    end;

    procedure FillBestLine(PriceCalculationBuffer: Record "Price Calculation Buffer"; AmountType: Enum "Price Amount Type"; var PriceListLine: Record "Price List Line")
    begin
    end;

    procedure FilterPriceLines(PriceAsset: Record "Price Asset"; var PriceListLine: Record "Price List Line") Result: Boolean;
    begin
        PriceListLine.SetRange("Asset Type", PriceAsset."Asset Type");
        PriceListLine.SetRange("Asset No.", '');
    end;

    procedure PutRelatedAssetsToList(PriceAsset: Record "Price Asset"; var PriceAssetList: Codeunit "Price Asset List")
    begin
    end;

    procedure FillFromBuffer(var PriceAsset: Record "Price Asset"; PriceCalculationBuffer: Record "Price Calculation Buffer")
    begin
        PriceAsset.NewEntry(PriceCalculationBuffer."Asset Type", PriceAsset.Level);
    end;

    local procedure FillAdditionalFields(var PriceAsset: Record "Price Asset")
    begin
        PriceAsset.Description := ItemCategory.Description;
        PriceAsset."Unit of Measure Code" := '';
        PriceAsset."Variant Code" := '';
    end;
}