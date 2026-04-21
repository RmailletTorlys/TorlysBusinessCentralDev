query 56010 "TorlysItemsTransferOrderAPI"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'itemTransferOrder';
    EntitySetName = 'itemTransferOrders';

    elements
    {
        dataitem(Transfer_Line; "Transfer Line")
        {
            DataItemTableFilter = "Qty. to Ship (Base)" = filter('>0');

            column(number; "Item No.") { }
            column(locationCode; "Transfer-From Code") { }
            column(qtyToShipTransfer; "Qty. to Ship (Base)")
            {
                Method = Sum;
            }
        }
    }
}
