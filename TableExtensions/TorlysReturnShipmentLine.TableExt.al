tableextension 50111 TorlysReturnShipmentLine extends "Return Shipment Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Case Quantity';
            DataClassification = ToBeClassified;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Pallet Quantity';
            DataClassification = ToBeClassified;
        }
    }

}