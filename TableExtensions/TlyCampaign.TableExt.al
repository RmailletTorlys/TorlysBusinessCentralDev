tableextension 55071 TlyCampaign extends "Campaign"
{
    fields
    {
        field(50001; "Default Price List Code"; Code[20])
        {
            Caption = 'Default Price List Code';
            ToolTip = 'Default Price List Code';
            DataClassification = CustomerContent;
            TableRelation = "Price List Header".Code where("Price List Type" = filter('National Promo'));
        }
    }
}