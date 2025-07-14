page 51002 "Sales Price Code Lookup"
{
    PageType = List;
    SourceTable = "Torlys Sales Price Code";
    Editable = false;
    Caption = 'Sales Price Code';
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