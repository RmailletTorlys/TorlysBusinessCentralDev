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

            field("SO Qty. to Ship Edit"; Rec."SO Qty. to Ship Edit")
            {
                ApplicationArea = All;
                Caption = 'SO Qty. to Ship Edit';
                ToolTip = 'SO Qty. to Ship Edit';
                Visible = true;
            }
        }
    }
}