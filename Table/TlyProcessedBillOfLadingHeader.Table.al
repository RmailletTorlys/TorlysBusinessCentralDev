table 55004 TlyProcessedBillOfLadingHeader
{
    DataClassification = CustomerContent;
    Caption = 'Processed BOL Header';

    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "Transaction Type"; Option)
        {
            Caption = 'Transaction Type';
            OptionMembers = "Shipment","Transfer";
            DataClassification = CustomerContent;
        }

        field(3; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;

        }

        field(4; "Customer No."; Code[10])
        {
            Caption = 'Customer No.';

            DataClassification = CustomerContent;
        }

        field(5; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;

        }

        field(6; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
            DataClassification = CustomerContent;
        }

        field(7; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = CustomerContent;
        }

        field(8; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = CustomerContent;
        }

        field(9; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = CustomerContent;
        }

        field(10; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
            DataClassification = CustomerContent;
        }

        field(11; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }

        field(12; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
        }

        field(13; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }

        field(14; "Shipping Agent Code"; Code[20])
        {
            Caption = 'Shipping Agent Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent";
        }

        // field(15; "Freight Type"; Option)
        // {
        //     Caption = 'Freight Type';
        //     OptionMembers = "Prepaid","Collect";
        //     DataClassification = CustomerContent;
        // }

        field(16; "Pickup Date"; Date)
        {
            Caption = 'Pickup Date';
            DataClassification = CustomerContent;
        }

        field(17; "Shipping Instructions 1"; Text[100])
        {
            Caption = 'Shipping Instructions';
            DataClassification = CustomerContent;
        }

        field(18; "Shipping Instructions 2"; Text[50])
        {
            Caption = 'Shipping Instructions 2';
            DataClassification = CustomerContent;
        }

        field(21; "No. of Skids"; Integer)
        {
            Caption = 'No. of Skids';
            DataClassification = CustomerContent;
        }

        field(22; "No. of Boxes"; Integer)
        {
            Caption = 'No. of Boxes';
            DataClassification = CustomerContent;

        }

        field(23; "No. of Tubes"; Integer)
        {
            Caption = 'No. of Tubes';
            DataClassification = CustomerContent;


        }

        field(24; "No. of Packages"; Integer)
        {
            Caption = 'No. of Packages';
            DataClassification = CustomerContent;


        }

        field(25; "No. of Rolls"; Integer)
        {
            Caption = 'No. of Rolls';
            DataClassification = CustomerContent;

        }

        field(26; "Piece Count"; text[260])
        {
            Caption = 'Piece Count';
            DataClassification = CustomerContent;
        }

        field(27; "Loaded by"; Code[20])
        {
            Caption = 'Loaded by';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(28; "Package Tracking No."; Text[50])
        {
            Caption = 'Package Tracking No.';
            DataClassification = CustomerContent;
        }

        field(29; "Weight - Total"; Decimal)
        {
            Caption = 'Weight-Total';
            DecimalPlaces = 2 : 5;
            FieldClass = FlowField;
            CalcFormula = sum(TlyProcessedBillOfLadingLine."Total Weight" where("BOL No." = field("No.")));
        }

        field(30; "Weight - Other"; Decimal)
        {
            Caption = 'Weight - Other';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(31; "Weight - Flooring"; Decimal)
        {
            Caption = 'Weight - Flooring';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(32; "Weight - Underlayment Rolls"; Decimal)
        {
            Caption = 'Weight - Underlayment Rolls';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(33; "Weight - Mouldings"; Decimal)
        {
            Caption = 'Weight - Mouldings';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(34; "Cases - Total"; Decimal)
        {
            Caption = 'Cases - Total';
            FieldClass = FlowField;
            CalcFormula = sum(TlyProcessedBillOfLadingLine."Total Cases" where("BOL No." = field("No.")));
        }

        field(35; "Cases - Other"; Decimal)
        {
            Caption = 'Cases - Other';
            DataClassification = CustomerContent;
        }

        field(36; "Cases - Flooring"; Decimal)
        {
            Caption = 'Cases - Flooring';
            DataClassification = CustomerContent;
        }

        field(37; "Cases - Underlayment Rolls"; Decimal)
        {
            Caption = 'Cases - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(38; "Cases - Mouldings"; Decimal)
        {
            Caption = 'Cases - Mouldings';
            DataClassification = CustomerContent;
        }

        // field(39; "Base Quantity - Total"; Decimal)
        // {
        //     Caption = 'Base Quantity - Total';
        //     DataClassification = CustomerContent;
        // }

        // field(40; "Base Quantity - Other"; Decimal)
        // {
        //     Caption = 'Base Quantity - Other';
        //     DataClassification = CustomerContent;
        // }

        // field(41; "Base Quantity - Flooring"; Decimal)
        // {
        //     Caption = 'Base Quantity - Flooring';
        //     DataClassification = CustomerContent;
        // }

        // field(42; "Base Qty. - Underlayment Rolls"; Decimal)
        // {
        //     Caption = 'Base Quantity - Underlayment Rolls';
        //     DataClassification = CustomerContent;
        // }

        // field(43; "Base Quantity - Mouldings"; Decimal)
        // {
        //     Caption = 'Base Quantity - Mouldings';
        //     DataClassification = CustomerContent;
        // }

        field(44; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            DataClassification = CustomerContent;
        }

        // field(45; "Created By"; Code[20])
        // {
        //     Caption = 'Created By';
        //     DataClassification = CustomerContent;
        // }

        // field(46; "Created Date"; DateTime)
        // {
        //     Caption = 'Created Date';
        //     DataClassification = CustomerContent;
        // }

        // field(47; "Created Time"; Time)
        // {
        //     Caption = 'Created Time';
        //     DataClassification = CustomerContent;
        // }

        // field(48; "Last Print By"; Code[20])
        // {
        //     Caption = 'Last Print By';
        //     DataClassification = CustomerContent;
        // }

        field(49; "Last Print Date"; DateTime)
        {
            Caption = 'Last Print Date';
            DataClassification = CustomerContent;
        }

        // field(50; "Last Print Time"; Time)
        // {
        //     Caption = 'Last Print Time';
        //     DataClassification = CustomerContent;
        // }

        field(51; "Shipping Comment"; Text[100])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        // field(52; "Posted Date"; DateTime)
        // {
        //     Caption = 'Posted Date';
        //     DataClassification = CustomerContent;
        // }

        field(53; "Freight Charges"; Option)
        {
            Caption = 'Freight Charges';
            OptionMembers = "","Prepaid","Collect";
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}