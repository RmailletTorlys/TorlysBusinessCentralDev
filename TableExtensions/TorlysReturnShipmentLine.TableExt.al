tableextension 56651 TorlysReturnShipmentLine extends "Return Shipment Line"
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

}