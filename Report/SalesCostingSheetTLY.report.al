report 50100 "Sales Costing Sheet"
{
    Caption = 'Sales Costing Sheet';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;   // exports to Excel; swap for an RDLC/Word layout if you want a printable version

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("Item Category Code", "Vendor No.") where(Blocked = const(false));
            RequestFilterFields = "Vendor No.", "Item Category Code", "No.";


        }
    }
}