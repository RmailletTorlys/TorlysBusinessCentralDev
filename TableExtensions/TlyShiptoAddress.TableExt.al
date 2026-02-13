tableextension 50222 TlyShiptoAddress extends "Ship-to Address"
{
    fields
    {
        // field(50001; "Comment"; Text[50])
        // {
        //     Caption = 'Comment';
        //     DataClassification = CustomerContent;
        // }
        // field(50003; "Email (BoL)"; Text[80])
        // {
        //     Caption = 'Email (BoL)';
        //     DataClassification = CustomerContent;
        // }
        field(50004; "Have Dock"; Boolean)
        {
            Caption = 'Have Dock';
            DataClassification = CustomerContent;
        }
        field(50005; "Tailgate Required"; Boolean)
        {
            Caption = 'Tailgate Required';
            DataClassification = CustomerContent;
        }
        field(50006; "Forklift Available"; Boolean)
        {
            Caption = 'Forklift Available';
            DataClassification = CustomerContent;
        }
        field(50007; "Receiving Hours"; Text[30])
        {
            Caption = 'Receiving Hours';
            DataClassification = CustomerContent;
        }
        field(50008; "Maximum Truck Size"; Text[15])
        {
            Caption = 'Maximum Truck Size';
            DataClassification = CustomerContent;
        }
        field(50009; "Pump Truck Required"; Boolean)
        {
            Caption = 'Pump Truck Required';
            DataClassification = CustomerContent;
        }
        // field(50010; "Destination Instructions"; Text[50])
        // {
        //     Caption = 'Destination Instructions';
        //     DataClassification = CustomerContent;
        // }
        field(50012; "Shipping Instructions"; Code[20])
        {
            Caption = 'Shipping Instructions';
            DataClassification = CustomerContent;
            TableRelation = TlyShippingInstructions;
        }
        field(50013; "Shipping Comment"; Text[100])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }
        field(50014; "Dealer Locator Participant"; Boolean)
        {
            Caption = 'Dealer Locator Participant';
        }
        field(50015; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = TlyFreightZone;
        }
        field(50016; "Ships On - Monday"; Boolean)
        {
            Caption = 'Ships On - Monday';
            DataClassification = CustomerContent;
        }
        field(50017; "Ships On - Tuesday"; Boolean)
        {
            Caption = 'Ships On - Tuesday';
            DataClassification = CustomerContent;
        }
        field(50018; "Ships On - Wednesday"; Boolean)
        {
            Caption = 'Ships On - Wednesday';
            DataClassification = CustomerContent;
        }
        field(50019; "Ships On - Thursday"; Boolean)
        {
            Caption = 'Ships On - Thursday';
            DataClassification = CustomerContent;
        }
        field(50020; "Ships On - Friday"; Boolean)
        {
            Caption = 'Ships On - Friday';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(key2; "Code")
        {

        }
    }

}