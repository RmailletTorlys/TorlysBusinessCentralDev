pageextension 50002 TorlysItemCard extends "Item Card"
{
    layout
    {
        //Item Group Start
        addafter("No.")
        {
            field("No. 2"; Rec."No. 2")
            {
                Caption = 'Collection No.';
                ToolTip = 'Specifies the collection that the item belongs to.';
                ApplicationArea = All;
                Visible = true;
                Importance = Standard;

            }
        }

        moveafter("Description 2"; "Item Category Code")

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

        moveafter("Compare Unit of Measure"; "Net Weight")

        addafter("Net Weight")
        {
            field("Created Date"; Rec."SystemCreatedAt")
            {
                Caption = 'Created Date';
                ToolTip = 'Specifies the date the item was created.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;

            }

            field("Modified Date"; Rec.SystemModifiedAt)
            {
                Caption = 'Modified Date';
                ToolTip = 'Specifiec the date the item was last modified';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }

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
        modify("Unit Volume")
        {
            Visible = false;
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
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
                    Caption = 'New Item';
                    ToolTip = 'Date the Item launched';
                    Importance = Standard;
                }
                field("New Item"; Rec."New Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'New Item';
                    ToolTip = 'Specifies if this item is a new item for selling purposes.';
                    Importance = Standard;

                }

                field("Current Item"; Rec."Current Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Current Item';
                    ToolTip = 'Specifies if this item is currently being stocked for selling purposes.';
                    Importance = Standard;

                }
                field("SC Review Item"; Rec."SC Review Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'SC Review Item';
                    ToolTip = 'SC Review Item';
                    Importance = Standard;
                }
                field("Discontinued Item"; Rec."Discontinued Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Discontinued';
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
            }
        }

        moveafter("Clearance Item"; "Automatic Ext. Texts")
        moveafter("Automatic Ext. Texts"; "Sales Blocked")
        moveafter("Sales Blocked"; "Purchasing Blocked")
        moveafter("Purchasing Blocked"; Blocked)
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

        addafter("Qty. on Purch. Order")
        {
            field("Qty. on Transfer Order"; Rec."Qty. on Transfer Order")
            {
                Caption = 'Qty. on Transfer Order';
                ToolTip = 'The quantity on all open transfer orders';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }

            field("Qty. to Ship Transfer"; Rec."Qty. to Ship (Transfer)")
            {
                Caption = 'Qty. to Ship (Transfer)';
                ToolTip = 'The quantity to Ship on  open transfer orders';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }

            field("Qty. in Transit"; Rec."Qty. in Transit")
            {
                Caption = 'Qty. in Transit';
                ToolTip = 'The quantity in transit on Purchase Orders';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }
        moveafter("Inventory Value"; "Qty. on Sales Order")
        moveafter("Qty. to Ship"; "Qty. on Purch. Order")
        //Inventory Group End

        //PriceCostsPosting Group Start
        addafter(InventoryGrp)
        {
            group("PriceCostsPosting")
            {
                Caption = 'Price, Costs, & Posting';
                visible = IsInventoriable;


                group("Price Details")
                {
                    Caption = 'Price Details';

                    field("Sales Price Code"; Rec."Sales Price Code")
                    {
                        Caption = 'Sales Price Code';
                        ToolTip = 'The Sales Price Code';
                        ApplicationArea = All;
                        Visible = true;
                        Importance = Additional;
                    }

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

                    field("Allow SO Unit Cost Edit"; Rec."Allow SO Unit Cost Edit")
                    {
                        Caption = 'Allow SO Unit Cost Edit';
                        ToolTip = 'If this field is enabled, users are allowed to edit the unit cost in a Sales Order.';
                        ApplicationArea = All;
                        Visible = true;
                        Importance = Additional;
                    }
                }
            }
        }


        movebefore("Sales Price Code"; "Unit Price")
        moveafter("Sales Price Code"; SpecialSalesPriceListTxt, "Cost Details")
        movefirst("Cost Details"; "Inventory Value Zero")
        moveafter("Unit Cost"; "Last Direct Cost")
        moveafter("Replacement Cost Date"; "Cost is Adjusted", "Cost is Posted to G/L")
        moveafter("Allow SO Unit Cost Edit"; SpecialPurchPriceListTxt, "Posting Details")
        moveafter("Inventory Posting Group"; "Tax Group Code")
        addafter("Tax Group Code")
        {
            field("Automatically Allocate"; Rec."Automatically Allocate")
            {
                Caption = 'Automatically Allocate';
                ToolTip = 'Allocate stock for the order automatically';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }

            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                Visible = IsInventoriable;
            }
        }

        movefirst("Foreign Trade"; "Country/Region of Origin Code", "Tariff No.")
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

            field("Tariff Charge Required"; Rec."Tarrif Charge Required")
            {
                Caption = 'Tariff Charge Required';
                Tooltip = 'Indicates if the item requires a charge for Tariff purposes';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;
            }
        }

        modify("Inventory Value Zero")
        {
            Visible = true;
        }
        modify("Indirect Cost %")
        {
            Visible = false;
        }
        modify("Net Invoiced Qty.")
        {
            Visible = false;
        }
        modify("Default Deferral Template Code")
        {
            Visible = false;
        }

        //PriceCostsPosting Group End

        //Replenishment Group Start

        moveafter("Lead Time Calculation"; "Vendor No.", "Vendor Item No.")

        modify("Replenishment System")
        {
            Importance = Standard;
        }

        modify("Lead Time Calculation")
        {
            Importance = Promoted;
        }

        modify("Vendor No.")
        {
            Importance = Promoted;
        }

        modify("Vendor Item No.")
        {
            Importance = Promoted;
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


        //Replenishment Group End

        //Kitting Group Start

        addafter(Replenishment)
        {
            group(Kitting)
            {
                Caption = 'Kitting';
                Visible = IsInventoriable;

                field("Kit BOM No."; Rec."Production BOM No.")
                {
                    Caption = 'Kit BOM No.';
                    ToolTip = 'The Item No. for the Kit Bill of Material';
                    ApplicationArea = All;
                    Visible = true;
                    Importance = Additional;
                }

                field("Kit Dissassembly BOM No."; Rec."Production BOM No.")
                {
                    Caption = 'Kit Dissassembly BOM No. (REVIEW)';
                    ToolTip = 'The Item No. for the Kit Bill of Material';
                    ApplicationArea = All;
                    Visible = true;
                    Importance = Additional;
                }

                field("Kit Components on Sales Orders"; Rec."Assembly Components on SO")
                {
                    Caption = 'Kit Components on Sales Orders';
                    ToolTip = 'Add the Kit assembly components on open sales orders';
                    ApplicationArea = All;
                    Visible = true;
                    Importance = Additional;
                }

                field("Kit Components on Shipments"; Rec."Assembly Components on Ship")
                {
                    Caption = 'Kit Components on Purchase Orders';
                    ToolTip = 'Add the Kit assembly components on shipments';
                    ApplicationArea = All;
                    Visible = true;
                    Importance = Additional;
                }

                field("Kit Components on Invoices"; Rec."Assembly Components on Inv")
                {
                    Caption = 'Kit Components on Invoices';
                    ToolTip = 'Add the Kit assembly components on Invoices';
                    ApplicationArea = All;
                    Visible = true;
                    Importance = Additional;
                }

                field("Kit Components on Pick Tickets"; Rec."Assembly Components on Pick")
                {
                    Caption = 'Kit Components on Pick Tickets';
                    ToolTip = 'Add the Kit assembly components on Pick Tickets';
                    ApplicationArea = All;
                    Visible = true;
                    Importance = Additional;
                }
            }


        }

        //Kitting Group End


        //Hidden Groups - start
        modify("Costs & Posting")
        {
            Visible = false;
        }
        modify("Prices & Sales")
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
        modify(Sustainability)
        {
            Visible = false;
        }
        //Hidden Groups - End
    }

    procedure QuantityOfItem(Item: Record Item): Decimal
    begin
        exit(Item."Qty. on Sales Order")
    end;

    procedure QuantityAvailable(Item: Record Item): Decimal
    begin
        exit(Item."Qty. on Purch. Order" - Item."Qty. on Sales Order")
    end;
}