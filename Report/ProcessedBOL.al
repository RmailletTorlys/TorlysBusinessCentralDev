report 50009 "Processed Bill Of Lading"
{
    Caption = 'Processed Bill Of Lading';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Processed BOL Header";
    RDLCLayout = './Sales/Reports/ProcessedBOL.rdlc';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Processed Bol Header"; "Torlys Processed BOL Header")
        {

        }
    }
}