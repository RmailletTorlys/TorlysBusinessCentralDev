page 55020 "Claims Orders List"
{
    Caption = 'Claims Orders';
    PageType = List;
    CardPageId = "Claims Order Form";
    QueryCategory = 'Claims Orders';
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Claims Header";
    SourceTableView = SORTING("No.") ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique number of the claim.';
                }
                field("Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number associated with the claim.';
                }
                field("Order Date"; Rec."Original Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was placed.';
                }
            }
        }
    }
}