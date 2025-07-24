pageextension 50031 TorlysItemList extends "Item List"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                ApplicationArea = Dimensions;
                Caption = 'Item No. 2';
                ToolTip = 'Item No. 2';
                Visible = true;
            }
        }

        moveafter("No. 2"; Description, "Description 2", "Item Category Code", "Base Unit of Measure")

        addafter("Base Unit of Measure")
        {
            field("Compare Unit of Measure"; Rec."Compare Unit of Measure")
            {
                ApplicationArea = Dimensions;
                Caption = 'Compare Unit of Measure';
                ToolTip = 'Compare Unit of Measure';
                Visible = true;
            }

            field("Net Weight"; Rec."Net Weight")
            {
                ApplicationArea = Dimensions;
                Caption = 'Net Weight';
                ToolTip = 'Net Weight';
                DecimalPlaces = 3;
                Visible = false;
            }

            field("Launch Date"; Rec."Launch Date")
            {
                ApplicationArea = Dimensions;
                Caption = 'Launch Date';
                ToolTip = 'Launch Date';
                Visible = false;
            }

            field("New Item"; Rec."New Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'New Item';
                ToolTip = 'New Item';
                Visible = true;
            }

            field("Current Item"; Rec."Current Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'Current Item';
                ToolTip = 'Current Item';
                Visible = true;
            }

            field("SC Review Item"; Rec."SC Review Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'SC Review Item';
                ToolTip = 'SC Review Item';
                Visible = true;
            }
            field("Discontinued Item"; Rec."Discontinued Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'Discontinued Item';
                ToolTip = 'Discontinued Item';
                Visible = true;
            }
            field("Discontinued Date"; Rec."Discontinued Date")
            {
                ApplicationArea = Dimensions;
                Caption = 'Discontinued Date';
                ToolTip = 'Discontinued Date';
                Visible = false;
            }

            field("Special Item"; Rec."Special Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'Special Item';
                ToolTip = 'Special Item';
                Visible = false;
            }

            field("Clearance Item"; Rec."Clearance Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'Clearance Item';
                ToolTip = 'Clearance Item';
                Visible = false;
            }

            field("Sales Blocked"; Rec."Sales Blocked")
            {
                ApplicationArea = Dimensions;
                Caption = 'Sales Blocked';
                ToolTip = 'Sales Blocked';
                Visible = false;
            }

            field("Purchasing Blocked"; Rec."Purchasing Blocked")
            {
                ApplicationArea = Dimensions;
                Caption = 'Purchase Blocked';
                ToolTip = 'Purchase Blocked';
                Visible = false;
            }
        }

        moveafter("Purchasing Blocked"; "Blocked", InventoryField)

        addafter(InventoryField)
        {
            field("Inventory Value"; Rec."Unit Cost" * Rec.Inventory)
            {
                ApplicationArea = Dimensions;
                Caption = 'Inventory Value';
                ToolTip = 'Inventory Value';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }

            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = Dimensions;
                Caption = 'Qty. on Sales Order';
                ToolTip = 'Qty. on Sales Order';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }

            field("Qty. to Ship"; Rec."Qty. to Ship")
            {
                ApplicationArea = Dimensions;
                Caption = 'Qty. to Ship';
                ToolTip = 'Qty. to Ship';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }

            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = Dimensions;
                Caption = 'Qty. on Purchase Order';
                ToolTip = 'Qty. on Purchase Order';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }

            field("Qty. on Transfer Order"; Rec."Qty. on Transfer Order")
            {
                ApplicationArea = Dimensions;
                Caption = 'Qty. on Transfer Order';
                ToolTip = 'Qty. on Transfer Order';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }

            field("Qty. to Ship (Transfer)"; Rec."Qty. to Ship (Transfer)")
            {
                ApplicationArea = Dimensions;
                Caption = 'Qty. to Ship (Transfer)';
                ToolTip = 'Qty. to Ship (Transfer)';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }
            field("Qty. in Transit"; Rec."Qty. in Transit")
            {
                ApplicationArea = Dimensions;
                Caption = 'Qty. in Transit';
                ToolTip = 'Qty. in Transit';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                ApplicationArea = Dimensions;
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                Editable = false;
                Visible = true;
            }

            field("Inventory Value Zero"; Rec."Inventory Value Zero")
            {
                ApplicationArea = Dimensions;
                Caption = 'Inventory Value Zero';
                ToolTip = 'Inventory Value Zero';
                Editable = false;
                Visible = false;
            }
        }

        moveafter("Inventory Value Zero"; "Costing Method", "Standard Cost", "Unit Cost", "Gen. Prod. Posting Group", "Inventory Posting Group")


        addafter("Inventory Posting Group")
        {
            field(ShortcutDimCode4; ShortcutDimCode[4])
            {
                CaptionClass = '1,2,4';
                ToolTip = 'Global Dimension 4 Code';
                ApplicationArea = Dimensions;
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
                trigger OnValidate()
                begin
                    ValidateShortcutDimension(4);
                end;
            }
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                ApplicationArea = Dimensions;
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                Visible = false;
            }

            field("Country/Region of Origin"; Rec."Country/Region of Origin Code")
            {
                ApplicationArea = Dimensions;
                Caption = 'Country/Region of Origin';
                ToolTip = 'Country/Region of Origin';
                Visible = true;
            }
        }
        moveafter("Country/Region of Origin"; "Tariff No.")
        addafter("Tariff No.")
        {
            field("Tariff No. (Sales)"; Rec."Tariff No. (Sales)")
            {
                ApplicationArea = Dimensions;
                Caption = 'Tariff No. (Sales)';
                ToolTip = 'Tariff No. (Sales)';
                Visible = true;
            }
        }

        moveafter("Tariff No. (Sales)"; "Replenishment System", "Vendor No.", "Vendor Item No.")

        addafter("Vendor Item No.")
        {
            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                ApplicationArea = Dimensions;
                Caption = 'System Created By';
                ToolTip = 'System Created By';
                Editable = false;
                Visible = true;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = Dimensions;
                Caption = 'System Created At';
                ToolTip = 'System Created At';
                Editable = false;
                Visible = true;
            }
            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                ApplicationArea = Dimensions;
                Caption = 'System Modified By';
                ToolTip = 'System Modified By';
                Editable = false;
                Visible = true;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = Dimensions;
                Caption = 'System Modified At';
                ToolTip = 'System Modified At';
                Editable = false;
                Visible = true;
            }
        }

        modify("Description 2")
        {
            Visible = true;
        }

        modify("Item Category Code")
        {
            Visible = true;
        }

        modify("Tariff No.")
        {
            Visible = true;
        }

        modify(Blocked)
        {
            Visible = false;
        }

        modify("Costing Method")
        {
            Visible = false;
        }

        modify("Standard Cost")
        {
            Visible = false;
        }

        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }

        modify("Inventory Posting Group")
        {
            Visible = false;
        }

        modify("Replenishment System")
        {
            Visible = false;
        }

        modify("Vendor Item No.")
        {
            Visible = false;
        }

        modify(Type)
        {
            Visible = false;
        }

        modify("Substitutes Exist")
        {
            Visible = false;
        }

        modify("Assembly BOM")
        {
            Visible = false;
        }

        modify("Cost is Adjusted")
        {
            Visible = false;
        }

        modify("Unit Price")
        {
            Visible = false;
        }

        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
    }


    protected var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;



    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;
}