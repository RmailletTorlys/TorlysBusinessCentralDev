tableextension 50120 TlyPurchRcptHeader extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50001; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            DataClassification = CustomerContent;
            TableRelation = Manufacturer;
        }
        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }
    }
}