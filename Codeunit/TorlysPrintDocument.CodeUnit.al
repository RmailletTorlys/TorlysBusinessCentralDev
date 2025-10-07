codeunit 50299 "Torlys Print Document"
{
    procedure PrintShippingLabel(var SalesHeader: Record "Sales Header"; Usage: Option "Sales Order Label"): Boolean
    var
        ReportSelection: Record "Report Selection Warehouse";
        ReportUsage: Enum "Report Selection Warehouse Usage";

    begin

        ReportSelection.PrintDocuments(SalesHeader, ReportUsage::"Sales Order Label", true);

    end;


    procedure PrintSummaryPick(Usage: Option "Summary Pick"): Boolean
    var
        SummaryPick: Report "Summary PickSlip";
    begin

        SummaryPick.UseRequestPage(true);
        SummaryPick.Run();

    end;

    procedure PrintSalesOrder(SalesHeader: Record "Sales Header"; Usage: Option "Order Confirmation","Work Order","Pick Instruction")
    var
        ReportSelection: Record "Report Selections";
        SalesOrder: Record "Sales Header";
        ReportUsage: Enum "Report Selection Usage";

    begin

        SalesOrder.SetRange("Document Type", SalesHeader."Document Type");
        SalesOrder.SetRange("No.", SalesHeader."No.");

        ReportUsage := GetSalesOrderUsage(Usage);
        ReportSelection.SetRange(Usage, ReportUsage);
        ReportSelection.Find('-');

        repeat
            Report.RunModal(ReportSelection."Report ID", false, false, SalesOrder);
        until ReportSelection.Next() = 0;
    end;

    procedure GetSalesOrderUsage(Usage: Option "Order Confirmation","Work Order","Pick Instruction") Result: Enum "Report Selection Usage"
    var
        ReportSelections: Record "Report Selections";
    begin
        case Usage of
            Usage::"Order Confirmation":
                exit(ReportSelections.Usage::"S.Order");
            Usage::"Work Order":
                exit(ReportSelections.Usage::"S.Work Order");
            Usage::"Pick Instruction":
                exit(ReportSelections.Usage::"S.Order Pick Instruction");
            else
                Error('');
        end;
    end;
}