query 56008 "Torlys Item In Transit API"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'itemTransit';
    EntitySetName = 'itemTransits';

    elements
    {
        dataitem(Transfer_Line; "Transfer Line")
        {
            DataItemTableFilter = "Qty. in Transit" = filter('>0');

            column(itemNo; "Item No.") { }
            column(locationCode; "Transfer-to Code") { }
            column(receiptDate; "Receipt Date") { }

            column(qtyInTransit; "Qty. in Transit")
            {
                Method = Sum;
            }
        }
    }
}
