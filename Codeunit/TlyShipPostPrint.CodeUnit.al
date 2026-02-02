codeunit 50012 TlyShipPostPrint
{
    TableNo = "Sales Header";

    trigger OnRun()
    begin
        SalesHeader.Copy(Rec);
        Code();
        Rec := SalesHeader;
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesShptHeader: Record "Sales Shipment Header";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        ReturnRcptHeader: Record "Return Receipt Header";
        ReportSelection: Record "Report Selections";
        SalesPost: Codeunit "Sales-Post";
        Text1020001: Label 'Do you want to ship and print %1 for customer %2?';
        InsertFreightLine: Codeunit TlyInsertFreightLine;
        TorlysDocPrint: Codeunit TlyDocumentPrint;

    local procedure "Code"()
    begin
        // custom to us - start
        if SalesHeader."No. Pick Slips Printed" = 0 then
            Error('You cannot ship this order as no pick slips have been printed!');

        if SalesHeader."Picked By" = '' then
            Error('The Picked By associate cannot be blank!');

        if SalesHeader."Audited By" = '' then
            Error('The Checked By associate cannot be blank!');

        if SalesHeader."Picked By" = SalesHeader."Audited By" THEN
            Error('The Picked By and Checked By associate cannot be the same!');
        // custom to us - end

        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if not Confirm(Text1020001, false, SalesHeader."No.", SalesHeader."Sell-to Customer No.") then begin
                SalesHeader."Shipping No." := '-1';
                exit;
            end;
            SalesHeader.Ship := true;
            SalesHeader.Invoice := false;

            // custom to us - start
            // need to open order to add freight line
            // moved to the Freight CU, because if the order fails to post for any reason it remains open
            // but can't get it to work, so leave here for now
            SalesHeader.Status := SalesHeader.Status::Open;
            SalesHeader.Modify(true);
            // codeunit to add freight line
            InsertFreightLine.SHposting(SalesHeader);
            // custom to us - end

            SalesPost.Run(SalesHeader);

            SalesShptHeader."No." := SalesHeader."Last Shipping No.";
            SalesShptHeader.SetRecFilter();
            PrintReport(ReportSelection.Usage::"S.Shipment");

            // need the label to print via own function, can't use report selection list due to differnet printer defaults
            // TorlysDocPrint.PrintShipmentLabel(SalesShptHeader);
            // moved this to the shipping screen as to only get 1 label if printing multiple orders and change to always print SO label
        end;
    end;

    local procedure PrintReport(ReportUsage: Enum "Report Selection Usage")
    begin
        ReportSelection.Reset();
        ReportSelection.SetRange(Usage, ReportUsage);
        ReportSelection.Find('-');
        repeat
            ReportSelection.TestField("Report ID");
            case ReportUsage of
                ReportSelection.Usage::"S.Invoice":
                    Report.Run(ReportSelection."Report ID", false, false, SalesInvHeader);
                ReportSelection.Usage::"S.Cr.Memo":
                    Report.Run(ReportSelection."Report ID", false, false, SalesCrMemoHeader);
                ReportSelection.Usage::"S.Shipment":
                    Report.Run(ReportSelection."Report ID", false, false, SalesShptHeader); // no longer present printer popup
                                                                                            // Report.Run(ReportSelection."Report ID", true, false, SalesShptHeader); // for start of go live, want to present printer popup to be sure
                ReportSelection.Usage::"S.Ret.Rcpt.":
                    Report.Run(ReportSelection."Report ID", false, false, ReturnRcptHeader);
            end;
        until ReportSelection.Next() = 0;
    end;
}