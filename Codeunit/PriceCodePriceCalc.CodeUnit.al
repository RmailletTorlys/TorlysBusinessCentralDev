codeunit 50306 "Price Code Price Calc"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterGetAssetType', '', false, false)]
    local procedure OnAfterGetAssetType(SalesLine: Record "Sales Line"; var AssetType: Enum "Price Asset Type")
    begin
        if SalesLine.Type = SalesLine.Type::"Price Code" then
            AssetType := AssetType::"Price Code";
    end;

}