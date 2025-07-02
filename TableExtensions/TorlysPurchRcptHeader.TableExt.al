tableextension 50120 TorlysPurchRcptHeader extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50007; "Manufacturer Code"; Code[20])
        {
            Caption = 'Manufacturer Code';
            DataClassification = CustomerContent;
        }

        field(50008; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }

        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }

        field(50011; "Incoterms"; Code[20])
        {
            Caption = 'Incoterms';
            DataClassification = CustomerContent;
        }

    }
}