tableextension 59743 TlyTPSCMGContainerHeader extends "TPS CMG Container Header"
{
    fields
    {
        field(50001; "Origin Port Date"; Date)
        {
            Caption = 'Origin Port Date';
            DataClassification = CustomerContent;
        }
        field(50002; "Destination Port Date"; Date)
        {
            Caption = 'Destination Port Date';
            DataClassification = CustomerContent;
        }
        field(50003; "Inland Terminal Date"; Date)
        {
            Caption = 'Inland Terminal Date';
            DataClassification = CustomerContent;
        }
        field(50004; "Previous ETA"; Date)
        {
            Caption = 'Previous ETA';
            DataClassification = CustomerContent;
        }
        field(50005; "Steamship Line"; Text[20])
        {
            Caption = 'Steamship Line';
            DataClassification = CustomerContent;
            TableRelation = TlySteamshipLine;
        }
        field(50006; "Insurance Certificate No."; Text[30])
        {
            Caption = 'Insurance Certificate No.';
            DataClassification = CustomerContent;
        }
        field(50007; "Freight Forwarder"; Code[20])
        {
            Caption = 'Freight Forwarder';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
    }
}