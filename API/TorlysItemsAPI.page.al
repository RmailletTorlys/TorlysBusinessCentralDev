page 56004 "Torlys Items API"
{
    PageType = API;
    Caption = 'Torlys Items';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'torlysItem';
    EntitySetName = 'torlysItems';
    SourceTable = Item;
    SourceTableView = where("Gen. Prod. Posting Group" = filter('<>MK *'));
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(displayName; Rec.Description)
                {
                    Caption = 'Display Name';
                }
                field(displayName2; Rec."Description 2")
                {
                    Caption = 'Display Name 2';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(itemCategoryId; Rec."Item Category ID")
                {
                    Caption = 'Item Category ID';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(gtin; Rec.Gtin)
                {
                    Caption = 'Gtin';
                }
                field(inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(priceIncludesTax; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes Tax';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(taxGroupId; Rec."Tax Group ID")
                {
                    Caption = 'Tax Group ID';
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                }
                field(baseUnitOfMeasureId; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit Of Measure';
                }
                field(generalProductPostingGroupId; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'General Product Posting Group';
                }
                field(inventoryPostingGroupId; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                }
                field(lastModifiedDateTime; Rec."Last DateTime Modified")
                {
                    Caption = 'Last Modified Date Time';
                }

                field(newItem; Rec."New Item")
                {
                    Caption = 'New Item';

                }

                field(currentItem; Rec."Current Item")
                {
                    Caption = 'Current Item';

                }

                field(discontinuedItem; Rec."Discontinued Item")
                {
                    Caption = 'Discontinued Item';

                }

                field(discontinuedDate; Rec."Discontinued Date")
                {
                    Caption = 'Discontinued Date';

                }

                field(inactiveCurrentItem; Rec."Inactive Current Item")
                {
                    Caption = 'Inactive Current Item';

                }

                field(sunsetItem; Rec."Sunset Item")
                {
                    Caption = 'Sunset Item';

                }

                field(sunsetDate; Rec."Sunset Date")
                {
                    Caption = 'Sunset Date';

                }

                field(inCatalogue; Rec."In Catalogue")
                {
                    Caption = 'In Catalogue';

                }

                field(launchDate; Rec."Launch Date")
                {
                    Caption = 'Launch Date';

                }

                field(salesPriceCode; Rec."Sales Price Code")
                {
                    Caption = 'Sales Price Code';

                }

                field(NetAvailable; NetAvailable)
                {
                    Caption = 'Net Available';

                }

                field(TOR_NetAvailable; TorNetAvailabled)
                {
                    Caption = 'TOR Net Available';
                }

                field(TOR_QtyOnHand; TorQtyOnHand)
                {
                    Caption = 'TOR Qty On Hand';
                }

                field(TOR_QtyOnSalesOrder; TorQtyOnSalesOrder)
                {
                    Caption = 'TOR Qty On Sales Order';
                }

                field(TOR_QtyToShip; TorQtyToShip)
                {
                    Caption = 'TOR Qty To Ship';
                }

                field(TOR_QtyToShip_Transfer; TorQtyToShipTransfer)
                {
                    Caption = 'TOR Qty To Ship Transfer';
                }

                field(TOR_QtyInTransit_Transfer; TORQtyInTransitTransfer)
                {
                    Caption = 'TOR Qty In Transit Transfer';
                }

                field(CAL_NetAvailable; CalNetAvailabled)
                {
                    Caption = 'CAL Net Available';
                }

                field(CAL_QtyOnHand; CalQtyOnHand)
                {
                    Caption = 'CAL Qty On Hand';
                }

                field(CAL_QtyOnSalesOrder; CalQtyOnSalesOrder)
                {
                    Caption = 'CAL Qty On Sales Order';
                }

                field(CAL_QtyToShip; CalQtyToShip)
                {
                    Caption = 'CAL Qty To Ship';
                }

                field(CAL_QtyToShip_Transfer; CalQtyToShipTransfer)
                {
                    Caption = 'CAL Qty To Ship Transfer';
                }

                field(CAL_QtyInTransit_Transfer; CALQtyInTransitTransfer)
                {
                    Caption = 'CAL Qty In Transit Transfer';
                }

                field(OnPo0_15; OnPo0_15)
                {
                    Caption = '0-15 Days';
                }

                field(OnPo16_30; OnPo16_30)
                {
                    Caption = '16-30 Days';
                }

                field(OnPo31_60; OnPo31_60)
                {
                    Caption = '31-60 Days';
                }

                field(OnPo61_90; OnPo61_90)
                {
                    Caption = '61-90 Days';
                }

                field(OnPo91_plus; OnPo91_plus)
                {
                    Caption = '91+ Days';
                }
            }
        }
    }
    var
        TORRec: Record Item;
        CALRec: Record Item;
        NetAvailable: Decimal;
        TorNetAvailabled: Decimal;
        TorQtyOnHand: Decimal;
        TorQtyOnSalesOrder: Decimal;
        TorQtyToShip: Decimal;
        TorQtyToShipTransfer: Decimal;
        TORQtyInTransitTransfer: Decimal;
        CALNetAvailabled: Decimal;
        CALQtyOnHand: Decimal;
        CALQtyOnSalesOrder: Decimal;
        CALQtyToShip: Decimal;
        CALQtyToShipTransfer: Decimal;
        CALQtyInTransitTransfer: Decimal;
        OnPo0_15, OnPo16_30, OnPo31_60, OnPo61_90, OnPo91_plus : Decimal;
        BaseDate: Date;



    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields(Rec.Inventory);
        BaseDate := WorkDate();

        TORRec.Reset();
        TORRec.SetRange("No.", Rec."No.");
        TORRec.SetRange("Location Filter", 'TOR');
        TORRec.CalcFields(
            TORRec.Inventory,
            "Qty. on Sales Order",
            "Qty. to Ship (Transfer)",
            "Qty. in Transit",
            "Qty. on Purch. Order");

        CALRec.Reset();
        CALRec.SetRange("No.", Rec."No.");
        CALRec.SetRange("Location Filter", 'CAL');
        CALRec.CalcFields(
            CALRec.Inventory,
            "Qty. on Sales Order",
            "Qty. to Ship (Transfer)",
            "Qty. in Transit",
            "Qty. on Purch. Order");

        NetAvailable := Rec.Inventory;
        TorNetAvailabled := Rec."Qty. on Hand (TOR)" - TORRec."Qty. to Ship" - TORRec."Qty. to Ship (Transfer)";
        TorQtyOnHand := Rec."Qty. on Hand (TOR)";
        TorQtyOnSalesOrder := TORRec."Qty. on Sales Order";
        TorQtyToShip := TORRec."Qty. to Ship";
        TorQtyToShipTransfer := TORRec."Qty. to Ship (Transfer)";
        TORQtyInTransitTransfer := TORRec."Qty. in Transit";
        CALNetAvailabled := Rec."Qty. on Hand (CAL)" - CALRec."Qty. to Ship" - CALRec."Qty. to Ship (Transfer)";
        CALQtyOnHand := Rec."Qty. on Hand (CAL)";
        CALQtyOnSalesOrder := Rec."Qty. on Sales Order (CAL)";
        CALQtyToShip := CALRec."Qty. to Ship";
        CALQtyToShipTransfer := CALRec."Qty. to Ship (Transfer)";
        CALQtyInTransitTransfer := CALRec."Qty. in Transit";


        Rec.SetRange("Date Filter", BaseDate, BaseDate + 15);
        Rec.CalcFields("Qty. on Purch. Order");
        OnPo0_15 := Rec."Qty. on Purch. Order";

        // --- Bucket 2: 16 to 30 Days ---
        Rec.SetRange("Date Filter", BaseDate + 16, BaseDate + 30);
        Rec.CalcFields("Qty. on Purch. Order");
        OnPo16_30 := Rec."Qty. on Purch. Order";

        // --- Bucket 3: 31 to 60 Days ---
        Rec.SetRange("Date Filter", BaseDate + 31, BaseDate + 60);
        Rec.CalcFields("Qty. on Purch. Order");
        OnPo31_60 := Rec."Qty. on Purch. Order";

        // --- Bucket 4: 61 to 90 Days ---
        Rec.SetRange("Date Filter", BaseDate + 61, BaseDate + 90);
        Rec.CalcFields("Qty. on Purch. Order");
        OnPo61_90 := Rec."Qty. on Purch. Order";

        // --- Bucket 5: 91 Days and more ---
        // Use SetFilter with '>' for an open-ended range
        Rec.SetFilter("Date Filter", '>%1', BaseDate + 90);
        Rec.CalcFields("Qty. on Purch. Order");
        OnPo91_plus := Rec."Qty. on Purch. Order";

    end;

}