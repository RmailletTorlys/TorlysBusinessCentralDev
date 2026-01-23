query 50004 "Item Category Avg Cost"
{
    QueryType = Normal;
    Caption = 'Average Unit Cost by Category';

    elements
    {
        dataitem(Item; Item)
        {
            DataItemTableFilter = "Discontinued Item" = CONST(false);
            // This column defines the grouping
            column(Sales_Price_Code; "Sales Price Code")
            {
                Caption = 'Item Category';
            }

            // This column performs the calculation
            column(Average_Unit_Cost; "Unit Cost")
            {
                Method = Average;
                Caption = 'Average Unit Cost';
            }
        }
    }
}