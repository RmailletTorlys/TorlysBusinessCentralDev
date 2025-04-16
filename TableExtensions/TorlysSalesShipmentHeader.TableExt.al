tableextension 50043 TorlysSalesShipmentHeader extends "Sales Shipment Header"
{
    fields
    {
        field(50001; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = "Torlys Freight Zones";

        }
    }
}