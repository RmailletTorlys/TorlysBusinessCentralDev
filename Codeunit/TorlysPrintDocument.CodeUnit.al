codeunit 50299 "Torlys Print Document"
{
    // procedure PrintShippingLabel(var SalesHeader: Record "Sales Header"; Usage: Option "Sales Order Label"): Boolean
    // var
    //     ReportSelection: Record "Report Selection Warehouse";
    //     ReportUsage: Enum "Report Selection Warehouse Usage";

    // begin

    //     ReportSelection.PrintDocuments(SalesHeader, ReportUsage::"Sales Order Label", true);

    // end;

    procedure PrintPickSlip(SalesHeader: Record "Sales Header"): Boolean
    var
        ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        SalesHeader.SetRange("No.", SalesHeader."No.");
        SalesHeader.SetRange("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
        SalesHeader.SetRange("Ship-to Code", SalesHeader."Ship-to Code");
        SalesHeader.SetRange("Shipment Date", SalesHeader."Shipment Date");
        SalesHeader.SetRange("Shipping Agent Code", SalesHeader."Shipping Agent Code");
        SalesHeader.SetRange("No. Pick Slips Printed", 0);
        ReportSelectionWhse.SETRANGE(Usage, ReportSelectionWhse.Usage::"Pick Slip");
        ReportSelectionWhse.SETFILTER("Report ID", '<>0');
        ReportSelectionWhse.FIND('-');
        REPEAT
            REPORT.RUNMODAL(ReportSelectionWhse."Report ID", TRUE, FALSE, SalesHeader)
        UNTIL ReportSelectionWhse.NEXT = 0;
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
        UNTIL ReportSelectionWhse.NEXT = 0;
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
        UNTIL ReportSelectionWhse.NEXT = 0;
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
        UNTIL ReportSelectionWhse.NEXT = 0;
    end;

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