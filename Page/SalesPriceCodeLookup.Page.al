page 51010 "Sales Price Code Lookup"
{
    PageType = List;
    SourceTable = "Torlys Sales Price Code";
    Editable = false;
    Caption = 'Sales Price Code';
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