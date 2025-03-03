pageextension 50306 TorlysItemCategories extends "Item Categories"
{
    layout
    {
        addafter(Description)
        {
            field("Category Price Code"; Rec."Sales Price Code")
            {
                ApplicationArea = All;
                Caption = 'Category Price Code';
                ToolTip = 'Category Price Code';
            }
        }
    }


}