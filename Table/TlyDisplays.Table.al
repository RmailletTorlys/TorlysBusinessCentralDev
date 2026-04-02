// table 51059 TlyCustomerDisplays
table 51059 TlyDisplays
{
    DataClassification = CustomerContent;
    Caption = 'Displays';
    // DrillDownPageId = TlyCustomerDisplays;
    // LookupPageId = TlyCustomerDisplays;
    ObsoleteState = Pending;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer";
        }
        field(2; "Ship-to Code"; Code[20])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("Customer No."));
        }
        field(3; "Name"; Text[100])
        {
            Caption = 'Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address".Name where("Code" = field("Ship-to Code")));
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address"."Name 2" where("Code" = field("Ship-to Code")));
        }
        field(5; "Address"; Text[100])
        {
            Caption = 'Address';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address"."Address" where("Code" = field("Ship-to Code")));
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address"."Address 2" where("Code" = field("Ship-to Code")));
        }
        field(7; "City"; Text[30])
        {
            Caption = 'City';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address"."City" where("Code" = field("Ship-to Code")));
        }
        field(8; "County"; Text[30])
        {
            Caption = 'County';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address"."County" where("Code" = field("Ship-to Code")));
        }

        field(9; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address"."Country/Region Code" where("Code" = field("Ship-to Code")));
        }
        field(10; "Post Code"; Text[30])
        {
            Caption = 'Post Code';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Ship-to Address"."Post Code" where("Code" = field("Ship-to Code")));
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
            Caption = 'Power Up Level';
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

    // keys
    // {
    //     key(Key1; "Customer No.", "Ship-to Code", "Display Type", "Item Category Code")
    //     {
    //         Clustered = true;
    //     }
    // }
}
