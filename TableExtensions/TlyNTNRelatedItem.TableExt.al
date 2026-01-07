tableextension 51641 TlyNTNRelatedItem extends "NTN Related Item"
{
    fields
    {
        field(50001; "Inventory - TOR"; Decimal)
        {
            Caption = 'Inventory - TOR';
            ToolTip = 'Inventory - TOR';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity where("Item No." = field("Related Item No."), "Location Code" = filter('TOR')));
        }

        field(50002; "Inventory - CAL"; Decimal)
        {
            Caption = 'Inventory - CAL';
            ToolTip = 'Inventory - CAL';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity where("Item No." = field("Related Item No."), "Location Code" = filter('CAL')));
        }
    }
}