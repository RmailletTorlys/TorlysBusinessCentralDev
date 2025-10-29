pageextension 50031 TorlysItemList extends "Item List"
{
    layout
    {
        moveafter("No."; Description, "Item Category Code", "Base Unit of Measure")

        addafter("Base Unit of Measure")
        {
            field("Compare Unit of Measure"; Rec."Compare Unit of Measure")
            {
                ApplicationArea = Dimensions;
                Caption = 'Compare Unit of Measure';
                ToolTip = 'Compare Unit of Measure';
                Visible = true;
            }

            field("Gross Weight"; Rec."Gross Weight")
            {
                ApplicationArea = Dimensions;
                Caption = 'Gross Weight';
                ToolTip = 'Gross Weight';
                DecimalPlaces = 3;
                Visible = false;
            }

            field("Net Weight"; Rec."Net Weight")
            {
                ApplicationArea = Dimensions;
                Caption = 'Net Weight';
                ToolTip = 'Net Weight';
                DecimalPlaces = 3;
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

            field("Inactive Current Item"; Rec."Inactive Current Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'Inactive Current Item';
                ToolTip = 'Inactive Current Item';
                Visible = true;
            }

            field("Sunset Item"; Rec."Sunset Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'Sunset Item';
                ToolTip = 'Sunset Item';
                Visible = true;
            }
            field("Discontinued Item"; Rec."Discontinued Item")
            {
                ApplicationArea = Dimensions;
                Caption = 'Discontinued Item';
                ToolTip = 'Discontinued Item';
                Visible = true;
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

        moveafter("Purchasing Blocked"; "Blocked", InventoryField, "Unit Cost")

        addafter("Unit Cost")
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

        }

        moveafter("Sales Price Code"; "Costing Method", "Gen. Prod. Posting Group", "Inventory Posting Group")


        addafter("Inventory Posting Group")
        {
            field(ShortcutDimCode4; ShortcutDimCode[4])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,4';
                ToolTip = 'Global Dimension 4 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
                // trigger OnValidate()
                // begin
                //     ValidateShortcutDimension(4);
                // end;
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

        moveafter("Tariff No. (Sales)"; "Vendor No.", "Vendor Item No.")

        addafter("Vendor Item No.")
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                ApplicationArea = Dimensions;
                Caption = 'Created By';
                ToolTip = 'Created By';
                Editable = false;
                Visible = true;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = Dimensions;
                Caption = 'Created At';
                ToolTip = 'Created At';
                Editable = false;
                Visible = true;
            }
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                ApplicationArea = Dimensions;
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                Editable = false;
                Visible = true;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = Dimensions;
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                Editable = false;
                Visible = true;
            }
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


    var
        LookupUserId: Codeunit "TorlysLookupUserID";
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