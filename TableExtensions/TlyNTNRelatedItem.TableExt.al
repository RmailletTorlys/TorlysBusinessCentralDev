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

        field(50010; "Item - Web Enabled"; Boolean)
        {
            Caption = 'Item - Web Enabled';
            ToolTip = 'Item - Web Enabled';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."NTN Web Enabled" where("No." = field("No.")));
        }

        field(50011; "Item - Discontinued Item"; Boolean)
        {
            Caption = 'Item - Discontinued Item';
            ToolTip = 'Item - Discontinued Item';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Discontinued Item" where("No." = field("No.")));
        }

        field(50020; "Related - Web Enabled"; Boolean)
        {
            Caption = 'Related - Web Enabled';
            ToolTip = 'Related - Web Enabled';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."NTN Web Enabled" where("No." = field("Related Item No.")));
        }

        field(50021; "Related - Discontinued Item"; Boolean)
        {
            Caption = 'Related - Discontinued Item';
            ToolTip = 'Related - Discontinued Item';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Discontinued Item" where("No." = field("Related Item No.")));
        }
    }
}