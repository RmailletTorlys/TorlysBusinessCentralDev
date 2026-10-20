pageextension 59748 TlyTPSCMGComments extends "TPS CMG Comments"
{
    layout
    {
        addfirst(General)
        {
            field("Type"; Rec."Type")
            {
                Caption = 'Type';
                ToolTip = 'Type';
                ApplicationArea = All;
                Editable = false;
            }
            field("Container No."; Rec."Container No.")
            {
                Caption = 'Container No.';
                ToolTip = 'Container No.';
                ApplicationArea = All;
                Editable = false;
            }
        }

        moveafter("Container No."; Date)
    }
}