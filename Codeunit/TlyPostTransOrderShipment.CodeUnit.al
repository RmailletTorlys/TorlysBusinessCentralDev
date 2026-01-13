codeunit 50015 TlyPostTransOrderShipment
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnAfterCheckInvtPostingSetup', '', false, false)]
    local procedure OnAfterCheckInvtPostingSetup(var TransferHeader: Record "Transfer Header"; var TempWhseShipmentHeader: Record "Warehouse Shipment Header" temporary; var SourceCode: Code[10])
    begin
        // update posting date to today
        TransferHeader."Posting Date" := WorkDate();
        TransferHeader.Modify(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Header", 'OnAfterCopyFromTransferHeader', '', false, false)]
    local procedure OnAfterCopyFromTransferHeader(var TransferShipmentHeader: Record "Transfer Shipment Header"; TransferHeader: Record "Transfer Header")
    begin
        // new fields to bring over
        TransferShipmentHeader."Transfer Type" := TransferHeader."Transfer Type";
        TransferShipmentHeader."Picked By" := TransferHeader."Picked By";
        TransferShipmentHeader."Audited By" := TransferHeader."Audited By";
        TransferShipmentHeader."Received By" := TransferHeader."Received By";
        // TransferShipmentHeader."Put Away By" := TransferHeader."Put Away By";
        TransferShipmentHeader."BOL No." := TransferHeader."BOL No.";
        TransferShipmentHeader."Package Tracking No." := TransferHeader."Package Tracking No.";
        TransferShipmentHeader."Shipping Comment" := TransferHeader."Shipping Comment";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Line", 'OnAfterCopyFromTransferLine', '', false, false)]
    local procedure OnAfterCopyFromTransferLine(var TransferShipmentLine: Record "Transfer Shipment Line"; TransferLine: Record "Transfer Line")
    begin
        // new fields to bring over
        TransferShipmentLine."Quantity Case" := TransferLine."Qty. to Ship Case";
        TransferShipmentLine."Quantity Pallet" := TransferLine."Qty. to Ship Pallet";
        TransferShipmentLine."Sales Order No." := TransferLine."Sales Order No.";
        TransferShipmentLine."Sales Order Line No." := TransferLine."Sales Order Line No.";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterUpdateWithWarehouseShipReceive', '', false, false)]
    local procedure OnAfterUpdateWithWarehouseShipReceive(var TransferLine: Record "Transfer Line"; CurrentFieldNo: Integer)
    begin
        // we want user to type in the Qty to Receive columns
        TransferLine.Validate(TransferLine."Qty. to Receive", 0);
        TransferLine.Validate(TransferLine."Qty. to Receive Case", 0);
        TransferLine.Validate(TransferLine."Qty. to Receive Pallet", 0);
    end;
}