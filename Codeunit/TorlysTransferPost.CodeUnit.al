// codeunit 50031 TorlysTransferPost
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post (Yes/No)", 'OnGetPostingOptionsOnAfterSelection', '', false, false)]

//     local procedure OnGetPostingOptionsOnAfterSelection(TransferHeader: Record "Transfer Header"; DefaultNumber: Integer; var Selection: Option; var PostShipment: Boolean; var PostReceipt: Boolean; var PostTransfer: Boolean; var IsHandled: Boolean);
//     begin
//         IsHandled := true;
//         PostShipment := Selection = Selection::Shipment;
//         PostReceipt := Selection = Selection::Receipt;
//     end;
// }