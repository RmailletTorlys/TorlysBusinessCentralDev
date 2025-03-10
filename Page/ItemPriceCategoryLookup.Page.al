page 50305 "Item Price Category Lookup"
{
    PageType = List;
    SourceTable = "Item Category";
    Editable = false;
    Caption = 'Item Category';
    ApplicationArea = All;


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

                field("Description"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description';
                }

                field("Sales Price Code"; Rec."Sales Price Code")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Price Code';
                    ToolTip = 'Sales Price Code';
                }
            }
        }
    }
}