codeunit 50299 "Torlys Print Document"
{
    procedure PrintShippingLabel(var SalesHeader: Record "Sales Header"; Usage: Option "Sales Order Label"): Boolean
    var
        ReportSelection: Record "Report Selection Warehouse";
        ReportUsage: Enum "Report Selection Warehouse Usage";

    begin

        ReportSelection.PrintDocuments(SalesHeader, ReportUsage::"Sales Order Label", true);

    end;



}