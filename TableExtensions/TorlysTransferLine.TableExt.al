tableextension 55741 TorlysTransferLine extends "Transfer Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Case Quantity';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Pallet Quantity';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Case Quantity to Ship';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Ship';
            DataClassification = CustomerContent;
        }

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
        }
    }

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;
}