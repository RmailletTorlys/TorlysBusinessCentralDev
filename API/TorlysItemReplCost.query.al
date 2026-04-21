query 56011 "Torlys Item Repl. Cost"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'itemReplacementCost';
    EntitySetName = 'itemsReplacementCosts';

    elements
    {
        dataitem(TlyReplacementCosts; TlyReplacementCosts)
        {
            column(vendorNo; "Vendor No.") { }
            column(itemNo; "Item No.") { }
            column(unitOfMeasureCode; "Unit of Measure Code") { }
            column(date; "Date") { }
            column(unitCostLCY; "Unit Cost (LCY)") { }

            dataitem(Item; Item)
            {

                DataItemLink = "No." = TlyReplacementCosts."Item No.";
                SqlJoinType = LeftOuterJoin;

                column(itemCategoryCode; "Sales Price Code") { }
            }
        }
    }
}