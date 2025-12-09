page 50561 TorlysItemAvailabilitySubform
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
                }
                field("Qty. on Sales Order"; Item."Qty. on Sales Order")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. on Sales Order';
                    ToolTip = 'Qty. on Sales Order';
                    Editable = false;
                }
                field("Qty. to Ship"; Item."Qty. to Ship")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship';
                    ToolTip = 'Qty. to Ship';
                    Editable = false;
                }
                field("Qty. to Ship (Transfer)"; Item."Qty. to Ship (Transfer)")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship (Transfer)';
                    ToolTip = 'Qty. to Ship (Transfer)';
                    Editable = false;
                }

                field("Qty. in Transit"; Item."Qty. in Transit")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. in Transit';
                    ToolTip = 'Qty. in Transit';
                    Editable = false;
                }

                field("Qty. on Purch. Order"; Item."Qty. on Purch. Order")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. on Purch. Order';
                    ToolTip = 'Qty. on Purch. Order';
                    Editable = false;
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