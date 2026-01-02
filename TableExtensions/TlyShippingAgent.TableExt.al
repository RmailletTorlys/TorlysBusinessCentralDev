tableextension 50291 TlyShippingAgent extends "Shipping Agent"
{
    fields
    {
        field(50001; "Agent No."; Integer)
        {
            Caption = 'Agent No.';
            DataClassification = CustomerContent;
        }

        field(50002; "Freight Charges"; Option)
        {
            Caption = 'Freight Charges';
            OptionMembers = " ","Prepaid","Collect";
            DataClassification = CustomerContent;
        }

        field(50003; "Pro Bill Type"; Option)
        {
            Caption = 'Pro Bill Type';
            OptionMembers = " ","Single","Master";
        }

        field(50004; "Master Pro Bill"; Code[20])
        {
            Caption = 'Master Pro Bill';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent" where("Pro Bill Type" = Filter("Master"));
        }

        field(50005; "Pickup/Beyond Method"; Boolean)
        {
            Caption = 'Pickup/Beyond Method';
            DataClassification = CustomerContent;
        }

        field(50006; "Pickup/Beyond Address 1"; Text[30])
        {
            Caption = 'Pickup/Beyond Address 1';
            DataClassification = CustomerContent;
        }

        field(50007; "Pickup/Beyond Address 2"; Text[30])
        {
            Caption = 'Pickup/Beyond Address 2';
            DataClassification = CustomerContent;
        }

        field(50008; "Pickup/Beyond Address 3"; Text[30])
        {
            Caption = 'Pickup/Beyond Address 3';
            DataClassification = CustomerContent;
        }

        field(50009; "Pickup/Beyond Address 4"; Text[30])
        {
            Caption = 'Pickup/Beyond Address 4';
            DataClassification = CustomerContent;
        }

        field(50010; "Pickup/Beyond Address 5"; Text[30])
        {
            Caption = 'Pickup/Beyond Address 5';
            DataClassification = CustomerContent;
        }

        field(50011; "Pickup/Beyond Address 6"; Text[30])
        {
            Caption = 'Pickup/Beyond Address 6';
            DataClassification = CustomerContent;
        }

        field(50012; "Pickup/Beyond Dest. Instr."; Text[50])
        {
            Caption = 'Pickup/Beyond Destination Instructions';
            DataClassification = CustomerContent;
        }
    }
}