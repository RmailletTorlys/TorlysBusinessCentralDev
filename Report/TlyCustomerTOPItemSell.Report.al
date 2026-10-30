report 50082 "Customer Top Selling Item"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Customer Top Selling Item (Top 1 by Quantity)';
    DefaultLayout = Excel;
    ExcelLayout = './src/CustomerTopSellingItem.xlsx';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Customer Posting Group", "Date Filter";

            column(Customer_No_; "No.") { }
            column(Customer_Name; Name) { }
            column(country_Region_Code; "Country/Region Code") { }
            column(Customer_Province; County) { }
            column("Power_Up_Level"; "Power Up Level") { }

            // Custom loop that forces exactly 1 item row execution per customer block
            dataitem(IntegerLoop; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));

                column(Item_No_; TopItemNo) { }
                column(Item_Description; TopItemDesc) { }
                column(Top_Sales_Quantity; TopItemQty) { }
                column(Top_Sales_Amount; TopItemAmount) { }
                column(Gen_Prod_Posting_Group; TopGenProdPostingGroup) { }
                column(Item_Category_Name; TopItemCategoryName) { }

                trigger OnAfterGetRecord()
                begin
                    FindTopSellingItem(Customer."No.", TopItemNo, TopItemDesc, TopItemQty, TopItemAmount);

                    if TopItemNo = '' then
                        CurrReport.Skip();
                end;
            }
        }
    }

    var
        TopItemNo: Code[20];
        TopItemDesc: Text;
        TopItemQty: Decimal;
        TopItemAmount: Decimal;
        TopGenProdPostingGroup: Code[20];
        TopItemCategoryName: Text;
        NextEntryNo: Integer;

    local procedure FindTopSellingItem(CustNo: Code[20]; var OutItemNo: Code[20]; var OutDesc: Text; var OutQty: Decimal; var OutAmount: Decimal)
    var
        ValueEntry: Record "Value Entry";
        Item: Record Item;
        ItemCategory: Record "Item Category";
        TempBuffer: Record "Value Entry" temporary;
        HighestQuantity: Decimal;
        CurrentItemQty: Decimal;
    begin
        OutItemNo := '';
        OutDesc := '';
        OutQty := 0;
        OutAmount := 0;
        TopGenProdPostingGroup := '';
        TopItemCategoryName := '';
        HighestQuantity := -99999999;

        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Source Type", "Source No.", "Item No.");
        ValueEntry.SetRange("Source Type", ValueEntry."Source Type"::Customer);
        ValueEntry.SetRange("Source No.", CustNo);
        ValueEntry.SetRange("Item Ledger Entry Type", ValueEntry."Item Ledger Entry Type"::Sale);

        if Customer.GetFilter("Date Filter") <> '' then
            ValueEntry.SetFilter("Posting Date", Customer.GetFilter("Date Filter"));

        // 1. Roll up raw ledger details directly using database signs
        if ValueEntry.FindSet() then begin
            repeat
                if ValueEntry."Item No." <> '' then begin
                    TempBuffer.Reset();
                    TempBuffer.SetRange("Item No.", ValueEntry."Item No.");

                    if TempBuffer.FindFirst() then begin
                        TempBuffer."Invoiced Quantity" += ValueEntry."Invoiced Quantity";
                        TempBuffer."Sales Amount (Actual)" += ValueEntry."Sales Amount (Actual)";
                        TempBuffer.Modify();
                    end else begin
                        TempBuffer.Init();
                        NextEntryNo += 1;
                        TempBuffer."Entry No." := NextEntryNo;

                        TempBuffer."Item No." := ValueEntry."Item No.";
                        TempBuffer."Invoiced Quantity" := ValueEntry."Invoiced Quantity";
                        TempBuffer."Sales Amount (Actual)" := ValueEntry."Sales Amount (Actual)";
                        TempBuffer."Gen. Prod. Posting Group" := ValueEntry."Gen. Prod. Posting Group";
                        TempBuffer.Insert();
                    end;
                end;
            until ValueEntry.Next() = 0;
        end;

        // 2. Evaluate the aggregated rows using absolute values for volume comparisons
        TempBuffer.Reset();
        if TempBuffer.FindSet() then begin
            repeat
                // Convert negative ledger quantities (e.g. -50 units) to a positive ranking value (50 units)
                CurrentItemQty := Abs(TempBuffer."Invoiced Quantity");

                if CurrentItemQty > HighestQuantity then begin
                    HighestQuantity := CurrentItemQty;
                    OutItemNo := TempBuffer."Item No.";
                    OutQty := CurrentItemQty; // Returns clean positive numbers to Excel
                    OutAmount := TempBuffer."Sales Amount (Actual)";
                    TopGenProdPostingGroup := TempBuffer."Gen. Prod. Posting Group";
                end;
            until TempBuffer.Next() = 0;
        end;

        if OutItemNo <> '' then begin
            if Item.Get(OutItemNo) then begin
                OutDesc := Item.Description;

                if Item."Item Category Code" <> '' then begin
                    if ItemCategory.Get(Item."Item Category Code") then
                        TopItemCategoryName := ItemCategory.Description;
                end;
            end;
        end;
    end;
}
