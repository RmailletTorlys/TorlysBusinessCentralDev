pageextension 50045 TorlysSalesCreditMemo extends "Sales Credit Memo"
{
    layout
    {
        addlast(General)
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = Dimensions;
                ToolTip = 'Freight Zone Code';
                Lookup = true;
                LookupPageId = "Freight Zone List";
            }
        }
    }
}