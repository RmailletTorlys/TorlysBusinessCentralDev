tableextension 50222 "TorlysShiptoAddress" extends "Ship-to Address"
{
    fields
    {
        field(50001; "Comment"; Text[50])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
        field(50003; "Email (BoL)"; Text[80])
        {
            Caption = 'Email (BoL)';
            DataClassification = CustomerContent;
        }
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
        field(50010; "Destination Instructions"; Text[50])
        {
            Caption = 'Destination Instructions 1';
            DataClassification = CustomerContent;
        }

        field(50012; "Shipping Instructions"; Code[30])
        {
            Caption = 'Shipping Instructions';
            DataClassification = CustomerContent;
            TableRelation = "Torlys Lookup Values" where(Type = const("Shipping Instructions"));
        }

        field(50013; "Shipping Comment"; Text[50])
        {
            Caption = 'Shipping Comment';
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