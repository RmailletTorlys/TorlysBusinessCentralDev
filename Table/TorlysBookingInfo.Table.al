table 55009 TorlysBookingInfo
{
    DataClassification = CustomerContent;
    Caption = 'Booking Info';

    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "Appointment Date"; Date)
        {
            Caption = 'Appointment Date';
            DataClassification = CustomerContent;
        }

        field(3; "Appointment Time"; Time)
        {
            Caption = 'Appointment Time';
            DataClassification = CustomerContent;
        }

        field(4; "Received by"; Code[20])
        {
            Caption = 'Received by';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(5; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
            DataClassification = CustomerContent;
        }

        field(6; "Receipt Time"; Time)
        {
            Caption = 'Receipt Time';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}