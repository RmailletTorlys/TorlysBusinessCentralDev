page 50002 "Sales Price Code List"
{
    Caption = 'Sales Price Codes';
    PageType = List;
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
        area(Processing)
        {
            action(New)
            {
                Caption = 'New Sales Price Code';
                ToolTip = 'Create a new price code.';
                ApplicationArea = All;
                Image = New;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    PriceCode: Record "Torlys Sales Price Code";
                begin
                    PriceCode.Init();
                    if Page.RunModal(Page::"Sales Price Code List", PriceCode) = ACTION::OK then
                        PriceCode.Insert(true);
                end;
            }
        }
    }
}