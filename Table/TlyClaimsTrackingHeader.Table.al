table 55007 TlyClaimsTrackingHeader
{
    DataClassification = CustomerContent;
    Caption = 'Claims Tracking';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }

        field(2; "Sell-to Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Customer No.';
        }

        field(3; "Sell-to Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Customer Name';
        }

        field(4; "Sell-to Customer Name 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Customer Name 2';
        }

        field(5; "Sell-to Address"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Address';
        }

        field(6; "Sell-to Address 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Address 2';
        }

        field(7; "Sell-to City"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to City';
        }

        field(8; "Sell-to Post Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Post Code';
        }

        field(9; "Sell-to County"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Country/Region Code';
        }

        field(10; "Sell-to Country/Region Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Country/Region Code';
        }

        field(11; "Ship-to Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Ship-to Code';
        }

        field(12; "Original Invoice No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Original Invoice No.';
        }

        field(13; "Original Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Original Invoice Date';
        }

        field(14; "Original Shipment Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Original Shipment Date';
        }

        field(15; "Original Order Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Original Order Date';
        }

        field(16; "External Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'External Document No.';
        }

        field(17; "Tag Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Tag Name';
        }

        field(18; "Location Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Location Code';
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