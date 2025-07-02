tableextension 50039 TorlysPurchaseLine extends "Purchase Line"
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

        field(50003; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50005; "Qty. Received Case"; Integer)
        {
            Caption = 'Case Quantity Received';
            DataClassification = CustomerContent;
        }

        field(50006; "Qty. Received Pallet"; Integer)
        {
            Caption = 'Pallet Quantity Received';
            DataClassification = CustomerContent;
        }

    }

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;
}