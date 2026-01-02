page 51011 "Torlys Sales Price Code Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = TlySalesPriceCode;
    Caption = 'Sales Price Code Card';
    Editable = true;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(Group)
            {
                Caption = 'General';
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code of the sales price.';
                }
                field(Description; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the sales price.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    ToolTip = 'Start date of the sales price.';
                }
                field("End Date"; Rec."End Date")
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
            action(Back)
            {
                ApplicationArea = All;
                Caption = 'Back';
                ToolTip = 'Return to the previous page.';
                RunObject = page TlySalesPriceCodeList;
                RunPageMode = Create;
                Image = Navigate;
            }
        }
    }
}