codeunit 50100 "Print Bill of Lading Document"
{


    procedure PrintBoLOrder(BoLHeader: Record "Torlys BoL Header"; Usage: Option "Bill of Lading Report")
    var
        ReportSelection: Record "Report Selection Warehouse";
        ReportUsage: Enum "Report Selection Warehouse Usage";


    begin

        ReportSelection.PrintDocuments(BoLHeader, ReportUsage::"Bill of Lading Report", true);

    end;



    // procedure GetBillOfLadingOrderUsage(Usage: Option "Bill of Lading Report") Result: Enum "Report Selection Usage"
    // var
    //     ReportSelections: Record "Report Selection Warehouse";
    // begin
    //     case Usage of
    //         Usage::"Bill of Lading Report":
    //             exit(ReportSelections.PrintDocuments());
    //     end;
    // end;
}