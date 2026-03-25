query 56005 "Torlys Items API"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'item';
    EntitySetName = 'items';

    elements
    {
        dataitem(Item; Item)
        {
            DataItemTableFilter = "Gen. Prod. Posting Group" = filter('<>MK *');

            column(number; "No.") { }
            column(displayName; Description) { }
            column(itemCategoryCode; "Item Category Code") { }
            column(currentItem; "Current Item") { }
            column(sunsetItem; "Sunset Item") { }
            column(discontinuedItem; "Discontinued Item") { }
            column(newItem; "New Item") { }
            column(unitPrice; "Unit Price") { }
            column(clearanceItem; "Clearance Item") { }
            column(onHandTOR; "Qty. on Hand (TOR)") { }
            column(onHandTMT; "Qty. on Hand (TMT)") { }
            column(onHandCAL; "Qty. on Hand (CAL)") { }
        }
    }
}