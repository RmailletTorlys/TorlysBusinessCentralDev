query 56009 "Torlys Items On Po API"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'itemPurchaseOrder';
    EntitySetName = 'itemPurchaseOrders';

    elements
    {
        dataitem(purchase_line; "Purchase Line")
        {
            DataItemTableFilter = "Quantity (Base)" = filter('>0');

            column(number; "No.") { }
            column(locationCode; "Location Code") { }
            column(receiptDate; "Shipment Date") { }

            column(qtyOnPo; "Quantity (Base)")
            {
                Method = Sum;
            }

        }
    }
}
