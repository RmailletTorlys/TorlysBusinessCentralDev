query 56021 "TlySalesShipmentsLine"
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'salesShipmentsLine';
    EntitySetName = 'salesShipmentsLines';

    elements
    {
        dataitem(Sales_Shipment_Line; "Sales Shipment Line")
        {
            column(number; "No.") { }
            column(documentNo; "Document No.") { }
            column(type; Type) { }
            column(locationCode; "Location Code") { }
            column(unitOfMeasureCode; "Unit of Measure Code") { }
            column(quantity; Quantity) { }
            column(shipmentDate; "Shipment Date") { }
            column(qtyShippedNotInvoiced; "Qty. Shipped Not Invoiced") { }
            column(quantityInvoiced; "Quantity Invoiced") { }
            


        }
    }
}