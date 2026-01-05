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

    local procedure "Code"()
    begin
        // custom to us - start
        if SalesHeader."No. Pick Slips Printed" = 0 then
            Error('You cannot ship this order as no pick slips have been printed!');

        if SalesHeader."Picked By" = '' then
            Error('The Warehouse Associate Picked By field cannot be blank!');

        if SalesHeader."Audited By" = '' then
            Error('The Warehouse Associate Checked By field cannot be blank!');

        if SalesHeader."Picked By" = SalesHeader."Audited By" THEN
            Error('The Picked By and the Checked By Associate cannot be the same!');
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
                    // Report.Run(ReportSelection."Report ID", false, false, SalesShptHeader);
                    Report.Run(ReportSelection."Report ID", true, false, SalesShptHeader); //changed to true so dont have to buy print management
                ReportSelection.Usage::"S.Ret.Rcpt.":
                    Report.Run(ReportSelection."Report ID", false, false, ReturnRcptHeader);
            end;
        until ReportSelection.Next() = 0;
    end;
}