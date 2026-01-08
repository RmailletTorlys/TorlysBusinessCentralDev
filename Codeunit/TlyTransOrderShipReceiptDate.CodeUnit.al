codeunit 50037 TlyTransOrderShipReceiptDate
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Route", 'OnBeforeCalcReceiptDate', '', false, false)]
    local procedure OnBeforeCalcReceiptDate(var TransferRoute: Record "Transfer Route"; TransferFromCode: Code[10]; TransferToCode: Code[10]; var IsHandled: Boolean)
    begin
        IsHandled := true;
        // no code here, just dont want to run built in calcs because we don't use handling time
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Route", 'OnBeforeCalcShipmentDate', '', false, false)]
    local procedure OnBeforeCalcShipmentDate(var TransferRoute: Record "Transfer Route"; var ReceiptDate: Date; var InboundWhseTime: DateFormula; var TransferToCode: Code[10]; var ShippingAgentCode: Code[10]; var ShippingAgentServiceCode: Code[10]; var ShippingTime: DateFormula; var TransferFromCode: Code[10]; var ShipmentDate: Date; var OutboundWhseTime: DateFormula; var IsHandled: Boolean)
    begin
        IsHandled := true;
        // no code here, just dont want to run built in calcs because we don't use handling time
    end;
}