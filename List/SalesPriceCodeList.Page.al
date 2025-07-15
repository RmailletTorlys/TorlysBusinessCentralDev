page 50002 "Sales Price Code List"
{
    Caption = 'Sales Price Codes';
    Editable = false;
    PageType = List;
    QueryCategory = 'Sales Price Code List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Torlys Sales Price Code";
    SourceTableView = SORTING(Code) ORDER(Ascending);
    CardPageId = "Torlys Sales Price Code Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code of the sales price.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the sales price.';
                }
                field(StartDate; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    ToolTip = 'Start date of the sales price.';
                }
                field(EndDate; Rec."End Date")
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                    ToolTip = 'End date of the sales price.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(New)
            {
                ApplicationArea = All;
                Caption = 'New';
                Image = New;
                ToolTip = 'Create a new sales price code.';
                RunObject = page "Torlys Sales Price Code Card";
            }
        }
    }
}