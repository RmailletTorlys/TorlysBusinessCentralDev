page 52003 TlySalesPriceCodeList
{
    ApplicationArea = Basic, Suite;
    Caption = 'Sales Price Codes';
    PageType = List;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = TlySalesPriceCode;
    SourceTableView = SORTING(Code) ORDER(Ascending);
    UsageCategory = Administration;
    InsertAllowed = true;

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
                field("Regular Price"; Rec."Regular Price")
                {
                    ApplicationArea = All;
                    Caption = 'Regular Price';
                    ToolTip = 'Regular Price';
                }
                field("Price List Order"; Rec."Price List Order")
                {
                    ApplicationArea = All;
                    Caption = 'Price List Order';
                    ToolTip = 'Price List Order';
                }
            }
        }
    }

    views
    {
        view(PriceListOrder)
        {
            Caption = 'Price List Order';
            Filters = where("Price List Order" = filter('<>0'));
            OrderBy = ascending("Price List Order");
        }
    }
}