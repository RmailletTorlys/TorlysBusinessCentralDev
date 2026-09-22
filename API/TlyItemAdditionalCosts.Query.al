Query 56018 TlyItemAdditionalCosts
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'tlyItemAdditionalCosts';
    EntitySetName = 'tlyItemAdditionalCosts';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(TlyItemAdditionalCosts; "TlyItemAdditionalCosts")
        {
            column(itemCategoryCode; "Item Category Code") { }
            column(additionalCostType; "Additional Cost Type") { }
            column(startingDate; "Starting Date") { }
            column(endingDate; "Ending Date") { }
            column(unitOfMeasureCode; "Unit of Measure Code") { }
            column(costUnit; "Cost Unit") { }
            column(amount; "Amount") { }
            column(costingMethod; "Costing Method") { }
            column(remitToVendor; "Remit-to Vendor No.") { }
        }
    }
}