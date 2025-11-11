report 50024 "Inventory Detail TLY"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/InventoryDetailTLY.rdlc';
    Caption = 'Inventory Detail TLY';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("Gen. Prod. Posting Group");
            RequestFilterFields = "No.", "Gen. Prod. Posting Group", "Location Filter";

            column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
            {

            }
            column(ItemFilter; ItemFilter)
            {

            }

            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemTableView = sorting("Item No.", "Variant Code", "Location Code", "Posting Date");
                DataItemLinkReference = Item;
                DataItemLink = "Item No." = field("No."), "Posting Date" = field("date filter"), "Location Code" = field("Location Filter");

                column(Item_No_; "Item No.")
                {

                }
                column(Description; Description)
                {

                }
                column(BaseUnit; BaseUnit)
                {

                }
                column(Remaining_Quantity; "Remaining Quantity")
                {

                }
                column(InventoryValue; InventoryValue)
                {

                }


                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals("Remaining Quantity", InventoryValue);
                end;

                trigger OnAfterGetRecord()
                begin
                    "Item Ledger Entry".CalcFields("Cost Amount (Actual)", "Cost Amount (Expected)");

                    Cost := Item."Unit Cost";
                    BaseUnit := Item."Base Unit of Measure";
                    // CostMethod := Item."Costing Method";
                    InventoryValue := "Remaining Quantity" * Cost;
                end;
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals("Item Ledger Entry"."Remaining Quantity", InventoryValue);
            end;

            trigger OnAfterGetRecord()
            begin
                ItemFilter := Item.GetFilters;
            end;
        }
    }

    var
        Cost: Decimal;
        InventoryValue: Decimal;
        ItemRec: Record Item;
        ItemLedgerEntry2: Record "Item Ledger Entry";
        CompanyInformation: Record "Company Information";
        ItemFilter: Text;
        TotalInventoryValue: Decimal;
        CostACY: Decimal;
        TotalInvoicedQty: Decimal;
        Desc: Text;
        BaseUnit: Text;
        CostMethod: Text;
}