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

                field(clearanceItem; Rec."Clearance Item")
                {
                    Caption = 'Clearance Item';

                }

                field(discontinuedItem; Rec."Discontinued Item")
                {
                    Caption = 'Discontinued Item';

                }

                field(specialItem; Rec."Special Item")
                {
                    Caption = 'Special Item';

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

                field(TOR_OnPo0_15; TOR_OnPo0_15)
                {

                }

                field(TOR_OnPo16_30; TOR_OnPo16_30)
                {

                }

                field(TOR_OnPo31_60; TOR_OnPo31_60)
                {

                }

                field(TOR_OnPo61_90; TOR_OnPo61_90)
                {

                }

                field(TOR_OnPo91_plus; TOR_OnPo91_plus)
                {

                }

                field(CAL_OnPo0_15; CAL_OnPo0_15)
                {

                }

                field(CAL_OnPo16_30; CAL_OnPo16_30)
                {

                }

                field(CAL_OnPo31_60; CAL_OnPo31_60)
                {

                }

                field(CAL_OnPo61_90; CAL_OnPo61_90)
                {

                }

                field(CAL_OnPo91_plus; CAL_OnPo91_plus)
                {

                }
            }
        }
    }
    var
        TORRec, CALRec : Record Item;
        TorNetAvailabled, TorQtyOnHand, TorQtyOnSalesOrder, TorQtyToShip, TorQtyToShipTransfer, TORQtyInTransitTransfer : Decimal;
        CALNetAvailabled, CALQtyOnHand, CALQtyOnSalesOrder, CALQtyToShip, CALQtyToShipTransfer, CALQtyInTransitTransfer : Decimal;
        TOR_OnPo0_15, TOR_OnPo16_30, TOR_OnPo31_60, TOR_OnPo61_90, TOR_OnPo91_plus : Decimal;
        CAL_OnPo0_15, CAL_OnPo16_30, CAL_OnPo31_60, CAL_OnPo61_90, CAL_OnPo91_plus : Decimal;
        BaseDate: Date;


    trigger OnOpenPage()
    begin
        BaseDate := WorkDate();
        Rec.SetAutoCalcFields(Inventory);
    end;

    trigger OnAfterGetRecord()
    begin
        // Reset variables to prevent carry-over from previous records
        TorQtyOnHand := 0;
        TorQtyOnSalesOrder := 0;
        TorQtyToShipTransfer := 0;
        TorNetAvailabled := 0;
        TOR_OnPo0_15 := 0;
        TOR_OnPo16_30 := 0;
        TOR_OnPo31_60 := 0;
        TOR_OnPo61_90 := 0;
        TOR_OnPo91_plus := 0;

        CALQtyOnHand := 0;
        CALQtyOnSalesOrder := 0;
        CALQtyToShipTransfer := 0;
        CALNetAvailabled := 0;
        CAL_OnPo0_15 := 0;
        CAL_OnPo16_30 := 0;
        CAL_OnPo31_60 := 0;
        CAL_OnPo61_90 := 0;
        CAL_OnPo91_plus := 0;


        if TORRec.Get(Rec."No.") then begin
            TORRec.SetFilter("Location Filter", 'TOR|TMT');
            TORRec.CalcFields(
                Inventory,
                "Qty. on Sales Order (TOR)",
                "Qty. to Ship",
                "Qty. to Ship (Transfer)",
                "Qty. in Transit",
                "Qty. on Purch. Order"
            );

            TorQtyOnHand := TORRec.Inventory;
            TorQtyOnSalesOrder := TORRec."Qty. on Sales Order";
            TorQtyToShip := TORRec."Qty. to Ship";
            TorQtyToShipTransfer := TORRec."Qty. to Ship (Transfer)";
            TORQtyInTransitTransfer := TORRec."Qty. in Transit";
            TorQtyOnSalesOrder := TORRec."Qty. on Sales Order";
            TorNetAvailabled := TORRec.Inventory - TORRec."Qty. on Sales Order (TOR)" - TORRec."Qty. to Ship";
            TorQtyToShipTransfer := TORRec."Qty. to Ship (Transfer)";
            TorNetAvailabled := TORRec.Inventory - TORRec."Qty. to Ship" - TORRec."Qty. to Ship (Transfer)";

            if TORRec."Qty. in Transit" <> 0 then begin
                TORRec.SetRange("Date Filter", BaseDate, BaseDate + 15);
                TORRec.CalcFields("Qty. in Transit");
                TOR_OnPo0_15 := TORRec."Qty. in Transit";

                TORRec.SetRange("Date Filter", BaseDate + 16, BaseDate + 30);
                TORRec.CalcFields("Qty. in Transit");
                TOR_OnPo16_30 := TORRec."Qty. in Transit";

                TORRec.SetRange("Date Filter", BaseDate + 31, BaseDate + 60);
                TORRec.CalcFields("Qty. in Transit");
                TOR_OnPo31_60 := TORRec."Qty. in Transit";

                TORRec.SetRange("Date Filter", BaseDate + 61, BaseDate + 90);
                TORRec.CalcFields("Qty. in Transit");
                TOR_OnPo61_90 := TORRec."Qty. in Transit";

                TORRec.SetFilter("Date Filter", '>%1', BaseDate + 90);
                TORRec.CalcFields("Qty. in Transit");
                TOR_OnPo91_plus := TORRec."Qty. in Transit";
            end;
        end;

        if CALRec.Get(Rec."No.") then begin
            CALRec.SetFilter("Location Filter", 'CAL');
            CALRec.CalcFields(
                Inventory,
                "Qty. on Sales Order (CAL)",
                "Qty. to Ship",
                "Qty. to Ship (Transfer)",
                "Qty. in Transit",
                "Qty. on Purch. Order"
            );

            CALQtyOnHand := CALRec.Inventory;
            CALQtyOnSalesOrder := CALRec."Qty. on Sales Order";
            CALQtyToShip := CALRec."Qty. to Ship";
            CALQtyToShipTransfer := CALRec."Qty. to Ship (Transfer)";
            CALNetAvailabled := CALRec.Inventory - CALRec."Qty. on Sales Order (CAL)" - CALRec."Qty. to Ship";

            if CALRec."Qty. in Transit" <> 0 then begin
                CALRec.SetRange("Date Filter", BaseDate, BaseDate + 15);
                CALRec.CalcFields("Qty. in Transit");
                CAL_OnPo0_15 := CALRec."Qty. in Transit";

                CALRec.SetRange("Date Filter", BaseDate + 16, BaseDate + 30);
                CALRec.CalcFields("Qty. in Transit");
                CAL_OnPo16_30 := CALRec."Qty. in Transit";

                CALRec.SetRange("Date Filter", BaseDate + 31, BaseDate + 60);
                CALRec.CalcFields("Qty. in Transit");
                CAL_OnPo31_60 := CALRec."Qty. in Transit";

                CALRec.SetRange("Date Filter", BaseDate + 61, BaseDate + 90);
                CALRec.CalcFields("Qty. in Transit");
                CAL_OnPo61_90 := CALRec."Qty. in Transit";

                CALRec.SetFilter("Date Filter", '>%1', BaseDate + 90);
                CALRec.CalcFields("Qty. in Transit");
                CAL_OnPo91_plus := CALRec."Qty. in Transit";
            end;
        end;
    end;

}