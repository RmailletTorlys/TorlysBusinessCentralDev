Query 56016 TlySalesLineAPI
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesLine';
    EntitySetName = 'salesLines';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Sales_Line; "Sales Line")
        {
            DataItemTableFilter = "Type" = filter('Item');

            column(number; "No.") { }
            column(type; "Type") { }
            column(genProdPostingGroup; "Gen. Prod. Posting Group") { }
            column(itemCategoryCode; "Item Category Code") { }
            column(salesPriceCode; "Sales Price Code") { }
            column(externalDocumentNumber; "External Document No.") { }
            column(orderDate; "Order Date") { }
            column(postingDate; "Posting Date") { }
            column(customerNumber; "Sell-to Customer No.") { }
            column(customerName; "Sell-to Customer Name") { }
            column(billToCustomerNumber; "Bill-to Customer No.") { }
            column(totalAmountExclTax; Amount) { }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code") { }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code") { }
            column(currencyCode; "Currency Code") { }
            column(salesperson; "Salesperson Code") { }
            column(requestedDeliveryDate; "Requested Delivery Date") { }
            column(shipmentDate; "Shipment Date") { }

        }
    }
}