Table 51057 "Display Header"
{
    Fields
    {
        field(1; "CustNo."; Code[10])
        {
            Caption = 'No.';
            TableRelation = Customer;
        }
        field(2; "CustName"; Text[100])
        {
            Caption = 'Name';
            TableRelation = Customer.Name where("No." = field("CustNo."));
        }
        field(3; "CustLocationCode"; Code[10])
        {
            Caption = 'Location';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("CustNo."));
        }
        field(4; "CustAddress"; Code[100])
        {
            Caption = 'No.';
            TableRelation = "Ship-to Address".Address where("Customer No." = field("CustNo."));
        }
        field(5; "PowerUp"; Text[20])
        {
            Caption = 'PowerUp ID';
        }
        field(6; "PowerUpLevel"; Text[20])
        {
            Caption = 'Power Up Level';
        }


    }

    Keys
    {
        key(Key1; "CustNo.", "CustLocationCode")
        {
            Clustered = true;
        }
    }

    procedure GetDisplayHeaderInfo(DisplayHeaderRec: Record "Display Header")
    var
        Customer: Record Customer;

    begin
        Rec := DisplayHeaderRec;
        if Customer.Get(Rec."CustNo.") then begin
            Customer.SetFilter("No.", Rec."CustNo.");
            Customer.FindFirst();
            Rec.CustName := Customer.Name;
            Rec.PowerUp := Format(Customer."CLUB");
            Rec.PowerUpLevel := Format(Customer."Power Up Level");
        end;
    end;

    procedure GetShipToAddressInfo(DisplayHeaderRec: Record "Display Header")
    var
        ShipToAddress: Record "Ship-to Address";
    begin
        Rec := DisplayHeaderRec;
        if ShipToAddress.Get(Rec."CustNo.", Rec."CustLocationCode") then begin
            ShipToAddress.SetFilter("Customer No.", Rec."CustNo.");
            ShipToAddress.SetFilter("Code", Rec."CustLocationCode");
            ShipToAddress.FindFirst();
            Rec.CustAddress := ShipToAddress.Address;
        end;
    end;



}