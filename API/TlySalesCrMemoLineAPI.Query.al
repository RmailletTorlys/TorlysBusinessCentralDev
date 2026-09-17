Query 56014 TlySalesCrMemoLineAPI
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesCrMemoLine';
    EntitySetName = 'salesCrMemoLines';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(salesCrMemoLine; "Sales Cr.Memo Line")
        {
            column(documentNumber; "Document No.") { }
            column(type; "Type") { }
            column(number; "No.") { }
            column(description; Description) { }
            column(externalDocumentNumber; "External Document No.") { }
            column(creditMemoDate; "SystemCreatedAt") { }
            column(postingDate; "Posting Date") { }
            column(customerNumber; "Sell-to Customer No.") { }
            column(customerName; "Sell-to Customer Name") { }
            column(totalAmountExclTax; Amount) { }
            column(quantity; "Quantity (Base)") { }
            column(shortcutDimension1Code; "Shortcut Dimension 1 Code") { }
            column(shortcutDimension2Code; "Shortcut Dimension 2 Code") { }
            column(salesperson; "Salesperson Code") { }
            column(shipmentDate; "Shipment Date") { }

        }
    }
}