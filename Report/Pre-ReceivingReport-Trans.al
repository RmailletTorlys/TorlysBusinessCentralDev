report 50019 "Pre-Receiving Report - Trans"
{
    Caption = 'Pre-Receiving Report - Trans';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Transfer Line";
    RDLCLayout = './Sales/Reports/Pre-ReceivingReport-Trans.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Transfer Line"; "Transfer Line")
        {
            DataItemTableView = sorting("Item No.") where("Item No." = filter(<> ''), "Derived From Line No." = filter(0));
            RequestFilterFields = "TPS CMG Container No.", "Document No.";

            trigger OnAfterGetRecord()
            begin

            end;
        }
    }
    var

}