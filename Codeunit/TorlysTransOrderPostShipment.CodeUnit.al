codeunit 50015 TorlysTransOrderPostShipment
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Header", 'OnAfterCopyFromTransferHeader', '', false, false)]
    local procedure OnAfterCopyFromTransferHeader(var TransferShipmentHeader: Record "Transfer Shipment Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferShipmentHeader."Transfer Type" := TransferHeader."Transfer Type";
        TransferShipmentHeader."Picked By" := TransferHeader."Picked By";
        TransferShipmentHeader."Audited By" := TransferHeader."Audited By";
        TransferShipmentHeader."Received By" := TransferHeader."Received By";
        TransferShipmentHeader."Put Away By" := TransferHeader."Put Away By";
        TransferShipmentHeader."BOL No." := TransferHeader."BOL No.";
        TransferShipmentHeader."Package Tracking No." := TransferHeader."Package Tracking No.";
        TransferShipmentHeader."Shipping Comment" := TransferHeader."Shipping Comment";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Line", 'OnAfterCopyFromTransferLine', '', false, false)]
    local procedure OnAfterCopyFromTransferLine(var TransferShipmentLine: Record "Transfer Shipment Line"; TransferLine: Record "Transfer Line")
    begin
        TransferShipmentLine."Quantity Case" := TransferLine."Qty. to Ship Case";
        TransferShipmentLine."Quantity Pallet" := TransferLine."Qty. to Ship Pallet";
        TransferShipmentLine."Sales Order No." := TransferLine."Sales Order No.";
        TransferShipmentLine."Sales Order Line No." := TransferLine."Sales Order Line No.";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterUpdateWithWarehouseShipReceive', '', false, false)]
    local procedure OnAfterUpdateWithWarehouseShipReceive(var TransferLine: Record "Transfer Line"; CurrentFieldNo: Integer)
    begin
        TransferLine.Validate(TransferLine."Qty. to Receive", 0);
        TransferLine.Validate(TransferLine."Qty. to Receive Case", 0);
        TransferLine.Validate(TransferLine."Qty. to Receive Pallet", 0);
    end;
}