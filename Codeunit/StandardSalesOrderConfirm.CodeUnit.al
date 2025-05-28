codeunit 51035 "Standard Sales Order Confirm"
{

    [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Order Conf.", "OnLineOnAfterGetRecordOnBeforeCalcTotals", '', false, false)]
    local procedure OnlineOnAfterGetRecordOnBeforeCalcTotals(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var VATAmountLine: Record "VAT Amount Line")
    var
        TotalWeight: Decimal;

    begin

    end;




}