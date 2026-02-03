tableextension 59743 TlyTPSCMGContainerHeader extends "TPS CMG Container Header"
{
    fields
    {
        field(50001; "Port of Loading Date"; Date)
        {
            Caption = 'Port of Loading Date';
            DataClassification = CustomerContent;
        }
        field(50002; "Port of Discharge Date"; Date)
        {
            Caption = 'Port of Discharge Date';
            DataClassification = CustomerContent;
        }
        field(50003; "Inland Terminal"; Text[20])
        {
            Caption = 'Inland Terminal';
            DataClassification = CustomerContent;
            TableRelation = TlyInlandTerminal;
        }
        field(50004; "Inland Terminal Date"; Date)
        {
            Caption = 'Inland Terminal Date';
            DataClassification = CustomerContent;
        }
        field(50005; "Previous ETA"; Date)
        {
            Caption = 'Previous ETA';
            DataClassification = CustomerContent;
        }
        field(50006; "Steamship Line"; Text[20])
        {
            Caption = 'Steamship Line';
            DataClassification = CustomerContent;
            TableRelation = TlySteamshipLine;
        }
        field(50007; "Insurance Certificate No."; Text[30])
        {
            Caption = 'Insurance Certificate No.';
            DataClassification = CustomerContent;
        }
        field(50008; "Freight Forwarder"; Code[20])
        {
            Caption = 'Freight Forwarder';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }

        field(50009; "Crossdock"; Boolean)
        {
            Caption = 'Crossdock';
            DataClassification = CustomerContent;

        }

        field(50010; "ERS"; Boolean)
        {
            Caption = 'ERS';
            DataClassification = CustomerContent;

        }

        field(50011; "Urgent"; Boolean)
        {
            Caption = 'Urgent';
            DataClassification = CustomerContent;

        }

        field(50012; "Strike"; Boolean)
        {
            Caption = 'Strike';
            DataClassification = CustomerContent;

        }

        field(50013; "Vendor No."; Text[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }

        field(50014; "Delivery Appointment Date"; Date)
        {
            Caption = 'Delivery Appointment Date';
            DataClassification = CustomerContent;
        }

        field(50015; "Freight Cost"; Decimal)
        {
            Caption = 'Freight Cost';
            DataClassification = CustomerContent;
        }

        field(50016; "Premium Cost"; Decimal)
        {
            Caption = 'Premium Cost';
            DataClassification = CustomerContent;
        }







    }
}