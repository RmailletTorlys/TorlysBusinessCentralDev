codeunit 50317 TlyCopyDocumentMgt
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopySalesLineFromSalesDocSalesLine', '', true, true)]
    local procedure OnAfterCopySalesLineFromSalesDocSalesLine(ToSalesHeader: Record "Sales Header"; var ToSalesLine: Record "Sales Line"; var FromSalesLine: Record "Sales Line"; IncludeHeader: Boolean; RecalculateLines: Boolean)
    var
        Item: Record "Item";
        PriceListLine: Record "Price List Line";
    begin
        //TLY-SD - 09/29/2026 - this if for copying Blanket Sales Order to Sales Order via copy document function
        ToSalesLine.Validate("Unit Price", FromSalesLine."Unit Price");
        ToSalesLine.Modify(true);

        //start - this is a copy of the TlyPriceListSalesTriggers, perhaps put in a CU one day for easier access and editing
        if ToSalesLine."Type" <> ToSalesLine.Type::Item then
            exit;

        Item.Reset();
        Item.Get(ToSalesLine."No.");

        PriceListLine.Reset();
        PriceListLine.SetRange("Price List Code", ToSalesLine."Price List");
        PriceListLine.SetRange("Product No.", ToSalesLine."Sales Price Code");
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate());
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate());
        if PriceListLine.Find('-') then begin
            ToSalesLine.Validate("Unit Price", PriceListLine."Unit Price");
            ToSalesLine.Modify(true);
        end;
        //end - this is a copy of the TLYPriceListSalesTriggers, perhaps put in a CU one day for easier access and editing
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnCopySalesInvLinesToDocOnAfterCopySalesDocLine', '', true, true)]
    local procedure OnCopySalesInvLinesToDocOnAfterCopySalesDocLine(ToSalesLine: Record "Sales Line"; FromSalesInvLine: Record "Sales Invoice Line")
    begin
        //TLY-SD - 09/29/2026 - this if for copying Posted Sales Invoice to Sales Order via copy document function
        ToSalesLine.Validate("Price List", FromSalesInvLine."Price List");
        ToSalesLine.Validate("Unit Price", FromSalesInvLine."Unit Price");
        ToSalesLine.Modify(true);
    end;
}