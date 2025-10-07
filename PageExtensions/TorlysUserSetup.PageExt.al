pageextension 50119 TorlysUserSetup extends "User Setup"
{
    layout
    {
        addafter("User ID")
        {
            field("Location Code"; Rec."Default Location Code")
            {
                ApplicationArea = All;
                Caption = 'Default Location Code';
                ToolTip = 'Default Location Code';
                Visible = true;
            }
        }
    }
}