namespace Microsoft.Pricing.Asset;

using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Pricing.Calculation;
using Microsoft.Pricing.PriceList;

codeunit 50303 "Price Asset - Price Code" implements "Price Asset"

{
    var
        ItemCategory: Record "Item Category";
        Item: Record "Item";

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
        xPriceAsset := PriceAsset;
        if ItemCategory.Get(xPriceAsset."Asset No.") then;
        // Message('%1', 'I am getting here');
        if Page.RunModal(Page::"Item Price Category Lookup", ItemCategory) = ACTION::LookupOK then begin
            xPriceAsset.Validate("Asset No.", ItemCategory."Code");
            PriceAsset := xPriceAsset;
            exit(true);
        end;
    end;

    procedure IsLookupUnitOfMeasureOK(var PriceAsset: Record "Price Asset"): Boolean
    begin
        exit(false)
    end;

    procedure IsLookupVariantOK(var PriceAsset: Record "Price Asset"): Boolean
    begin
        exit(false)
    end;

    procedure ValidateUnitOfMeasure(var PriceAsset: Record "Price Asset"): Boolean
    begin
        exit(true);
    end;

    procedure IsAssetNoRequired(): Boolean;
    begin
        exit(true)
    end;

    procedure FillBestLine(PriceCalculationBuffer: Record "Price Calculation Buffer"; AmountType: Enum "Price Amount Type"; var PriceListLine: Record "Price List Line")
    begin
        ItemCategory.Get(PriceCalculationBuffer."Asset No.");
        PriceListLine."Unit of Measure Code" := '';
        PriceListLine."Currency Code" := '';
        if AmountType <> AmountType::Discount then
            case PriceCalculationBuffer."Price Type" of
                PriceCalculationBuffer."Price Type"::Sale:
                    begin

                        PriceListLine."Price Includes VAT" := false;
                        PriceListLine."Unit Price" := 1.00;
                    end;
                PriceCalculationBuffer."Price Type"::Purchase:
                    PriceListLine."Price Includes VAT" := false;
            end;

    end;

    procedure FilterPriceLines(PriceAsset: Record "Price Asset"; var PriceListLine: Record "Price List Line") Result: Boolean;
    begin
        PriceListLine.SetRange("Asset Type", PriceAsset."Asset Type");
        PriceListLine.SetRange("Asset No.", PriceAsset."Asset No.");
        // Message('Filtered Price List Line: %1', PriceListLine);
    end;

    procedure PutRelatedAssetsToList(PriceAsset: Record "Price Asset"; var PriceAssetList: Codeunit "Price Asset List")
    var
        NewPriceAsset: Record "Price Asset";
    begin
        if PriceAsset."Asset No." = '' then
            exit;

        ItemCategory.Get(PriceAsset."Asset No.");
        if Item."Item Disc. Group" <> '' then begin
            PriceAssetList.SetLevel(PriceAsset.Level);
            PriceAssetList.Add(PriceAsset."Asset Type"::"Item Discount Group", Item."Item Disc. Group");
        end;
        PriceAssetList.SetLevel(PriceAsset.Level - 1);
        NewPriceAsset := PriceAsset;
        NewPriceAsset.Validate("Asset No.", ''); // All Items
        PriceAssetList.Add(NewPriceAsset);


    end;

    procedure FillFromBuffer(var PriceAsset: Record "Price Asset"; PriceCalculationBuffer: Record "Price Calculation Buffer")
    begin
        PriceAsset.NewEntry(PriceCalculationBuffer."Asset Type", PriceAsset.Level);
        PriceAsset.Validate("Asset No.", PriceCalculationBuffer."Asset No.");
    end;

    local procedure FillAdditionalFields(var PriceAsset: Record "Price Asset")
    begin
        PriceAsset.Description := ItemCategory.Description;
        PriceAsset."Unit of Measure Code" := '';
        PriceAsset."Variant Code" := '';
    end;
}