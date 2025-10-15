codeunit 50012 "TorlysInitQtyToReceiveTL"
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterInitQtyToReceive', '', false, false)]
    local procedure OnAfterInitQtyToReceive(var TransferLine: Record "Transfer Line"; CurrentFieldNo: Integer)
    begin
        TransferLine."Qty. to Receive" := TransferLine."Qty. in Transit";
        TransferLine."Qty. to Receive (Base)" := TransferLine."Qty. in Transit (Base)";
    end;
}