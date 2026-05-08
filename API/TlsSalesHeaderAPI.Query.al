Query 56013 TlySalesHeaderAPI
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesHeader';
    EntitySetName = 'salesheaders';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(salesHeader; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = filter('Order');

            column(number; "No.") { }
            column(externalDocumentNumber; "External Document No.") { }
            column(orderDate; "Order Date") { }
            column(postingDate; "Posting Date") { }
            column(customerNumber; "Sell-to Customer No.") { }
            column(customerName; "Sell-to Customer Name") { }
            column(billToName; "Bill-to Name") { }
            column(billToCustomerNumber; "Bill-to Customer No.") { }
            column(shipToName; "Ship-to Name") { }
            column(shipToContact; "Ship-to Contact") { }
            column(sellToAddressLine1; "Sell-to Address") { }
            column(sellToAddressLine2; "Sell-to Address 2") { }
            column(sellToCity; "Sell-to City") { }
            column(sellToCountry; "Sell-to Country/Region Code") { }
            column(sellToState; "Sell-to County") { }
            column(sellToPostCode; "Sell-to Post Code") { }
            column(billToAddressLine1; "Bill-to Address") { }
            column(billToAddressLine2; "Bill-to Address 2") { }
            column(billToCity; "Bill-to City") { }
            column(billToCountry; "Bill-to Country/Region Code") { }
            column(billToState; "Bill-to County") { }
            column(billToPostCode; "Bill-to Post Code") { }
            column(shipToAddressLine1; "Ship-to Address") { }
            column(shipToAddressLine2; "Ship-to Address 2") { }
            column(shipToCity; "Ship-to City") { }
            column(shipToCountry; "Ship-to Country/Region Code") { }
            column(shipToState; "Ship-to County") { }
            column(totalAmountExclTax; Amount) { }
            column(shipToPostCode; "Ship-to Post Code") { }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code") { }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code") { }
            column(currencyCode; "Currency Code") { }
            column(salesperson; "Salesperson Code") { }
            column(requestedDeliveryDate; "Requested Delivery Date") { }
            column(status; "Status") { }
            column(shipmentDate; "Shipment Date") { }

        }
    }
}