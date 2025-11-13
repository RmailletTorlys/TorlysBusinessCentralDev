Table 51057 "Display Header"
{
    Fields
    {
        field(1; "CustNo."; Code[10])
        {
            Caption = 'No.';
        }
        field(2; "CustName"; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "CustLocationCode"; Code[10])
        {
            Caption = 'Location';
        }
        field(4; "CustAddress"; Code[20])
        {
            Caption = 'No.';
        }
        field(5; "PowerUp"; Code[20])
        {
            Caption = 'PowerUp ID';
        }
        field(6; "PowerUpLevel"; Code[20])
        {
            Caption = 'No.';
        }


    }

    Keys
    {
        key(Key1; "CustNo.", "CustLocationCode")
        {
            Clustered = true;
        }
    }
}