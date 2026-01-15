page 52003 TlySalesPriceCodeList
{
    ApplicationArea = Basic, Suite;
    Caption = 'Sales Price Codes';
    // CardPageID = "Torlys Sales Price Code Card";
    InsertAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = TlySalesPriceCode;
    SourceTableView = SORTING(Code) ORDER(Ascending);
    UsageCategory = Administration;

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
                // field(StartDate; Rec."Start Date")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Start Date';
                //     ToolTip = 'Start date of the sales price.';
                // }
                // field(EndDate; Rec."End Date")
                // {
                //     ApplicationArea = All;
                //     Caption = 'End Date';
                //     ToolTip = 'End date of the sales price.';
                // }
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
                PromotedOnly = true;
                trigger OnAction()
                var
                    PriceCode: Record TlySalesPriceCode;
                begin
                    PriceCode.Init();
                    if Page.RunModal(Page::TlySalesPriceCodeList, PriceCode) = ACTION::OK then
                        PriceCode.Insert(true);
                end;
            }
        }
    }
}