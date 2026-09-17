pageextension 50019 TlyGLEntriesPart extends "G/L Entries Part"
{
    layout
    {
        addafter(Amt)
        {
            field("Channel"; Rec."Shortcut Dimension 3 Code")
            {
                Caption = 'Channel';
                ToolTip = 'Channel';
                ApplicationArea = All;
            }
        }
    }
}