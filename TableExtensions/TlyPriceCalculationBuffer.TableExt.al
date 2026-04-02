tableextension 57007 TlyPriceCalculationBuffer extends "Price Calculation Buffer"
{
    fields
    {
        field(50001; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            ToolTip = 'Shipment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
    }
}