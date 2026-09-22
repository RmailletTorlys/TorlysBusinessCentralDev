page 50562 TlyItemStatsSubform
{
    Caption = 'Item Stats';
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

                field("Qty. on Hand"; Item."Inventory")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. on Hand';
                    ToolTip = 'Qty. on Hand';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        ItemLedgerEntry: Record "Item Ledger Entry";
                    begin
                        ItemLedgerEntry.Reset;
                        ItemLedgerEntry.SetRange("Item No.", Item."No.");
                        ItemLedgerEntry.SetFilter("Location Code", Item.GetFilter("Location Filter"));
                        ItemLedgerEntry.SetFilter(Open, 'Yes');
                        Page.Run(0, ItemLedgerEntry);
                    end;
                }
            }
        }
    }

    var
        Item: Record Item;

    trigger OnAfterGetRecord()
    begin
        if Item."No." <> '' then begin
            CalculateQtyByLocation;
        end;
    end;

    procedure SetItemNo(NewItem: Record Item)
    begin
        Item.Copy(NewItem);
        CurrPage.Update(false);
    end;

    procedure SetItemFilter()
    begin
        if Item."No." <> '' then begin
            Item.SetRange("Location Filter", Rec.Code);
        end;
    end;

    procedure CalculateQtyByLocation()
    begin
        if Item."No." <> '' then begin
            SetItemFilter;
            Item.CalcFields(Inventory, "Qty. on Sales Order", "Qty. to Ship", "Qty. to Ship (Transfer)", "Qty. in Transit", "Qty. on Purch. Order", Item."Sales (Qty.) - 90D");
        end;
    end;
}