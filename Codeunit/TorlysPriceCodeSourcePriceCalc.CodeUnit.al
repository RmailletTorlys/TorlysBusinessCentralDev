codeunit 57003 "TorlysPriceCodeSourcePriceCalc"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnValidateLocationCodeOnAfterSetOutboundWhseHandlingTime', '', false, false)]
    local procedure OnValidateLocationCodeOnAfterSetOutboundWhseHandlingTime(var SalesLine: Record "Sales Line")
    begin
        UpdateUnitPriceByLocationCode(SalesLine);
    end;

    local procedure UpdateUnitPriceByLocationCode(var SalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        PriceCalculation: Interface "Price Calculation";
    begin
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        SalesLine.TestField("Qty. per Unit of Measure");

        SalesLine.GetPriceCalculationHandler("Price Type"::Sale, SalesHeader, PriceCalculation);
        if not (SalesLine."Copied From Posted Doc." and SalesLine.IsCreditDocType()) then begin
            PriceCalculation.ApplyDiscount();
            SalesLine.ApplyPrice(SalesLine.FieldNo("Sales Price Code"), PriceCalculation);
        end;
        SalesLine.Validate("Unit Price");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterAddSources', '', false, false)]
    local procedure OnAfterAddSources(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line";
                                        PriceType: Enum "Price Type"; var PriceSourceList: Codeunit "Price Source List");
    begin
        PriceSourceList.Add("Price Source Type"::"Sales Price Code", SalesLine."Sales Price Code");
    end;
}