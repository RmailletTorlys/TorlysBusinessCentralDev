codeunit 50007 PrintPickTicketSOUpdate
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Print", 'OnBeforePrintSalesOrder', '', false, false)]
    local procedure OnBeforePrintSalesOrder(var SalesHeader: Record "Sales Header"; ReportUsage: Integer; var IsPrinted: Boolean)
    begin
        UpdatePickTicketPrinted(SalesHeader);
    end;

    local procedure UpdatePickTicketPrinted(var SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if SalesHeader."No. Pick Lists Printed" > 0 then
                Message('Pick Ticket already printed %1 time(s) for this order.', SalesHeader."No. Pick Lists Printed");

            SalesHeader."No. Pick Lists Printed" := SalesHeader."No. Pick Lists Printed" + 1;
            SalesHeader."Pick Slip Printed By" := COPYSTR(UserId(), 1, 30);
            SalesHeader."Pick Slip Printed Date" := WorkDate();
            SalesHEader."Pick Slip Printed Time" := Time();
            SalesHeader.Modify(true);
        end;
    end;
}