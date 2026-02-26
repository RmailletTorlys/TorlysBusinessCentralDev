report 50037 "Inventory Summary TLY"
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
            DataItemTableView = sorting("Location Code", "Shortcut Dimension 4 Code", "Item No.") where(Open = const(True));
            RequestFilterFields = "Location Code", "Item No.", "Shortcut Dimension 4 Code";

            column(CompanyInformation; CompanyInformation.Name)
            {

            }
            column(ItemLedgerEntry2; ItemLedgerEntry2.TableName + ' ' + ItemFilter)
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Shortcut_Dimension_4_Code; "Shortcut Dimension 4 Code")
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

            trigger OnAfterGetRecord()
            begin
                ItemRec.GET("Item Ledger Entry"."Item No.");
                GenProdPostGrp.GET(ItemRec."Gen. Prod. Posting Group");


                IF ShowProductOnly AND NOT GenProdPostGrp."Reportable Group" THEN
                    CurrReport.SKIP;

                IF ShowWebEnabled AND (ItemRec."NTN Web Enabled" = FALSE) THEN
                    CurrReport.SKIP;

                IF ShowSpecial AND (ItemRec."Special Item" = FALSE) THEN
                    CurrReport.SKIP;

                IF ShowNew AND (ItemRec."New Item" = FALSE) THEN
                    CurrReport.SKIP;

                IF ShowSunset AND (ItemRec."Sunset Item" = FALSE) THEN
                    CurrReport.SKIP;

                IF ShowDiscontinued AND (ItemRec."Discontinued Item" = FALSE) THEN
                    CurrReport.SKIP;

                "Item Ledger Entry".CALCFIELDS("Cost Amount (Actual)", "Cost Amount (Expected)");


                Desc := ItemRec.Description;
                BaseUnit := ItemRec."Base Unit of Measure";
                CostMethod := FORMAT(ItemRec."Costing Method");
                ICClass := ItemRec."Gen. Prod. Posting Group";

                Cost := ItemRec."Unit Cost";

                InventoryValue := "Remaining Quantity" * Cost;

                IF ClassRec.GET("Item Ledger Entry"."Shortcut Dimension 4 Code") THEN
                    ClassDesc := ClassRec."Dimension Value Name";

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

                    field(PrintDetail; PrintDetail)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Details';
                    }
                    field(ShowProductOnly; ShowProductOnly)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Product Only';
                    }
                }
            }
        }
    }
    var
        ItemLedgerEntry2: Record "Item Ledger Entry";
        CompanyInformation: Record "Company Information";
        ItemFilter: Text;
        InventoryValue: Decimal;
        TotalInventoryValue: Decimal;
        Cost: Decimal;
        CostACY: Decimal;
        ShowFootnote: Boolean;
        TotalInvoicedQty: Decimal;
        ItemRec: Record Item;
        Desc: Text;
        BaseUnit: Text;
        CostMethod: Text;
        PrintDetail: Boolean;
        PrintLine: Text;
        ItemCostMgt: Codeunit ItemCostManagement;
        ShowDiscontinued: Boolean;
        TextOut: Text;
        ClassRec: Record "Dimension Set Entry";
        ClassDesc: Text;
        ICClass: code[10];
        GenProdPostGrp: Record "Gen. Product Posting Group";
        ShowSunset: Boolean;
        ShowWebEnabled: Boolean;
        ShowNew: Boolean;
        ShowSpecial: Boolean;
        ShowProductOnly: Boolean;
}