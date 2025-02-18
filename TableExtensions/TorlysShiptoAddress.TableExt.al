tableextension 50118 "TorlysShiptoAddress" extends "Ship-to Address"
{
    fields
    {
        field(50001; "Comment 1"; Text[50])
        {
            Caption = 'Comment 1';
            DataClassification = CustomerContent;
        }
        field(50002; "Comment 2"; Text[50])
        {
            Caption = 'Comment 2';
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
    }

}