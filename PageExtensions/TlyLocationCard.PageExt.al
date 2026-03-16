pageextension 55703 TlyLocationCard extends "Location Card"
{
    layout
    {
        addafter("Provincial Tax Area Code")
        {
            field("Sort Order"; Rec."Sort Order")
            {
                Caption = 'Sort Order';
                ToolTip = 'Sort Order';
                ApplicationArea = All;
            }
        }
    }
}