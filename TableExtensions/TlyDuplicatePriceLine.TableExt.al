tableextension 57009 TlyDuplicatePriceLine extends "Duplicate Price Line"
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
        field(50003; "Stocking Pallet Price"; Decimal)
        {
            Caption = 'Stocking Pallet Price';
            ToolTip = 'Stocking Pallet Price';
            DataClassification = CustomerContent;
        }
    }
}