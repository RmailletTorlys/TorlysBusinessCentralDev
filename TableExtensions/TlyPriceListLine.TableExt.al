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
        field(50003; "Stocking Pallet Price"; Decimal)
        {
            Caption = 'Full Pallet Price';
            ToolTip = 'Full Pallet Price';
            DataClassification = CustomerContent;
        }
        field(50004; "Unit Price Tier"; Code[20])
        {
            Caption = 'Unit Price Tier';
            ToolTip = 'Unit Price Tier';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Price List Line"."Price List Code" where("Product No." = field("Product No."), "Unit Price" = field("Unit Price"), "Price List Code" = filter('TIER*')));
        }
        field(50005; "Full Pallet Price Tier"; Code[20])
        {
            Caption = 'Full Pallet Price Tier';
            ToolTip = 'Full Pallet Price Tier';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Price List Line"."Price List Code" where("Product No." = field("Product No."), "Stocking Pallet Price" = field("Stocking Pallet Price"), "Price List Code" = filter('TIER*')));
        }
    }
}