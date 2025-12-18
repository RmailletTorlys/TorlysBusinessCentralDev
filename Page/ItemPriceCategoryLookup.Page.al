page 51014 "Item Price Category Lookup"
{
    PageType = List;
    SourceTable = "Torlys Sales Price Code";
    Editable = false;
    Caption = 'Item Price Category';
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description';
                }
            }
        }
    }
}