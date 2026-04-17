table 52017 TlySalesBudgets
{
    Caption = 'Sales Budgets';
    DataClassification = CustomerContent;
    LookupPageID = TlySalesBudgets;
    DrillDownPageId = TlySalesBudgets;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }

        field(3; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Bill-to Customer No." where("No." = field("Customer No.")));
        }

        field(4; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Salesperson Code" where("No." = field("Customer No.")));
        }
        field(5; "Region"; Code[20])
        {
            Caption = 'Region';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Global Dimension 1 Code" where("No." = field("Customer No.")));
        }
        field(6; "Club"; Enum TlyClub)
        {
            Caption = 'Club';
            FieldClass = FlowField;
            CalcFormula = lookup("Customer"."Club" where("No." = field("Customer No.")));
        }
        // field(7; "Buying Group"; Code[20])
        // {
        //     Caption = 'Buying Group';
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Customer"."Buying Group Code" where("No." = field("Customer No.")));
        // }
        field(8; "Channel"; Code[20])
        {
            Caption = 'Channel';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value"."Code" where("Dimension Code" = filter('CHANNEL'));
        }
        field(9; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Product Posting Group";
        }

        field(10; "National PM"; Boolean)
        {
            Caption = 'National PM';
            DataClassification = CustomerContent;
        }

        field(11; "National PM Brand"; Text[30])
        {
            Caption = 'National PM Brand';
            DataClassification = CustomerContent;
            TableRelation = TlyNationalPMBrand;
        }

        field(12; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }

        field(13; "Budget - Sales $"; Decimal)
        {
            Caption = 'Budget - Sales $';
            DataClassification = CustomerContent;
        }

        field(14; "Budget - Margin $"; Decimal)
        {
            Caption = 'Budget - Margin $';
            DataClassification = CustomerContent;
        }
        field(15; "Budget - Margin %"; Decimal)
        {
            Caption = 'Budget - Margin %';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}