tableextension 50091 TlyUserSetup extends "User Setup"
{
    fields
    {
        field(50001; "Default Location Code"; Code[20])
        {
            Caption = 'Default Location Code';
            ToolTip = 'Default Location Code';
            DataClassification = CustomerContent;
            TableRelation = "Location";
        }
        field(50002; "SO Qty. to Ship Edit"; Boolean)
        {
            Caption = 'SO Qty. to Ship Edit';
            ToolTip = 'SO Qty. to Ship Edit';
            DataClassification = CustomerContent;
        }
    }

}