codeunit 50016 TlyPostTransOrderReceipt
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnBeforeTransferOrderPostReceipt', '', false, false)]
    local procedure OnBeforeTransferOrderPostReceipt(var TransferHeader: Record "Transfer Header"; var CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    begin
        if TransferHeader."Picked By" = '' then
            Error('The Picked By associate cannot be blank!');

        if TransferHeader."Audited By" = '' then
            Error('The Checked By associate cannot be blank!');

        if TransferHeader."Picked By" = TransferHeader."Audited By" THEN
            Error('The Picked By and Checked By associate cannot be the same!');

        if TransferHeader."Received By" = '' then
            Error('The Received By associate cannot be blank!');
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnAfterCheckInvtPostingSetup', '', false, false)]
    local procedure OnAfterCheckInvtPostingSetup(var TransferHeader: Record "Transfer Header"; var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; var SourceCode: Code[10])
    begin
        // update posting date to today
        TransferHeader."Posting Date" := WorkDate();
        TransferHeader.Modify(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Header", 'OnAfterCopyFromTransferHeader', '', false, false)]
    local procedure OnAfterCopyFromTransferHeader(var TransferReceiptHeader: Record "Transfer Receipt Header"; TransferHeader: Record "Transfer Header")
    begin
        // new fields to bring over
        TransferReceiptHeader."Transfer Type" := TransferHeader."Transfer Type";
        TransferReceiptHeader."Picked By" := TransferHeader."Picked By";
        TransferReceiptHeader."Audited By" := TransferHeader."Audited By";
        TransferReceiptHeader."Received By" := TransferHeader."Received By";
        TransferReceiptHeader."BOL No." := TransferHeader."BOL No.";
        TransferReceiptHeader."Package Tracking No." := TransferHeader."Package Tracking No.";
        TransferReceiptHeader."Shipping Comment" := TransferHeader."Shipping Comment";
        TransferReceiptHeader."Booking No." := TransferHeader."Booking No.";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Line", 'OnAfterCopyFromTransferLine', '', false, false)]
    local procedure OnAfterCopyFromTransferLine(var TransferReceiptLine: Record "Transfer Receipt Line"; TransferLine: Record "Transfer Line")
    begin
        // new fields to bring over
        TransferReceiptLine."Quantity Case" := TransferLine."Qty. to Receive Case";
        TransferReceiptLine."Quantity Pallet" := TransferLine."Qty. to Receive Pallet";
        TransferReceiptLine."Sales Order No." := TransferLine."Sales Order No.";
        TransferReceiptLine."Sales Order Line No." := TransferLine."Sales Order Line No.";
    end;
}