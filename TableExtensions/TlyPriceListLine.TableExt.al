tableextension 57001 TlyPriceListLine extends "Price List Line"
{
    fields
    {
        field(50001; "Cost Based On"; Option)
        {
            Caption = 'Cost Based On';
            ToolTip = 'Cost Based On';
            DataClassification = CustomerContent;
            OptionMembers = " ","Ship Date","PO Date";
        }

        field(50002; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            ToolTip = 'Shipment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
    }

}
