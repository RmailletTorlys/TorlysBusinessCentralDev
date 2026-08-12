tableextension 59657 TlyCustomReportSelection extends "Custom Report Selection"
{
    fields
    {
        field(50001; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
            TableRelation = "Ship-to Address".Code where("Customer No." = field("Source No."));
        }
    }
}