page 50743 "tlyContainerHead"
{
    PageType = API;
    Caption = 'Container Head';
    APIPublisher = 'torlys';
    APIGroup = 'integrations';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'containerHead';
    EntitySetName = 'containerHeads';
    SourceTable = "TPS CMG Container Header";
    DelayedInsert = true;
    ODataKeyFields = "No.";
    Editable = true;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(Id; Rec.SystemId) { Caption = 'Id'; Editable = false; }
                field(No; Rec."No.") { }
                field(Description; Rec.Description) { }
                field(PortOfLoading; Rec."Port of Loading") { }
                field(PortOfDischarge; Rec."Port of Discharge") { }
                field(VesselNo; Rec."Vessel No.") { }
                field(VoyageNo; Rec."Voyage No.") { }
                field(BookingNo; Rec."Booking No.") { }
                field(FDAStatus; Rec."FDA Status") { }
                field(ExpectedShipmentDate; Rec."Expected Shipment Date") { }
                field(ActualShipmentDate; Rec."Actual Shipment Date") { }
                field(ExpectedReceiptDate; Rec."Expected Receipt Date") { }
                field(ActualReceiptDate; Rec."Actual Receipt Date") { }
                field(OriginalExpectedReceiptDate; Rec."Original Expected Receipt Date") { }
                field(ExpectedAtDischargePortDate; Rec."Expected at Disscharge Port") { }
                field(InTransitReceivingRequired; Rec."In-Transit Receiving Required") { }
                field(LocationCode; Rec."Location Code") { }
                field(ContainerStatus; Rec."Status") { }
                field(ShippingAgentToPort; Rec."Shipping Agent to Port") { }
                field(ShippingAgentFromPort; Rec."Shipping Agent from Port") { }
                field(SCACCode; Rec."SCAC Code") { }
                field(TotalQty; Rec."Total Qty.") { }
                field(TotalWeight; Rec."Total Weight") { }
                field(TotalCube; Rec."Total Cube") { }
                field(Comments; Rec.Comments) { }
                field(DocumentDate; Rec."Document Date") { }
                field(ContainerType; Rec."Container Type") { }
                field(ContainerDescription; Rec."Container Description") { }
                field(PostingDate; Rec."Posting Date") { }
                field(BoLNo; Rec."BoL No.") { }
                field(ShipmentMethodCode; Rec."Shipment Method Code") { }
                field(ShippingStatus; Rec."Shipping Status") { }
                field(TPSFinalDestinationLocation; Rec."TPS Final Destination Location") { }
                field(ShipError; Rec."Ship Error") { }
                field(PortOfLoadingDate; Rec."Port of Loading Date") { }
                field(PortOfDischargeDate; Rec."Port of Discharge Date") { }
                field(InlandTerminal; Rec."Inland Terminal") { }
                field(InlandTerminalDate; Rec."Inland Terminal Date") { }
                field(PreviousETA; Rec."Previous ETA") { }
                field(SteamshipLine; Rec."Steamship Line") { }
                field(InsuranceCertificateNo; Rec."Insurance Certificate No.") { }
                field(FreightForwarder; Rec."Freight Forwarder") { }
                field(Crossdock; Rec."Crossdock") { }
                field(ERS; Rec.ERS) { }
                field(Urgent; Rec.Urgent) { }
                field(Strike; Rec.Strike) { }
                field(VendorNo; Rec."Vendor No.") { }
                field(DeliveryAppointmentDate; Rec."Delivery Appointment Date") { }
                field(FreightCost; Rec."Freight Cost") { }
                field(PremiumCost; Rec."Premium Cost") { }
                Field(ManufacturerCode; Rec."Manufacturer Code") { }
                field(AppointmentAtPort; Rec."Appointment At") { }
                field(ReceivedBy; Rec."Received By") { }
                field(ReceivedAt; Rec."Received At") { }
                field(TransportMethod; Rec."Transport Method") { }

                part(containerLines; "tlyContainerLine")
                {
                    Caption = 'Lines';
                    EntityName = 'containerLine';
                    EntitySetName = 'containerLines';
                    // Update field names according to your line table's schema:
                    SubPageLink = "Container No." = field("No.");
                }
            }
        }
    }



}
