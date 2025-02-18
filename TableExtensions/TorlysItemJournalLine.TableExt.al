tableextension 50116 TorlysItemJournalLine extends "Item Journal Line"
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
    }

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;
}