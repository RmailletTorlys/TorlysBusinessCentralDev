query 56006 "Torlys Item Sales Order API"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'itemSalesOrder';
    EntitySetName = 'itemSalesOrders';

    elements
    {
        dataitem(Sales_Line; "Sales Line")
        {
            DataItemTableFilter = "Qty. to Ship (Base)" = filter('>0');

            column(number; "No.") { }
            column(locationCode; "Location Code") { }
            column(qtyOnSalesOrder; "Outstanding Quantity")
            {
                Method = Sum;
            }
            column(qtyToShip; "Qty. to Ship (Base)")
            {
                Method = Sum;
            }
        }
    }
}
