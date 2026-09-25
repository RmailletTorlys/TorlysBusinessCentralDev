page 50562 TlyItemStatsSubform
{
    Caption = 'Sales Stats';
    PageType = ListPart;
    SourceTable = Location;
    SourceTableView = sorting("Sort Order") where("Code" = filter('TOR|CAL|TMT'));
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    Editable = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code';
                    Editable = false;
                }

                // field("Qty. on Hand"; Item."Inventory")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Qty. on Hand';
                //     ToolTip = 'Qty. on Hand';
                //     Editable = false;
                //     trigger OnDrillDown()
                //     var
                //         ItemLedgerEntry: Record "Item Ledger Entry";
                //     begin
                //         ItemLedgerEntry.Reset;
                //         ItemLedgerEntry.SetRange("Item No.", Item."No.");
                //         ItemLedgerEntry.SetFilter("Location Code", Item.GetFilter("Location Filter"));
                //         ItemLedgerEntry.SetFilter(Open, 'Yes');
                //         Page.Run(0, ItemLedgerEntry);
                //     end;
                // }

                field("Sales (Previous Quarter)"; GetSalesPrevQtr())
                {
                    ApplicationArea = All;
                    Caption = 'Sales (Previous Quarter)';
                    ToolTip = 'Sales (Previous Quarter)';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        ItemLedgerEntry: Record "Item Ledger Entry";
                    begin
                        ItemLedgerEntry.Reset;
                        ItemLedgerEntry.SetFilter("Entry Type", 'Sale');
                        ItemLedgerEntry.SetRange("Item No.", Item."No.");
                        ItemLedgerEntry.SetFilter("Location Code", Rec.Code);
                        ItemLedgerEntry.SetRange("Posting Date", PrevQuarterStart, PrevQuarterEnd);
                        Page.Run(0, ItemLedgerEntry);
                    end;
                }
                // field("Purchases (Previous Quarter)"; GetPurchasesPrevQtr())
                // {
                //     ApplicationArea = All;
                //     Caption = 'Purchases (Previous Quarter)';
                //     ToolTip = 'Purchases (Previous Quarter)';
                //     Editable = false;
                //     trigger OnDrillDown()
                //     var
                //         ItemLedgerEntry: Record "Item Ledger Entry";
                //     begin
                //         ItemLedgerEntry.Reset;
                //         ItemLedgerEntry.SetFilter("Entry Type", 'Purchase');
                //         ItemLedgerEntry.SetRange("Item No.", Item."No.");
                //         ItemLedgerEntry.SetFilter("Location Code", Rec.Code);
                //         ItemLedgerEntry.SetRange("Posting Date", PrevQuarterStart, PrevQuarterEnd);
                //         Page.Run(0, ItemLedgerEntry);
                //     end;
                // }
                field("Sales (Current Quarter)"; GetSalesCurrQtr())
                {
                    ApplicationArea = All;
                    Caption = 'Sales (Current Quarter)';
                    ToolTip = 'Sales (Current Quarter)';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        ItemLedgerEntry: Record "Item Ledger Entry";
                    begin
                        ItemLedgerEntry.Reset;
                        ItemLedgerEntry.SetFilter("Entry Type", 'Sale');
                        ItemLedgerEntry.SetRange("Item No.", Item."No.");
                        ItemLedgerEntry.SetFilter("Location Code", Rec.Code);
                        ItemLedgerEntry.SetRange("Posting Date", CurrQuarterStart, CurrQuarterEnd);
                        Page.Run(0, ItemLedgerEntry);
                    end;
                }
                // field("Purchases (Current Quarter)"; GetPurchasesCurrQtr())
                // {
                //     ApplicationArea = All;
                //     Caption = 'Purchases (Current Quarter)';
                //     ToolTip = 'Purchases (Current Quarter)';
                //     Editable = false;
                //     trigger OnDrillDown()
                //     var
                //         ItemLedgerEntry: Record "Item Ledger Entry";
                //     begin
                //         ItemLedgerEntry.Reset;
                //         ItemLedgerEntry.SetFilter("Entry Type", 'Purchase');
                //         ItemLedgerEntry.SetRange("Item No.", Item."No.");
                //         ItemLedgerEntry.SetFilter("Location Code", Rec.Code);
                //         ItemLedgerEntry.SetRange("Posting Date", CurrQuarterStart, CurrQuarterEnd);
                //         Page.Run(0, ItemLedgerEntry);
                //     end;
                // }
            }
        }
    }

    var
        PrevQuarterStart: Date;
        PrevQuarterEnd: Date;
        CurrQuarterStart: Date;
        CurrQuarterEnd: Date;
        Item: Record Item;

    trigger OnOpenPage()
    begin
        PrevQuarterStart := CalcDate('<-CQ-1Q>', WorkDate());
        PrevQuarterend := CalcDate('<CQ-1Q>', WorkDate());
        CurrQuarterStart := CalcDate('<-CQ>', WorkDate());
        CurrQuarterend := CalcDate('<CQ>', WorkDate());
    end;

    procedure SetItemNo(NewItem: Record Item)
    begin
        Item.Copy(NewItem);
        CurrPage.Update(false);
    end;

    procedure GetSalesPrevQtr(): Decimal
    var
        ValueEntry: Record "Value Entry";
    begin
        ValueEntry.Reset();
        ValueEntry.SetFilter("Item Ledger Entry Type", 'Sale');
        ValueEntry.SetRange("Item No.", Item."No.");
        ValueEntry.SetRange("Location Code", Rec.Code);
        ValueEntry.SetRange("Posting Date", PrevQuarterStart, PrevQuarterEnd);
        ValueEntry.CalcSums("Invoiced Quantity");
        exit(ValueEntry."Invoiced Quantity" * -1);
    end;

    // procedure GetPurchasesPrevQtr(): Decimal
    // var
    //     ValueEntry: Record "Value Entry";
    // begin
    //     ValueEntry.Reset();
    //     ValueEntry.SetFilter("Item Ledger Entry Type", 'Purchase');
    //     ValueEntry.SetRange("Item No.", Item."No.");
    //     ValueEntry.SetRange("Location Code", Rec.Code);
    //     ValueEntry.SetRange("Posting Date", PrevQuarterStart, PrevQuarterEnd);
    //     ValueEntry.CalcSums("Invoiced Quantity");
    //     exit(ValueEntry."Invoiced Quantity");
    // end;

    procedure GetSalesCurrQtr(): Decimal
    var
        ValueEntry: Record "Value Entry";
    begin
        ValueEntry.Reset();
        ValueEntry.SetFilter("Item Ledger Entry Type", 'Sale');
        ValueEntry.SetRange("Item No.", Item."No.");
        ValueEntry.SetRange("Location Code", Rec.Code);
        ValueEntry.SetRange("Posting Date", CurrQuarterStart, CurrQuarterEnd);
        ValueEntry.CalcSums("Invoiced Quantity");
        exit(ValueEntry."Invoiced Quantity" * -1);
    end;

    // procedure GetPurchasesCurrQtr(): Decimal
    // var
    //     ValueEntry: Record "Value Entry";
    // begin
    //     ValueEntry.Reset();
    //     ValueEntry.SetFilter("Item Ledger Entry Type", 'Purchase');
    //     ValueEntry.SetRange("Item No.", Item."No.");
    //     ValueEntry.SetRange("Location Code", Rec.Code);
    //     ValueEntry.SetRange("Posting Date", CurrQuarterStart, CurrQuarterEnd);
    //     ValueEntry.CalcSums("Invoiced Quantity");
    //     exit(ValueEntry."Invoiced Quantity");
    // end;
}