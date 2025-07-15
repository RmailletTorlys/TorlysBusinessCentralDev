table 55001 "Torlys Freight Zones"
{
    DrillDownPageID = "Freight Zone List";
    LookupPageID = "Freight Zone Lookup";
    DataClassification = CustomerContent;
    Caption = 'Torlys Freight Zones';


    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(4; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;
        }
        field(5; "Rate per sqft (flooring)"; Decimal)
        {
            Caption = 'Rate per sqft (flooring)';
            DataClassification = CustomerContent;
        }
        field(6; "Minimum Charge"; Decimal)
        {
            Caption = 'Minimum Charge';
            DataClassification = CustomerContent;
        }
        field(7; "Rate per Roll(Underlay)"; Decimal)
        {
            Caption = 'Rate per Roll(Underlay)';
            DataClassification = CustomerContent;
        }
        field(8; "Rate per Case(Sheet underlay)"; Decimal)
        {
            Caption = 'Rate per Roll(Overlay)';
            DataClassification = CustomerContent;
        }
        field(9; "Minimum Charge(Moulding)"; Decimal)
        {
            Caption = 'Minimum Charge(Moulding)';
            DataClassification = CustomerContent;
        }
        field(10; "Tailgate Charge"; Decimal)
        {
            Caption = 'Tailgate Charge';
            DataClassification = CustomerContent;
        }
        field(11; "Ships on - Monday"; Boolean)
        {
            Caption = 'Ships on - Monday';
            DataClassification = CustomerContent;
        }
        field(12; "Ships on - Tuesday"; Boolean)
        {
            Caption = 'Ships on - Tuesday';
            DataClassification = CustomerContent;
        }
        field(13; "Ships on - Wednesday"; Boolean)
        {
            Caption = 'Ships on - Wednesday';
            DataClassification = CustomerContent;
        }
        field(14; "Ships on - Thursday"; Boolean)
        {
            Caption = 'Ships on - Thursday';
            DataClassification = CustomerContent;
        }
        field(15; "Ships on - Friday"; Boolean)
        {
            Caption = 'Ships on - Friday';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(key1; "Code")
        {
            Clustered = true;
        }

        key(key2; "Description")
        {

        }

        key(key3; "Start Date")
        {

        }

        key(key4; "End Date")
        {

        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; "Code", "Description")
        {
            Caption = 'Drop Down';
        }
    }
}