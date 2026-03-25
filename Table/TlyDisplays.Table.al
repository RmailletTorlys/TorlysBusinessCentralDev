table 51059 TlyDisplays
{
    DataClassification = CustomerContent;
    Caption = 'Displays';
    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Ship-to Address";
        }
        field(2; "Ship-to Code"; Code[20])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address";
        }
        field(11; "Club"; Enum TlyClub)
        {
            Caption = 'Club';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Club where("No." = field("Customer No.")));
        }
        field(12; "Power Up Level"; Enum TlyPowerUpLevel)
        {
            Caption = 'Club';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer."Power Up Level" where("No." = field("Customer No.")));
        }
        field(13; "Display Type"; Enum TlyDisplayTypes)
        {
            Caption = 'Display Type';
        }
        field(14; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(15; "Item Category Description"; Text[100])
        {
            Caption = 'Item Category Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Item Category".Description where(Code = field("Item Category Code")));
        }
        field(16; "Comments"; Text[100])
        {
            Caption = 'Comments';
        }
    }
}
