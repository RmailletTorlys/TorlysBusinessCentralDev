codeunit 50310 "SL Price List Triggers"
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;


    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterNoOnAfterValidate', '', true, true)]
    local procedure OnAfterNoOnAfterValidate(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    begin
        UpdateUnitPrice(SalesLine);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnUpdateUnitPriceOnBeforeFindPrice', '', true, true)]
    local procedure OnUpdateUnitPriceOnBeforeFindPrice(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; CalledByFieldNo: Integer; CallingFieldNo: Integer; var IsHandled: Boolean; xSalesLine: Record "Sales Line")
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterSetPrice', '', true, true)]
    local procedure OnAfterSetPrice(var SalesLine: Record "Sales Line"; PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type"; var SalesHeader: Record "Sales Header")
    begin
        SalesLine."Price List" := PriceListLine."Price List Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterGetLineWithPrice', '', true, true)]
    local procedure OnAfterGetLineWithPrice(var LineWithPrice: Interface "Line With Price")
    var
        TorlysLineWithPrice: Codeunit "Torlys Sales Line - Price";
    begin
        LineWithPrice := TorlysLineWithPrice;
    end;

    local procedure UpdateUnitPrice(var SalesLine: Record "Sales Line")
    var
        Customer: Record "Customer";
        Item: Record "Item";
        PriceListLine: Record "Price List Line";

    begin
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