codeunit 50299 TlyDocumentPrint
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Print", 'OnBeforeProcessPrintSalesOrder', '', false, false)]
    local procedure OnBeforeProcessPrintSalesOrder(var SalesHeader: Record "Sales Header"; Usage: Option "Order Confirmation","Work Order","Pick Instruction"; var IsHandled: Boolean)
    var
        SalesLine: Record "Sales Line";
        Item: Record "Item";
        ReportSelection: Record "Report Selections";
    begin
        IsHandled := true;
        if Usage = 2 then begin
            // Message('this is the custom codeunit');
            // not allowed to print from 3 outside and receiving computers in warehouse
            // IF(ENVIRON(('COMPUTERNAME'))) = 'TOR-11WHSE01-DT' THEN
            // ERROR('Pick slip printing not allowed from this computer!');
            // IF(ENVIRON(('COMPUTERNAME'))) = 'TOR-11WHSE02-DT' THEN
            // ERROR('Pick slip printing not allowed from this computer!');
            // IF(ENVIRON(('COMPUTERNAME'))) = 'TOR-11WHSE04-DT' THEN
            // ERROR('Pick slip printing not allowed from this computer!');
            // IF(ENVIRON(('COMPUTERNAME'))) = 'TOR-11WHSE05-DT' THEN
            // ERROR('Pick slip printing not allowed from this computer!');

            //must be released
            if SalesHeader.Status <> SalesHeader.Status::Released then
                Error('Order must be released!');

            //must not be on credit hold
            if SalesHeader."On Hold" <> '' then
                Error('Order must not be on credit hold!');

            //shipment date must not be in past
            if SalesHeader."Shipment Date" < WorkDate() then
                Error('Shipment date must not be in the past!');

            //shipment date must not be on weekend
            if Date2DWY(SalesHeader."Shipment Date", 1) > 5 then
                Error('Shipment date must not be on the weekend!');

            //shipment date must not be too far in the future   
            if (Date2DWY(WorkDate(), 1) < 5) AND (SalesHeader."Shipment Date" - WorkDate() > 1) then //weekday print 1 day in advance
                Error('Shipment date is too far in the future!')
            else
                if (Date2DWY(WorkDate(), 1) = 5) AND (SalesHeader."Shipment Date" - WorkDate() > 3) then //Friday print 3 days in advance
                    Error('Shipment date is too far in the future!');

            //must have something allocated
            SalesHeader.CalcFields("Qty. to Ship");
            if SalesHeader."Qty. to Ship" < 1 then
                Error('Order is not allocated!');

            //if not fully allocated and not marked partial, can't print (NEW)
            SalesHeader.CalcFields("Outstanding Quantity", "Qty. to Ship");
            if (SalesHeader."Outstanding Quantity" <> SalesHeader."Qty. to Ship") and (SalesHeader."Shipping Advice" = SalesHeader."Shipping Advice"::Complete) then
                Error('Order is not fully allocated and not marked partial!');

            //must have inventory before printing
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetFilter(Type, 'Item');
            SalesLine.SetFilter("Qty. to Ship", '>0');
            if SalesLine.Find('-') then
                repeat
                    Item.Reset();
                    Item.Get(SalesLine."No.");
                    Item.SetFilter("Location Filter", SalesLine."Location Code");
                    Item.CalcFields(Inventory);
                    IF SalesLine."Qty. to Ship" > Item.Inventory THEN
                        Error('There is not enough inventory of %1 in %2.\Allocated quantity = %3.\NAV on hand = %4.\Please contact purchasing!',
                                Item."No.", SalesLine."Location Code", SalesLine."Qty. to Ship", Item.Inventory);
                until SalesLine.Next() = 0;

            //location code on header must be same on all lines
            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetFilter("Qty. to Ship", '>0');
            if SalesLine.Find('-') then
                repeat
                    if SalesLine."Location Code" <> SalesHeader."Location Code" then
                        Error('Location on header (%1) is differnet than a line (%2, %3)!', SalesHeader."Location Code", SalesLine."Location Code", SalesLine."No.");
                until SalesLine.Next() = 0;

            //popup if already printed
            if SalesHeader."No. Pick Slips Printed" > 0 then
                Message('%1 pick slip has already been printed %2 time(s).', SalesHeader."No.", SalesHeader."No. Pick Slips Printed");

            //pass parameters and print
            SalesHeader.SetRange("No.", SalesHeader."No.");
            SalesHeader.SetRange("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
            SalesHeader.SetRange("Ship-to Code", SalesHeader."Ship-to Code");
            SalesHeader.SetRange("Shipment Date", SalesHeader."Shipment Date");
            SalesHeader.SetRange("Shipping Agent Code", SalesHeader."Shipping Agent Code");
            // SalesHeader.SetRange("No. Pick Slips Printed", 0);
            ReportSelection.SetRange(Usage, ReportSelection.Usage::"S.Order Pick Instruction");
            ReportSelection.SetFilter("Report ID", '<>0');
            ReportSelection.Find('-');
            repeat
                Report.RunModal(ReportSelection."Report ID", true, false, SalesHeader)
            until ReportSelection.Next() = 0;
        end else begin
            SalesHeader.SetRange("No.", SalesHeader."No.");
            ReportSelection.SetRange(Usage, ReportSelection.Usage::"S.Order");
            ReportSelection.SetFilter("Report ID", '<>0');
            ReportSelection.Find('-');
            repeat
                Report.RunModal(ReportSelection."Report ID", true, false, SalesHeader)
            until ReportSelection.Next() = 0;
        end;
    end;

    procedure PrintSummaryPickSlip(SalesHeader: Record "Sales Header"): Boolean
    var
    // ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        SalesHeader.SetRange("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
        SalesHeader.SetRange("Ship-to Code", SalesHeader."Ship-to Code");
        SalesHeader.SetRange("Shipment Date", SalesHeader."Shipment Date");
        SalesHeader.SetRange("Location Code", SalesHeader."Location Code");
        SalesHeader.SetRange("Shipping Agent Code", SalesHeader."Shipping Agent Code");
        Report.RunModal(50021, true, false, SalesHeader);
        // SalesHeader.SetRange("No. Pick Slips Printed", 0);
        // ReportSelectionWhse.SetRange(Usage, ReportSelectionWhse.Usage::"Summary Pick Slip");
        // ReportSelectionWhse.SetFilter("Report ID", '<>0');
        // ReportSelectionWhse.Find('-');
        // repeat
        // Report.RunModal(ReportSelectionWhse."Report ID", true, false, SalesHeader)
        // until ReportSelectionWhse.Next() = 0;
    end;

    procedure PrintBillOfLading(BOLHeader: Record TlyBillOfLadingHeader): Boolean
    var
    // ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        BOLHeader.SetRange("No.", BOLHeader."No.");
        Report.RunModal(50008, true, false, BOLHeader);
        // ReportSelectionWhse.SetRange(Usage, ReportSelectionWhse.Usage::"Bill of Lading");
        // ReportSelectionWhse.SetFilter("Report ID", '<>0');
        // ReportSelectionWhse.Find('-');
        // repeat
        // Report.RunModal(ReportSelectionWhse."Report ID", true, false, BOLHeader);
        // until ReportSelectionWhse.Next() = 0;
    end;

    procedure PrintBOLShippingLabel(BOLHeader: Record TlyBillOfLadingHeader): Boolean
    begin
        BOLHeader.SetRange("No.", BOLHeader."No.");
        Report.RunModal(50010, true, false, BOLHeader);
    end;

    procedure PrintProcessedBillOfLading(ProcessedBOLHeader: Record TlyProcessedBillOfLadingHeader): Boolean
    var
    // ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        ProcessedBOLHeader.SetRange("No.", ProcessedBOLHeader."No.");
        Report.RunModal(50009, true, false, ProcessedBOLHeader);
        // ReportSelectionWhse.SetRange(Usage, ReportSelectionWhse.Usage::"Processed Bill of Lading");
        // ReportSelectionWhse.SetFilter("Report ID", '<>0');
        // ReportSelectionWhse.Find('-');
        // repeat
        // Report.RunModal(ReportSelectionWhse."Report ID", true, false, ProcessedBOLHeader);
        // until ReportSelectionWhse.Next() = 0;
    end;

    procedure PrintCarrierManifest(ProcessedBOLHeader: Record TlyProcessedBillOfLadingHeader): Boolean
    begin
        ProcessedBOLHeader.SetRange("Shipping Agent Code", ProcessedBOLHeader."Shipping Agent Code");
        ProcessedBOLHeader.SetRange("Pickup Date", ProcessedBOLHeader."Pickup Date");
        ProcessedBOLHeader.SetRange("Location Code", ProcessedBOLHeader."Location Code");
        Report.RunModal(50013, true, false, ProcessedBOLHeader);
    end;

    procedure PrintB13SalesFromSO(SalesHeader: Record "Sales Header"): Boolean
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        Report.RunModal(50023, true, false, SalesLine)
    end;

    procedure PrintB13PurchaseFromSO(SalesHeader: Record "Sales Header"): Boolean
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        Report.RunModal(50020, true, false, SalesLine)
    end;

    procedure PrintB13SalesFromInvoice(SalesInvHeader: Record "Sales Invoice Header"): Boolean
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        Report.RunModal(50028, true, false, SalesInvLine)
    end;

    procedure PrintB13PurchaseFromInvoice(SalesInvHeader: Record "Sales Invoice Header"): Boolean
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        Report.RunModal(50029, true, false, SalesInvLine)
    end;

    //     procedure PrintProformaFromInvoice(SalesInvHeader: Record "Sales Invoice Header"): Boolean
    // begin
    //     SalesInvHeader.SetRange("No.", SalesInvHeader."No.");
    //     Report.RunModal(, true, false, SalesInvHeader)
    // end;

    procedure PrintReceivingPO(BookingInfo: Record TlyBookingInfo): Boolean
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.SetRange("Booking No.", BookingInfo."No.");
        Report.RunModal(50025, true, false, PurchaseLine);
    end;

    procedure PrintReceivingTransfer(BookingInfo: Record TlyBookingInfo): Boolean
    var
        TransferHeader: Record "Transfer Header";
    begin
        TransferHeader.SetRange("Booking No.", BookingInfo."No.");
        Report.RunModal(50019, true, false, TransferHeader);
    end;

    procedure PrintSummaryPickSlipTransfer(TransferHeader: Record "Transfer Header"): Boolean
    begin
        TransferHeader.SetRange("No.", TransferHeader."No.");
        TransferHeader.SetRange("Transfer-from Code", TransferHeader."Transfer-from Code");
        TransferHeader.SetRange("Transfer-to Code", TransferHeader."Transfer-to Code");
        TransferHeader.SetRange("Shipment Date", TransferHeader."Shipment Date");
        Report.RunModal(50007, true, false, TransferHeader)
    end;

    procedure PrintTransferLabel(TransferHeader: Record "Transfer Header"): Boolean
    begin
        TransferHeader.SetRange("No.", TransferHeader."No.");
        Report.RunModal(50027, true, false, TransferHeader)
    end;

    // v1
    // this from when we printed after each order was posted
    // then decided to change to v2
    // procedure PrintShipmentLabel(SalesShptHeader: Record "Sales Shipment Header"): Boolean
    // begin
    //     SalesShptHeader.SetRange("No.", SalesShptHeader."No.");
    //     Report.RunModal(10078, true, false, SalesShptHeader);
    // end;

    // v2
    // this is from when we printed it after all orders were posted is multiple
    // then decided to change to v2
    // procedure PrintShipmentLabel(SalesHeader: Record "Sales Header"): Boolean
    // var
    //     SalesShptHeader: Record "Sales Shipment Header";
    // begin
    //     SalesShptHeader.SetRange("No.", SalesHeader."Last Shipping No.");
    //     Report.RunModal(10078, true, false, SalesShptHeader);
    // end;

    // v3
    // this always existed, but now we modified and print after SH posts, therefore have 1 label if before post or after post
    // this just wont let you print after invoiced as order will be deleted, but that is once in a blue moom
    procedure PrintSalesOrderLabel(SalesHeader: Record "Sales Header"): Boolean
    var
    // ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        SalesHeader.SetRange("No.", SalesHeader."No.");
        Report.RunModal(50005, true, false, SalesHeader);
        // ReportSelectionWhse.SetRange(Usage, ReportSelectionWhse.Usage::"Sales Order Label");
        // ReportSelectionWhse.SetFilter("Report ID", '<>0');
        // ReportSelectionWhse.Find('-');
        // repeat
        // Report.RunModal(ReportSelectionWhse."Report ID", true, false, SalesHeader)
        // until ReportSelectionWhse.Next() = 0;
    end;
}