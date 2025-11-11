codeunit 50299 TorlysDocumentPrint
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
            Message('this is the custom codeunit');
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
            IF SalesHeader.Status <> SalesHeader.Status::Released THEN
                ERROR('Order must be released!');

            //must not be on credit hold
            IF SalesHeader."On Hold" <> '' THEN
                ERROR('Order must not be on credit hold!');

            //shipment date must not be in past
            IF SalesHeader."Shipment Date" < WORKDATE() THEN
                ERROR('Shipment date must not be in the past!');

            //shipment date must not be on weekend
            IF DATE2DWY(SalesHeader."Shipment Date", 1) > 5 THEN
                ERROR('Shipment date must not be on the weekend!');

            //shipment date must not be too far in the future   
            IF (DATE2DWY(WORKDATE(), 1) < 5) AND (SalesHeader."Shipment Date" - WORKDATE() > 1) THEN //weekday print 1 day in advance
                ERROR('Shipment date is too far in the future!')
            ELSE
                IF (DATE2DWY(WORKDATE(), 1) = 5) AND (SalesHeader."Shipment Date" - WORKDATE() > 3) THEN //Friday print 3 days in advance
                    ERROR('Shipment date is too far in the future!');

            //must have something allocated
            SalesHeader.CALCFIELDS("Qty. to Ship");
            IF SalesHeader."Qty. to Ship" < 1 THEN
                ERROR('Order is not allocated!');

            //if not fully allocated and not marked partial, can't print (NEW)
            SalesHeader.CALCFIELDS("Outstanding Quantity", "Qty. to Ship");
            IF (SalesHeader."Outstanding Quantity" <> SalesHeader."Qty. to Ship") AND (SalesHeader."Shipping Advice" = SalesHeader."Shipping Advice"::Complete) THEN
                ERROR('Order is not fully allocated and not marked partial!');

            //must have inventory before printing
            SalesLine.RESET();
            SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
            SalesLine.SETRANGE("Document No.", SalesHeader."No.");
            SalesLine.SETFILTER(Type, 'Item');
            SalesLine.SETFILTER("Qty. to Ship", '>0');
            IF SalesLine.FIND('-') THEN
                REPEAT
                    Item.RESET();
                    Item.GET(SalesLine."No.");
                    Item.SETFILTER("Location Filter", SalesLine."Location Code");
                    Item.CALCFIELDS(Inventory);
                    IF SalesLine."Qty. to Ship" > Item.Inventory THEN
                        ERROR('There is not enough inventory of %1 in %2.\Allocated quantity = %3.\NAV on hand = %4.\Please contact purchasing!',
                                Item."No.", SalesLine."Location Code", SalesLine."Qty. to Ship", Item.Inventory);
                UNTIL SalesLine.NEXT() = 0;

            //location code on header must be same on all lines
            SalesLine.RESET();
            SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
            SalesLine.SETRANGE("Document No.", SalesHeader."No.");
            SalesLine.SETFILTER("Qty. to Ship", '>0');
            IF SalesLine.FIND('-') THEN
                REPEAT
                    IF SalesLine."Location Code" <> SalesHeader."Location Code" THEN
                        ERROR('Location on header (%1) is differnet than a line (%2, %3)!', SalesHeader."Location Code", SalesLine."Location Code", SalesLine."No.");
                UNTIL SalesLine.NEXT() = 0;


            //pass parameters and print
            SalesHeader.SetRange("No.", SalesHeader."No.");
            SalesHeader.SetRange("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
            SalesHeader.SetRange("Ship-to Code", SalesHeader."Ship-to Code");
            SalesHeader.SetRange("Shipment Date", SalesHeader."Shipment Date");
            SalesHeader.SetRange("Shipping Agent Code", SalesHeader."Shipping Agent Code");
            // SalesHeader.SetRange("No. Pick Slips Printed", 0);
            ReportSelection.SETRANGE(Usage, ReportSelection.Usage::"S.Order Pick Instruction");
            ReportSelection.SETFILTER("Report ID", '<>0');
            ReportSelection.FIND('-');
            REPEAT
                REPORT.RUNMODAL(ReportSelection."Report ID", TRUE, FALSE, SalesHeader)
            UNTIL ReportSelection.NEXT() = 0;
        end else begin
            SalesHeader.SetRange("No.", SalesHeader."No.");
            ReportSelection.SETRANGE(Usage, ReportSelection.Usage::"S.Order");
            ReportSelection.SETFILTER("Report ID", '<>0');
            ReportSelection.FIND('-');
            REPEAT
                REPORT.RUNMODAL(ReportSelection."Report ID", TRUE, FALSE, SalesHeader)
            UNTIL ReportSelection.NEXT() = 0;
        end;
    end;

    procedure PrintSummaryPickSlip(SalesHeader: Record "Sales Header"): Boolean
    var
        ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        SalesHeader.SETRANGE("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
        SalesHeader.SETRANGE("Ship-to Code", SalesHeader."Ship-to Code");
        SalesHeader.SETRANGE("Shipment Date", SalesHeader."Shipment Date");
        SalesHeader.SETRANGE("Location Code", SalesHeader."Location Code");
        SalesHeader.SETRANGE("Shipping Agent Code", SalesHeader."Shipping Agent Code");
        // SalesHeader.SETRANGE("No. Pick Slips Printed", 0);
        ReportSelectionWhse.SETRANGE(Usage, ReportSelectionWhse.Usage::"Summary Pick Slip");
        ReportSelectionWhse.SETFILTER("Report ID", '<>0');
        ReportSelectionWhse.FIND('-');
        REPEAT
            REPORT.RUNMODAL(ReportSelectionWhse."Report ID", TRUE, FALSE, SalesHeader)
        UNTIL ReportSelectionWhse.NEXT() = 0;
    end;

    procedure PrintSalesOrderLabel(SalesHeader: Record "Sales Header"): Boolean
    var
        ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        SalesHeader.SetRange("No.", SalesHeader."No.");
        ReportSelectionWhse.SETRANGE(Usage, ReportSelectionWhse.Usage::"Sales Order Label");
        ReportSelectionWhse.SETFILTER("Report ID", '<>0');
        ReportSelectionWhse.FIND('-');
        REPEAT
            REPORT.RUNMODAL(ReportSelectionWhse."Report ID", TRUE, FALSE, SalesHeader)
        UNTIL ReportSelectionWhse.NEXT() = 0;
    end;

    procedure PrintBillOfLading(BOLHeader: Record "Torlys BOL Header"): Boolean
    var
        ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        BOLHeader.SETRANGE("No.", BOLHeader."No.");
        ReportSelectionWhse.SETRANGE(Usage, ReportSelectionWhse.Usage::"Bill of Lading");
        ReportSelectionWhse.SETFILTER("Report ID", '<>0');
        ReportSelectionWhse.FIND('-');
        REPEAT
            REPORT.RUNMODAL(ReportSelectionWhse."Report ID", TRUE, FALSE, BOLHeader);
        UNTIL ReportSelectionWhse.NEXT() = 0;
    end;

    procedure PrintProcessedBillOfLading(ProcessedBOLHeader: Record "Torlys Processed BOL Header"): Boolean
    var
        ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        ProcessedBOLHeader.SETRANGE("No.", ProcessedBOLHeader."No.");
        ReportSelectionWhse.SETRANGE(Usage, ReportSelectionWhse.Usage::"Processed Bill of Lading");
        ReportSelectionWhse.SETFILTER("Report ID", '<>0');
        ReportSelectionWhse.FIND('-');
        REPEAT
            REPORT.RUNMODAL(ReportSelectionWhse."Report ID", TRUE, FALSE, ProcessedBOLHeader);
        UNTIL ReportSelectionWhse.NEXT() = 0;
    end;

    // procedure PrintB13Sales(SalesLine: Record "Sales Line"): Boolean
    // var
    //     ReportSelection: Record "Report Selections";
    // begin
    //     SalesLine.SETRANGE("Document No.", SalesLine."Document No.");
    //     // SalesHeader.SETRANGE("No. Pick Slips Printed", 0);
    //     // ReportSelection.SETRANGE(Usage, ReportSelection.Usage::"B13 Sales");
    //     // ReportSelection.SETFILTER("Report ID", '<>0');
    //     // ReportSelection.FIND('-');
    //     // REPEAT
    //     REPORT.RUNMODAL(50023, TRUE, FALSE, SalesLine)
    //     // UNTIL ReportSelection.NEXT() = 0;
    // end;

    // procedure PrintSalesOrder(SalesHeader: Record "Sales Header"; Usage: Option "Order Confirmation","Work Order","Pick Instruction")
    // var
    //     ReportSelection: Record "Report Selections";
    //     SalesOrder: Record "Sales Header";
    //     ReportUsage: Enum "Report Selection Usage";

    // begin

    //     SalesOrder.SetRange("Document Type", SalesHeader."Document Type");
    //     SalesOrder.SetRange("No.", SalesHeader."No.");

    //     ReportUsage := GetSalesOrderUsage(Usage);
    //     ReportSelection.SetRange(Usage, ReportUsage);
    //     ReportSelection.Find('-');

    //     repeat
    //         Report.RunModal(ReportSelection."Report ID", false, false, SalesOrder);
    //     until ReportSelection.Next() = 0;
    // end;

    // procedure GetSalesOrderUsage(Usage: Option "Order Confirmation","Work Order","Pick Instruction") Result: Enum "Report Selection Usage"
    // var
    //     ReportSelections: Record "Report Selections";
    // begin
    //     case Usage of
    //         Usage::"Order Confirmation":
    //             exit(ReportSelections.Usage::"S.Order");
    //         Usage::"Work Order":
    //             exit(ReportSelections.Usage::"S.Work Order");
    //         Usage::"Pick Instruction":
    //             exit(ReportSelections.Usage::"S.Order Pick Instruction");
    //         else
    //             Error('');
    //     end;
    // end;
}