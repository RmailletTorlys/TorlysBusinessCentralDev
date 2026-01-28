table 55103 TlyFreightForwarderCosts
{
    DrillDownPageID = TlyFreightForwarderCosts;
    LookupPageID = TlyFreightForwarderCosts;
    DataClassification = CustomerContent;
    Caption = 'Freight Forwarder Costs';

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency;
        }
        field(4; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = "Location";
        }
        field(5; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
        field(6; "Origin Code"; Code[20])
        {
            Caption = 'Origin Code';
            DataClassification = CustomerContent;
        }
        field(7; "Port of Loading"; Code[20])
        {
            Caption = 'Port of Loading';
            DataClassification = CustomerContent;
            TableRelation = "TPS CMG Container Port";
        }
        field(8; "Steamship Line"; Text[20])
        {
            Caption = 'Steamship Line';
            DataClassification = CustomerContent;
            TableRelation = TlySteamshipLine;
        }
        field(9; "Port of Discharge"; Code[20])
        {
            Caption = 'Port of Discharge';
            DataClassification = CustomerContent;
            TableRelation = "TPS CMG Container Port";
        }
        field(10; "Inland Terminal"; Text[20])
        {
            Caption = 'Inland Terminal';
            DataClassification = CustomerContent;
            TableRelation = TlyInlandTerminal;
        }
        field(11; "Destination Address"; Code[20])
        {
            Caption = 'Destination Address';
            DataClassification = CustomerContent;
        }
        field(12; "Container Type"; Code[20])
        {
            Caption = 'Container Type';
            DataClassification = CustomerContent;
            TableRelation = "TPS CMG Container Type";
        }
        field(13; "Transport Method"; Text[20])
        {
            Caption = 'Transport Method';
            DataClassification = CustomerContent;
            TableRelation = TlyTransportMethod;
        }
        field(14; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(15; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
        field(16; "Rate"; Decimal)
        {
            Caption = 'Rate';
            DataClassification = CustomerContent;
        }
        field(17; "Sales Costing Sheet Rate"; Boolean)
        {
            Caption = 'Sales Costing Sheet Rate';
            DataClassification = CustomerContent;
        }
        field(18; "Comments"; Text[50])
        {
            Caption = 'Comments';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Vendor No.", "Line No.")
        {
            Clustered = true;
        }
    }
}