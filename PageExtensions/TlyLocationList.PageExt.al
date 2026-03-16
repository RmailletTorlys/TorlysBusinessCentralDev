pageextension 50015 TlyLocationList extends "Location List"
{
    layout
    {
        addafter("Name")
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