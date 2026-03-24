query 56007 "Torlys Item Inventory API"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'inventoryByLocation';
    EntitySetName = 'inventoryByLocations';

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Location Code" = filter('TOR|TMT|CAL');

            column(number; "Item No.") { }
            column(locationCode; "Location Code") { }
            column(inventory; Quantity)
            {
                Method = Sum;
            }
        }
    }
}