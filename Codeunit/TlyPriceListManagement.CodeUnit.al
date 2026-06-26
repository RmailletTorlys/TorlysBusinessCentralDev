
codeunit 57016 TlyPriceListManagement
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price List Management", 'OnAfterSetHeadersFilters', '', false, false)]
    local procedure OnAfterSetHeadersFilters(PriceListLine: Record "Price List Line"; var DuplicatePriceListLine: Record "Price List Line")
    begin
        // these are the extra checks we want to run when verifying price lists (both sales and purchases)
        DuplicatePriceListLine.SetRange("Shipment Method Code", PriceListLine."Shipment Method Code"); //this is for purchases, never use this field for sales
        DuplicatePriceListLine.SetRange("Ending Date", PriceListLine."Ending Date"); //this is for sales, but doesn't hurt applying to purchases
        // TLY-SD - 05/27/2026 - these 2 lines might now be useless with the changes below, but we will keep
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price List Management", 'OnBeforeResolveDuplicatePrices', '', false, false)]
    local procedure OnBeforeResolveDuplicatePrices(PriceListHeader: Record "Price List Header"; var Resolved: Boolean; var IsHandled: Boolean)
    begin
        //TLY-SD - 05/27/2026 - this appears to skip the validation process of duplicate price lists
        IsHandled := true;

        Resolved := true;
    end;
}