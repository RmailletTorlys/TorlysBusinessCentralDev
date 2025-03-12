page 51000 "CustomerSalesPriceListsLookup"
{
    PageType = List;
    SourceTable = "Price List Header";
    SourceTableView = where("Status" = const("Active"));
    Editable = false;
    Caption = 'Sales Price Lists';
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
