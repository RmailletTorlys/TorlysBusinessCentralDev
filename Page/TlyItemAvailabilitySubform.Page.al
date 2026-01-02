page 50561 TlyItemAvailabilitySubform
{
    Caption = 'Item Availability';
    PageType = ListPart;
    SourceTable = "Location";
    SourceTableView = where("Use As In-Transit" = const(false));
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
                        ItemLedgerEntry.SetFilter("Location Code", Item.GETFILTER("Location Filter"));
                        ItemLedgerEntry.SetFilter(Open, 'Yes');
                        Page.Run(0, ItemLedgerEntry);
                    end;
                }
                field("Qty. on Sales Order"; Item."Qty. on Sales Order")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. on Sales Order';
                    ToolTip = 'Qty. on Sales Order';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        SalesLine: Record "Sales Line";
                    begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                        SalesLine.SetRange(Type, SalesLine.Type::Item);
                        SalesLine.SetRange("No.", Item."No.");
                        SalesLine.SetFilter("Location Code", Item.GetFilter("Location Filter"));
                        SalesLine.SetFilter(Quantity, '<>0');
                        Page.Run(0, SalesLine);
                    end;
                }
                field("Qty. to Ship"; Item."Qty. to Ship")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship';
                    ToolTip = 'Qty. to Ship';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        SalesLine: Record "Sales Line";
                    begin
                        SalesLine.Reset;
                        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                        SalesLine.SetRange(Type, SalesLine.Type::Item);
                        SalesLine.SetRange("No.", Item."No.");
                        SalesLine.SetFilter("Location Code", Item.GetFilter("Location Filter"));
                        SalesLine.SetFilter("Qty. to Ship", '<>0');
                        Page.Run(0, SalesLine);
                    end;
                }
                field("Qty. to Ship (Transfer)"; Item."Qty. to Ship (Transfer)")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship (Transfer)';
                    ToolTip = 'Qty. to Ship (Transfer)';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        TransferLine: Record "Transfer Line";
                    begin
                        TransferLine.Reset;
                        TransferLine.SetRange("Item No.", Item."No.");
                        TransferLine.SetFilter("Transfer-from Code", Item.GetFilter("Location Filter"));
                        TransferLine.SetFilter("Qty. to Ship", '<>0');
                        Page.Run(0, TransferLine);
                    end;
                }

                field("Qty. in Transit"; Item."Qty. in Transit")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. in Transit';
                    ToolTip = 'Qty. in Transit';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        TransferLine: Record "Transfer Line";
                    begin
                        TransferLine.Reset;
                        TransferLine.SetRange("Item No.", Item."No.");
                        TransferLine.SetFilter("Transfer-to Code", Item.GetFilter("Location Filter"));
                        TransferLine.SetFilter("Qty. in Transit", '<>0');
                        Page.Run(0, TransferLine);
                    end;
                }

                field("Qty. on Purch. Order"; Item."Qty. on Purch. Order")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. on Purch. Order';
                    ToolTip = 'Qty. on Purch. Order';
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        PurchaseLine: Record "Purchase Line";
                    begin
                        PurchaseLine.Reset;
                        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
                        PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                        PurchaseLine.SetRange("No.", Item."No.");
                        PurchaseLine.SetFilter("Location Code", Item.GetFilter("Location Filter"));
                        PurchaseLine.SetFilter(Quantity, '<>0');
                        Page.Run(0, PurchaseLine);
                    end;
                }
                field("Net Available"; Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)")
                {
                    ApplicationArea = All;
                    DecimalPlaces = 0 : 5;
                    Caption = 'Net Available';
                    ToolTip = 'Net Available';
                    Editable = false;
                }
            }
        }
    }

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
            Item.CalcFields(Inventory, "Qty. on Sales Order", "Qty. to Ship", "Qty. to Ship (Transfer)", "Qty. in Transit", "Qty. on Purch. Order");
        end;
    end;

    var
        Item: Record Item;
}