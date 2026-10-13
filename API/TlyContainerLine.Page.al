page 50742 "tlyContainerLine"
{
    PageType = API;
    Caption = 'Container Head';
    APIPublisher = 'torlys';
    APIGroup = 'integrations';
    APIVersion = 'v1.0';
    EntityName = 'containerLine';
    EntitySetName = 'containerLines';
    SourceTable = "TPS CMG Container Line";
    DelayedInsert = true;
    ODataKeyFields = "Container No.";
    Editable = true;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(Id; Rec.SystemId) { Caption = 'Id'; Editable = false; }
                field(ContainerNo; Rec."Container No.") { }
                field(SourceType; Rec."Source Type") { }
                field(DocumentNo; Rec."Document No.") { }
                field(ItemNo; Rec."Item No.") { }
                field(ItemDescription; Rec."Item Description") { }
                field(Quantity; Rec.Quantity) { }
                field(UnitOfMeasure; Rec."Unit of Measure") { }
                field(Weight; Rec.Weight) { }
                field(Cube; Rec.Cube) { }
                field(OutstandingQuantity; Rec."Outstanding Quantity") { }
                field(QuantityShipped; Rec."Quantity Shipped") { }
                field(QuantityReceived; Rec."Quantity Received") { }
                field(QuantityBase; Rec."Quantity (Base)") { }
                field(OutstandingQuantityBase; Rec."Outstanding Qty. (Base)") { }
                field(SourceQuantity; Rec."Source Quantity") { }
                field(DocumentType; Rec."Document Type") { }
                field(LocationCode; Rec."Location Code") { }
                field(ExpectedShipmentDate; Rec."Expected Shipment Date") { }
                field(ActualShipmentDate; Rec."Actual Shipment Date") { }
                field(ExpectedReceiptDate; Rec."Expected Receipt Date") { }
                field(OriginalExpectedReceiptDate; Rec."Original Expected Receipt Date") { }
                field(ExpectedAtDischargePortDate; Rec."Expected at Disscharge Port") { }
                field(ActualReceiptDate; Rec."Actual Receipt Date") { }
                field(QtyToReceive; Rec."Qty. to Receive") { }
                field(QtyToShip; Rec."Qty. to Ship") { }
                field(PostingDate; Rec."Posting Date") { }
                field(BoLNo; Rec."BoL No.") { }
                field(VariantCode; Rec."Variant Code") { }
                field(UnitOfMeasureCode; Rec."Unit of Measure Code") { }
                field(TransferOrderNo; Rec."Transfer Order No.") { }
                field(TransferOrderLineNo; Rec."Transfer Order Line No.") { }

            }
        }
    }
}