table 55004 "Torlys Processed BOL Header"
{
    DataClassification = CustomerContent;
    Caption = 'Torlys Processed BOL Header';

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

        field(10; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }

        field(11; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
        }

        field(12; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }

        field(13; "Shipping Agent Code"; Code[20])
        {
            Caption = 'Shipping Agent Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent";
        }

        field(14; "Freight Type"; Option)
        {
            Caption = 'Freight Type';
            OptionMembers = "Prepaid","Collect";
            DataClassification = CustomerContent;
        }

        field(15; "Pickup Date"; Date)
        {
            Caption = 'Pickup Date';
            DataClassification = CustomerContent;
        }

        field(16; "Shipping Instructions 1"; Text[50])
        {
            Caption = 'Shipping Instructions 1';
            DataClassification = CustomerContent;
        }

        field(17; "Shipping Instructions 2"; Text[50])
        {
            Caption = 'Shipping Instructions 2';
            DataClassification = CustomerContent;
        }
        field(18; "Shipping Instructions 3"; Text[50])
        {
            Caption = 'Shipping Instructions 3';
            DataClassification = CustomerContent;
        }
        field(19; "Shipping Instructions 4"; Text[50])
        {
            Caption = 'Shipping Instructions 4';
            DataClassification = CustomerContent;
        }

        field(20; "No. of Skids"; Integer)
        {
            Caption = 'No. of Skids';
            DataClassification = CustomerContent;

        }

        field(21; "No. of Boxes"; Integer)
        {
            Caption = 'No. of Boxes';
            DataClassification = CustomerContent;

        }

        field(22; "No. of Tubes"; Integer)
        {
            Caption = 'No. of Tubes';
            DataClassification = CustomerContent;

        }

        field(23; "No. of Packages"; Integer)
        {
            Caption = 'No. of Packages';
            DataClassification = CustomerContent;
        }

        field(24; "No. of Rolls"; Integer)
        {
            Caption = 'No. of Rolls';
            DataClassification = CustomerContent;

        }

        field(25; "Piece Count"; text[260])
        {
            Caption = 'Piece Count';
            DataClassification = CustomerContent;
        }

        field(26; "Loaded by"; Code[20])
        {
            Caption = 'Loaded by';
            DataClassification = CustomerContent;

        }

        field(27; "Carrier Tracking No."; Code[15])
        {
            Caption = 'Carrier Tracking No.';
            DataClassification = CustomerContent;
        }

        field(28; "Weight - Total"; Decimal)
        {
            Caption = 'Weight-Total';
            DataClassification = CustomerContent;
        }

        field(29; "Weight - Other"; Decimal)
        {
            Caption = 'Weight-Other';
            DataClassification = CustomerContent;
        }

        field(30; "Weight - Flooring"; Decimal)
        {
            Caption = 'Weight - Flooring';
            DataClassification = CustomerContent;
        }

        field(31; "Weight - Underlayment Rolls"; Decimal)
        {
            Caption = 'Weight - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(32; "Weight - Mouldings"; Decimal)
        {
            Caption = 'Weight - Mouldings';
            DataClassification = CustomerContent;
        }

        field(33; "Cases - Total"; Decimal)
        {
            Caption = 'Cases - Total';
            DataClassification = CustomerContent;
        }

        field(34; "Cases - Other"; Decimal)
        {
            Caption = 'Cases - Other';
            DataClassification = CustomerContent;
        }

        field(35; "Cases - Flooring"; Decimal)
        {
            Caption = 'Cases - Flooring';
            DataClassification = CustomerContent;
        }

        field(36; "Cases - Underlayment Rolls"; Decimal)
        {
            Caption = 'Cases - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(37; "Cases - Mouldings"; Decimal)
        {
            Caption = 'Cases - Mouldings';
            DataClassification = CustomerContent;
        }

        field(38; "Base Quantity - Total"; Decimal)
        {
            Caption = 'Base Quantity - Total';
            DataClassification = CustomerContent;
        }

        field(39; "Base Quantity - Other"; Decimal)
        {
            Caption = 'Base Quantity - Other';
            DataClassification = CustomerContent;
        }

        field(40; "Base Quantity - Flooring"; Decimal)
        {
            Caption = 'Base Quantity - Flooring';
            DataClassification = CustomerContent;
        }

        field(41; "Base Qty. - Underlayment Rolls"; Decimal)
        {
            Caption = 'Base Quantity - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(42; "Base Quantity - Mouldings"; Decimal)
        {
            Caption = 'Base Quantity - Mouldings';
            DataClassification = CustomerContent;
        }

        field(43; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            DataClassification = CustomerContent;
        }

        field(44; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
        }

        field(45; "Created Date"; DateTime)
        {
            Caption = 'Created Date';
            DataClassification = CustomerContent;
        }

        field(46; "Created Time"; Time)
        {
            Caption = 'Created Time';
            DataClassification = CustomerContent;
        }

        field(47; "Last Print By"; Code[20])
        {
            Caption = 'Last Print By';
            DataClassification = CustomerContent;
        }

        field(48; "Last Print Date"; DateTime)
        {
            Caption = 'Last Print Date';
            DataClassification = CustomerContent;
        }

        field(49; "Last Print Time"; Time)
        {
            Caption = 'Last Print Time';
            DataClassification = CustomerContent;
        }

        field(50; "Shipping Comment"; Text[50])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        field(51; "Posted Date"; DateTime)
        {
            Caption = 'Posted Date';
            DataClassification = CustomerContent;
        }

        field(52; "Posted By"; Code[30])
        {
            Caption = 'Posted By';
            DataClassification = CustomerContent;
        }

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