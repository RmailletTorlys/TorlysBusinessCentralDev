Table 51057 TlyDisplayHeader
{
    DataClassification = CustomerContent;
    Caption = 'Display Header';
    Fields
    {
        field(1; "Customer No."; Code[10])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(2; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';

        }
        field(3; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("Customer No."));
        }
        field(4; "CustAddress"; Code[100])
        {
            Caption = 'Location Address';

        }
        field(5; "Club"; Enum TlyClub)
        {
            Caption = 'Club';
            ToolTip = 'Specifies the Club that the customer is assigned to.';
            DataClassification = CustomerContent;
        }
        field(6; "Power Up Level"; Enum TlyPowerUpLevel)
        {
            Caption = 'Power Up Level';
            ToolTip = 'Specifies the Power Up level that the customer is assigned to.';
            DataClassification = CustomerContent;
        }
    }

    Keys
    {
        key(Key1; "Customer No.", "Ship-to Code")
        {
            Clustered = true;
        }
    }

    // procedure GetDisplayHeaderInfo(DisplayHeaderRec: Record TlyDisplayHeader)
    // var
    //     Customer: Record Customer;
    // begin
    //     Rec := DisplayHeaderRec;
    //     if Customer.Get(Rec."Customer No.") then begin
    //         Customer.SetFilter("No.", Rec."Customer No.");
    //         Customer.FindFirst();
    //         Rec."Customer Name" := Customer.Name;
    //         Rec.PowerUp := Format(Customer."CLUB");
    //         Rec.PowerUpLevel := Format(Customer."Power Up Level");
    //     end;
    // end;

    // procedure GetShipToAddressInfo(DisplayHeaderRec: Record TlyDisplayHeader)
    // var
    //     ShipToAddress: Record "Ship-to Address";
    // begin
    //     Rec := DisplayHeaderRec;
    //     if ShipToAddress.Get(Rec."Customer No.", Rec."Ship-to Code") then begin
    //         ShipToAddress.SetFilter("Customer No.", Rec."Customer No.");
    //         ShipToAddress.SetFilter("Code", Rec."Ship-to Code");
    //         ShipToAddress.FindFirst();
    //         Rec.CustAddress := ShipToAddress.Address;
    //     end;
    // end;
}