pageextension 50030 TlyItemCard extends "Item Card"
{
    DeleteAllowed = false;

    layout
    {
        //Item Group Start
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                Caption = 'No. 2';
                ToolTip = 'Specifies the collection that the item belongs to.';
                ApplicationArea = All;
                Visible = true;
                Importance = Standard;

            }
        }

        moveafter("No. 2"; Description, "Description 2", Type)

        addafter("Base Unit of Measure")
        {
            field("Compare Unit of Measure"; Rec."Compare Unit of Measure")
            {
                Caption = 'Compare Unit of Measure';
                ToolTip = 'Specifies the unit of measure for rounding in sales and purchase orders.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        moveafter("Compare Unit of Measure"; "Gross Weight", "Net Weight")

        addafter("Net Weight")
        {
            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = true;
                ToolTip = 'This field is the user who created the customer account.';
                Importance = Additional;
            }
            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was created.';
                Importance = Additional;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("SystemModifiedAt"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was last modified.';
                Importance = Additional;
            }
        }
        //Item Group End

        //Attributes Group Start
        addafter("Item")
        {
            group("Attributes")
            {
                Caption = 'Attributes';
                Visible = IsInventoriable;
                field("Launch Date"; Rec."Launch Date")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Launch Date';
                    ToolTip = 'Date the Item launched';
                    Importance = Standard;
                }
                field("New Item"; Rec."New Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'New Item';
                    ToolTip = 'Specifies if this item is a new item for selling purposes.';
                    Importance = Promoted;
                }

                field("Current Item"; Rec."Current Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Current Item';
                    ToolTip = 'Specifies if this item is currently being stocked for selling purposes.';
                    Importance = Standard;
                }
                field("Inactive Current Item"; Rec."Inactive Current Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Inactive Current Item';
                    ToolTip = 'Inactive Current Item';
                    Importance = Standard;
                }
                field("Sunset Item"; Rec."Sunset Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Sunset Item';
                    ToolTip = 'Sunset Item';
                    Importance = Standard;
                }
                field("Discontinued Item"; Rec."Discontinued Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Discontinued Item';
                    ToolTip = 'Specifies if this item is no longer being replenished and no longer actively marketed.';
                    Importance = Standard;
                }
                field("Discontined Date"; Rec."Discontinued Date")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Discontinued Date';
                    ToolTip = 'Specifies the date when this item was discontinued.';
                    Importance = Additional;
                }
                field("Special Item"; Rec."Special Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Special Item';
                    ToolTip = 'Specifies if this item is a special item and only stocked for specified purposes. Please refer to the notes section for details.';
                    Importance = Additional;
                }
                field("Clearance Item"; Rec."Clearance Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Clearance Item';
                    ToolTip = 'Specifies if this item is no longer being actively replenished and no longer marketed but the stock level is above 10,000 Sq. Ft.';
                    Importance = Additional;
                }

                field("Production Date Required"; Rec."Production Date Required")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Production Date Required';
                    ToolTip = 'Production Date Required';
                    Importance = Additional;
                }
            }
        }

        moveafter("Production Date Required"; "Automatic Ext. Texts", "Sales Blocked", "Purchasing Blocked", Blocked)

        addafter(Blocked)
        {
            field("Assembly BOM"; Rec."Assembly BOM")
            {
                Caption = 'Assembly BOM';
                ToolTip = 'The Item No. for the Kit Bill of Material';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }
        //Attributes Group End

        //Inventory Group Start
        addafter(Inventory)
        {
            field("Inventory Value"; Rec."Unit Cost" * Rec.Inventory)
            {
                Caption = 'Inventory Value';
                ToolTip = 'The value of the Item Inventory';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        addafter("Qty. on Sales Order")
        {
            field("Qty. to Ship"; Rec."Qty. to Ship")
            {
                Caption = 'Qty. to Ship';
                ToolTip = 'The quantity to ship on open sales orders';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        addafter("Qty. to Ship")
        {
            field("Qty. on Transfer Order"; Rec."Qty. on Transfer Order")
            {
                Caption = 'Qty. on Transfer Order';
                ToolTip = 'The quantity on all open transfer orders';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
            field("Qty. to Ship (Transfer)"; Rec."Qty. to Ship (Transfer)")
            {
                Caption = 'Qty. to Ship (Transfer)';
                ToolTip = 'The quantity to Ship on  open transfer orders';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        moveafter("Qty. to Ship (Transfer)"; "Qty. on Purch. Order")

        moveafter("Costing Method"; "Inventory Value Zero", "Standard Cost", "Unit Cost", "Cost is Adjusted", "Cost is Posted to G/L")

        addafter("Cost is Posted to G/L")
        {
            field("Replacement Cost"; Rec."Replacement Cost (LCY)")
            {
                Caption = 'Replacement Cost';
                ToolTip = 'The cost of replacement of the current item.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
            field("Replacement Cost Date"; Rec."Replacement Cost (Date)")
            {
                Caption = 'Replacement Cost Date';
                ToolTip = 'The date that the replacement cost is valid as of.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        moveafter("Replacement Cost Date"; "Last Direct Cost")

        addafter("Last Direct Cost")
        {
            field("Allow SO Unit Cost Edit"; Rec."Allow SO Unit Cost Edit")
            {
                Caption = 'Allow SO Unit Cost Edit';
                ToolTip = 'If this field is enabled, users are allowed to edit the unit cost in a Sales Order.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }
        moveafter("Gen. Prod. Posting Group"; "Inventory Posting Group")

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
                ShowMandatory = true;
                trigger OnValidate()
                begin
                    ValidateShortcutDimension(4);
                end;
            }
        }

        moveafter(ShortcutDimCode4; "Item Category Code", "Tax Group Code")

        addafter("Tariff No.")
        {
            field("Tariff No. (Sales)"; Rec."Tariff No. (Sales)")
            {
                Caption = 'Tariff No. (Sales)';
                ToolTip = 'Tariff No. for Sales Purposes.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        moveafter("Tariff No. (Sales)"; "Country/Region of Origin Code")

        addafter("Unit Price")
        {
            field("Web Suggested Price"; Rec."NTN Web Suggested Price")
            {
                Caption = 'Web Suggested Price';
                ToolTip = 'Web Suggested Price';
                ApplicationArea = All;
                Visible = true;
                Importance = Standard;
            }
            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'The Sales Price Code';
                ApplicationArea = All;
                Visible = true;
                Importance = Standard;
            }
            field("Automatically Allocate"; Rec."Automatically Allocate")
            {
                Caption = 'Automatically Allocate';
                ToolTip = 'Allocate stock for the order automatically';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        moveafter("Lead Time Calculation"; "Vendor No.", "Manufacturer Code", "Vendor Item No.")

        modify("Manufacturer Code")
        {
            Visible = true;
        }
        modify("Shelf No.")
        {
            Visible = false;
        }
        modify("Created From Nonstock Item")
        {
            Visible = false;
        }
        modify("Search Description")
        {
            Visible = false;
        }
        modify("Qty. on Assembly Order")
        {
            Visible = false;
        }
        modify("Qty. on Asm. Component")
        {
            Visible = false;
        }
        modify(StockoutWarningDefaultNo)
        {
            Visible = false;
        }
        modify(StockoutWarningDefaultYes)
        {
            Visible = false;
        }
        modify(PreventNegInventoryDefaultNo)
        {
            Visible = false;
        }
        modify(PreventNegInventoryDefaultYes)
        {
            Visible = false;
        }
        modify("Unit Volume")
        {
            Visible = false;
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
        }
        modify("Inventory Value Zero")
        {
            Visible = true;
        }
        modify(GTIN)
        {
            Visible = false;
        }
        modify(VariantMandatoryDefaultNo)
        {
            Visible = false;
        }
        modify(VariantMandatoryDefaultYes)
        {
            Visible = false;
        }
        modify("Common Item No.")
        {
            Visible = false;
        }
        modify("Indirect Cost %")
        {
            Visible = true;
        }
        modify("Net Invoiced Qty.")
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
        modify("Replenishment System")
        {
            Importance = Standard;
        }
        modify("Lead Time Calculation")
        {
            Importance = Promoted;
        }
        modify("Purchasing Code")
        {
            visible = false;
        }
        modify("Last Date Modified")
        {
            visible = false;
        }
        modify("Vendor No.")
        {
            Importance = Promoted;
        }
        modify(CalcUnitPriceExclVAT)
        {
            Visible = false;
        }
        modify("Price/Profit Calculation")
        {
            Visible = false;
        }
        modify("Profit %")
        {
            Visible = false;
        }
        modify("Vendor Item No.")
        {
            Importance = Promoted;
        }
        modify("Allow Invoice Disc.")
        {
            Visible = false;
        }
        modify("Sales Unit of Measure")
        {
            Visible = false;
        }
        modify(Purchase)
        {
            Visible = false;
        }
        modify(Replenishment_Production)
        {
            Visible = false;
        }
        modify(Replenishment_Assembly)
        {
            Visible = false;
        }
        modify("Description 2")
        {
            Visible = true;
        }
        modify("Item Disc. Group")
        {
            Visible = false;
        }
        modify(Planning)
        {
            Visible = false;
        }
        modify(ItemTracking)
        {
            Visible = false;
        }
        modify(Warehouse)
        {
            Visible = false;
        }
        modify("Qty. on Job Order")
        {
            Visible = false;
        }
        modify(SpecialSalesPriceListTxt)
        {
            Visible = false;
        }
        modify(SpecialPurchPriceListTxt)
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            ShowMandatory = true;
        }
        modify("Inventory Posting Group")
        {
            ShowMandatory = true;
        }
        modify("Tax Group Code")
        {
            ShowMandatory = true;
        }
        modify("Gross Weight")
        {
            ShowMandatory = true;
        }
        modify("Net Weight")
        {
            ShowMandatory = true;
        }
        modify("Item Category Code")
        {
            ShowMandatory = true;
        }
    }

    actions
    {
        addlast(Category_Process)
        {
            actionref(ItemAvailability_Promoted; ItemAvailability)
            {
            }
            actionref(ItemAccessories_Promoted; ItemAccessories)
            { }
        }

        addafter(ApplyTemplate)
        {
            action(ItemAvailability)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Availability';
                Ellipsis = true;
                Image = ItemAvailability;
                ToolTip = 'Item Availability';
                trigger OnAction()
                var
                    Item: Record "Item";
                begin
                    Item.Reset();
                    Item.SetRange("No.", Rec."No.");
                    Page.Run(Page::TlyItemAvailability, Item);
                end;
            }
            action(ItemAccessories)
            {
                Caption = 'Item Accessories';
                ToolTip = 'Item Accessories';
                ApplicationArea = All;
                Image = Order;
                RunObject = Page "NTN Web Related Items";
                RunPageLink = "No." = field("No.");
                RunPageMode = View;
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
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

    // procedure QuantityOfItem(Item: Record Item): Decimal
    // begin
    //     exit(Item."Qty. on Sales Order")
    // end;

    // procedure QuantityAvailable(Item: Record Item): Decimal
    // begin
    //     exit(Item."Qty. on Purch. Order" - Item."Qty. on Sales Order")
    // end;
}