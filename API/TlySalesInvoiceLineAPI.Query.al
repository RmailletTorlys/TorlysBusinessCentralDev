Query 56015 TlySalesInvoiceLineAPI
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesInvoiceLine';
    EntitySetName = 'salesInvoiceLines';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(salesInvoiceLine; "Sales Invoice Line")
        {
            column(documentNumber; "Document No.") { }
            column(type; "Type") { }
            column(number; "No.") { }
            column(externalDocumentNumber; "External Document No.") { }
            column(creditMemoDate; "SystemCreatedAt") { }
            column(postingDate; "Posting Date") { }
            column(customerNumber; "Sell-to Customer No.") { }
            column(customerName; "Sell-to Customer Name") { }
            column(totalAmountExclTax; Amount) { }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code") { }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code") { }
            column(salesperson; "Salesperson Code") { }
            column(shipmentDate; "Shipment Date") { }

        }
    }
}