table 55104 TlyItemAdditionalCosts
{
    DrillDownPageID = TlyItemAdditionalCosts;
    LookupPageID = TlyItemAdditionalCosts;
    DataClassification = CustomerContent;
    Caption = 'Item Additional Costs';

    fields
    {
        field(1; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            DataClassification = CustomerContent;
            TableRelation = "Item Category";
        }
        field(2; "Additional Cost Type"; Code[20])
        {
            Caption = 'Additional Cost Type';
            DataClassification = CustomerContent;
            TableRelation = TlyItemAdditionalCostType;
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
        field(5; "Unit of Measure Code"; Code[20])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(6; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency;
        }
        field(7; "Cost Unit"; Option)
        {
            Caption = 'Cost Unit';
            OptionMembers = " ",Dollar,Percentage;
            DataClassification = CustomerContent;
        }
        field(8; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(9; "Costing Method"; Option)
        {
            Caption = 'Costing Method';
            OptionMembers = " ","Direct cost surcharge","Indirect cost","Charge item";
            DataClassification = CustomerContent;
        }
        field(10; "Remit-to Vendor No."; Code[20])
        {
            Caption = 'Remit-to Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(key1; "Item Category Code", "Additional Cost Type", "Starting Date", "Ending Date")
        {
            Clustered = true;
        }
    }
}