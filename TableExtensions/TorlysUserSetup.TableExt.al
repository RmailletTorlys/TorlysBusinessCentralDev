tableextension 50091 "Torlys User Setup" extends "User Setup"
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
    }

}