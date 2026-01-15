tableextension 56650 TlyReturnShipmentHeader extends "Return Shipment Header"
{
    fields
    {
        field(50001; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            DataClassification = CustomerContent;
            TableRelation = Manufacturer;
        }
        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }


    }
}