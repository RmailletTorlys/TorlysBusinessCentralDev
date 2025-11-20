codeunit 50015 TorlysTransOrderPostShipment
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterUpdateWithWarehouseShipReceive', '', false, false)]
    local procedure OnAfterUpdateWithWarehouseShipReceive(var TransferLine: Record "Transfer Line"; CurrentFieldNo: Integer)
    begin
        TransferLine.Validate(TransferLine."Qty. to Receive", 0);
        TransferLine.Validate(TransferLine."Qty. to Receive Case", 0);
        TransferLine.Validate(TransferLine."Qty. to Receive Pallet", 0);
    end;

}