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
        field(50003; "Rank"; Option)
        {
            Caption = 'Rank';
            ToolTip = 'Rank';
            DataClassification = CustomerContent;
            OptionMembers = " ","1","2","3","4","5";
        }
        field(50004; "Sell Order Rank"; Option)
        {
            Caption = 'Sell Order Rank';
            ToolTip = 'Sell Order Rank';
            DataClassification = CustomerContent;
            OptionMembers = " ",A,B,C,D;
        }
    }
}