codeunit 50016 TorlysTransOrderPostReceipt
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Header", 'OnAfterCopyFromTransferHeader', '', false, false)]
    local procedure OnAfterCopyFromTransferHeader(var TransferReceiptHeader: Record "Transfer Receipt Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferReceiptHeader."Transfer Type" := TransferHeader."Transfer Type";
        TransferReceiptHeader."Picked By" := TransferHeader."Picked By";
        TransferReceiptHeader."Audited By" := TransferHeader."Audited By";
        TransferReceiptHeader."Received By" := TransferHeader."Received By";
        TransferReceiptHeader."Put Away By" := TransferHeader."Put Away By";
        TransferReceiptHeader."BOL No." := TransferHeader."BOL No.";
        TransferReceiptHeader."Package Tracking No." := TransferHeader."Package Tracking No.";
        TransferReceiptHeader."Shipping Comment" := TransferHeader."Shipping Comment";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Line", 'OnAfterCopyFromTransferLine', '', false, false)]
    local procedure OnAfterCopyFromTransferLine(var TransferReceiptLine: Record "Transfer Receipt Line"; TransferLine: Record "Transfer Line")
    begin
        TransferReceiptLine."Quantity Case" := TransferLine."Qty. to Receive Case";
        TransferReceiptLine."Quantity Pallet" := TransferLine."Qty. to Receive Pallet";
        TransferReceiptLine."Sales Order No." := TransferLine."Sales Order No.";
        TransferReceiptLine."Sales Order Line No." := TransferLine."Sales Order Line No.";
    end;
}