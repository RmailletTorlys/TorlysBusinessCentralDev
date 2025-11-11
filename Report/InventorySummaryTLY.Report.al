report 50022 "Inventory Summary TLY"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/InventorySummaryTLY.rdlc';
    Caption = 'Inventory Summary TLY';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = sorting("location code", "Shortcut Dimension 4 Code", "Item No.");
            RequestFilterFields = "Location Code", "Item No.", "Shortcut Dimension 4 Code";

            column(CompanyInformationName; CompanyInformation.Name)
            {

            }
            column(TextOut; TextOut)
            {

            }
            column(SystemId; SystemId)
            {

            }
            column(Itemfilder; "Item Ledger Entry".TableName + ' ' + ItemFilter)
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(class; "Shortcut Dimension 4 Code")
            {

            }
            column(ClassDesc; ClassDesc)
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Desc; Desc)
            {

            }
            column(BaseUnit; BaseUnit)
            {

            }
            column(CostMethod; CostMethod)
            {

            }
            column(Cost; Cost)
            {

            }
            column(Remaining_Quantity; "Remaining Quantity")
            {

            }
            column(InventoryValue; InventoryValue)
            {

            }
            column(PrintLine; PrintLine)
            {

            }
            column(PrintDetail; PrintDetail)
            {

            }

            dataitem(ReportTotal; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));


            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Remaining Quantity", InventoryValue);
            end;

            trigger OnAfterGetRecord()
            begin
                ItemRec.get("Item Ledger Entry"."Item No.");
                GenProdPostGrp.Get(ItemRec."Gen. Prod. Posting Group");

                // If ShowProductOnly  AND NOT GenProdPostGrp."Reportable Group" then
                // CurrReport.Skip();

                // If ShowWebEnabled and (ItemRec."Web Enabled" = FALSE) then
                // CurrReport.Skip();

                If ShowSpecial and (ItemRec."Special Item" = false) then
                    CurrReport.Skip();

                If ShowNew and (ItemRec."New Item" = false) then
                    CurrReport.Skip();

                // If ShowSunset and (ItemRec."Sunset Item" = false) then
                // CurrReport.Skip();

                If ShowDiscontinued and (ItemRec."Discontinued Item" = false) then
                    CurrReport.Skip();

                "Item Ledger Entry".CALCFIELDS("Cost Amount (Actual)", "Cost Amount (Expected)");

                Desc := ItemRec.Description;
                BaseUnit := ItemRec."Base Unit of Measure";
                CostMethod := Format(ItemRec."Costing Method");
                ICClass := ItemRec."Gen. Prod. Posting Group";

                Cost := ItemRec."Unit Cost";

                InventoryValue := "Remaining Quantity" * Cost;

                If GenProdPostGrp.Get("Item Ledger Entry"."Shortcut Dimension 4 Code") then
                    ClassDesc := GenProdPostGrp.Description;

                ItemFilter := "Item ledger entry".GetFilters;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(ShowProductOnly; ShowProductOnly)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Product Only';
                    }
                    field(ShowWebEnabled; ShowWebEnabled)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Web Enabled';
                    }
                    field(ShowSpecial; ShowSpecial)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Special';
                    }
                    field(ShowSunset; ShowSunset)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Sunset';
                    }
                    field(ShowDiscontinued; ShowDiscontinued)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Discontinued';
                    }
                    field(PrintDetail; PrintDetail)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Detail';
                    }
                }
            }
        }
    }

    var
        ItemLedgerEntry2: Record "Item Ledger Entry";
        CompanyInformation: Record "Company Information";
        ItemRec: Record Item;
        GenProdPostGrp: Record "Gen. Product Posting Group";
        // ClassRec: Record Class;
        ItemCostMgt: Codeunit ItemCostManagement;
        ShowFootnote: Boolean;
        PrintDetail: Boolean;
        ShowDiscontinued: Boolean;
        ShowSunset: Boolean;
        ShowWebEnabled: Boolean;
        ShowNew: Boolean;
        ShowSpecial: Boolean;
        ShowProductOnly: Boolean;
        InventoryValue: Decimal;
        TotalInventoryValue: Decimal;
        Cost: Decimal;
        CostACY: Decimal;
        TotalInvoicedQty: Decimal;
        ICClass: Code[10];
        ItemFilter: Text;
        Desc: Text;
        BaseUnit: Text;
        CostMethod: Text;
        PrintLine: Text;
        TextOut: Text;
        ClassDesc: Text;
}