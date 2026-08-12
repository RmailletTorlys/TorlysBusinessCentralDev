query 51063 "TlySalesShipmentLinesAPI"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesShipmentLineAPI';
    EntityCaption = 'Sales Shipment Line API';
    EntitySetCaption = 'Sales Shipment Lines API';
    EntitySetName = 'salesShipmentLines';
    AboutText = 'Provides access to detailed sales shipment line data, including shipped items, quantities, unit pricing, discounts, tax information, shipment dates, locations, and links to related sales and purchase documents. Enables external systems to retrieve and synchronize granular shipment information for warehouse management, packing list automation, customer service, and inventory reconciliation. Ideal for integrations requiring accurate tracking and reporting of shipped goods within Business Central, with support for GET operations only.';

    elements
    {
        dataitem(salesShipmentLine; "Sales Shipment Line")
        {
            column(documentId; "Document Id") { }
            column(documentNo; "Document No.") { }
            column(sequence; "Line No.") { }
            column(lineType; Type) { }
            column(lineObjectNumber; "No.") { }
            column(description; Description) { }
            column(description2; "Description 2") { }
            column(unitOfMeasureCode; "Unit of Measure Code") { }
            column(unitPrice; "Unit Price") { }
            column(quantity; Quantity) { }
            column(discountPercent; "Line Discount %") { }
            column(taxPercent; "VAT %") { }
            column(shipmentDate; "Shipment Date") { }
        }
    }
}