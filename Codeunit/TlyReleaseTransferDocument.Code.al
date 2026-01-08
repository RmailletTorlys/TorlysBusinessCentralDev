codeunit 57009 TlyReleaseTransferDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Transfer Document", 'OnBeforeReleaseTransferDoc', '', false, false)]
    local procedure OnBeforeReleaseTransferDoc(var TransferHeader: Record "Transfer Header")
    begin
        TransferHeader.TestField("Transfer Type");
        TransferHeader.TestField("Shortcut Dimension 1 Code");
        TransferHeader.TestField("Shortcut Dimension 2 Code");
        TransferHeader.TestField("Shipment Date");
        TransferHeader.TestField("Receipt Date");
    end;

}