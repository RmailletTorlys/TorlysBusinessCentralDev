tableextension 56650 TorlysReturnShipmentHeader extends "Return Shipment Header"
{
    fields
    {


        field(50008; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }

        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }


    }
}