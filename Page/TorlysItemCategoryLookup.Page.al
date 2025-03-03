page 50305 "Torlys Item Category Lookup"
{
    PageType = List;
    SourceTable = "Item Category";
    Editable = false;
    Caption = 'Item Category';
    CardPageId = "Item Category Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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

                field("Display on Price List"; Rec."Display on Price Lists")
                {
                    ApplicationArea = All;
                    Caption = 'Display on Price List';
                    ToolTip = 'Display on Price List';
                }
            }
        }
    }
}