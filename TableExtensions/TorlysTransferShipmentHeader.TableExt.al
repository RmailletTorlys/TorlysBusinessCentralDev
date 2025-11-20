tableextension 55744 TorlysTransferShipmentHeader extends "Transfer Shipment Header"
{
    fields
    {
        field(50001; "Transfer Type"; Enum TorlysTransferType)
        {
            Caption = 'Transfer Type';
            DataClassification = CustomerContent;
        }
    }
}