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
    }
}