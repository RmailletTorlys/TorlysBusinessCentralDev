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
    var
        ItemCalc: Record Item;
    begin

        Rec.CalcFields(Inventory);
        BaseDate := WorkDate();
        NetAvailable := Rec.Inventory;

        if TORRec.Get(Rec."No.") then begin
            TORRec.SetRange("Location Filter", 'TOR|TMT');
            TORRec.CalcFields(
                Inventory,
                "Qty. on Sales Order",
                "Qty. to Ship (Transfer)",
                "Qty. in Transit",
                "Qty. on Purch. Order"

            );

            TorQtyOnHand := TORRec.Inventory;
            TorQtyOnSalesOrder := TORRec."Qty. on Sales Order";
            TorQtyToShipTransfer := TORRec."Qty. to Ship (Transfer)";
            TORQtyInTransitTransfer := TORRec."Qty. in Transit";


            TorNetAvailabled := TORRec.Inventory - TORRec."Qty. on Sales Order" - TORRec."Qty. to Ship (Transfer)";
        end;


        if CALRec.Get(Rec."No.") then begin
            CALRec.SetRange("Location Filter", 'CAL');
            CALRec.CalcFields(
                Inventory,
                "Qty. on Sales Order",
                "Qty. to Ship (Transfer)",
                "Qty. in Transit",
                "Qty. on Purch. Order"
            );

            CALQtyOnHand := CALRec.Inventory;
            CALQtyOnSalesOrder := CALRec."Qty. on Sales Order";
            CALQtyToShipTransfer := CALRec."Qty. to Ship (Transfer)";
            CALQtyInTransitTransfer := CALRec."Qty. in Transit";

            CALNetAvailabled := CALRec.Inventory - CALRec."Qty. on Sales Order" - CALRec."Qty. to Ship (Transfer)";
        end;


        ItemCalc.Get(Rec."No.");


        ItemCalc.SetRange("Date Filter", BaseDate, BaseDate + 15);
        ItemCalc.CalcFields("Qty. on Purch. Order");
        OnPo0_15 := ItemCalc."Qty. on Purch. Order";

        ItemCalc.SetRange("Date Filter", BaseDate + 16, BaseDate + 30);
        ItemCalc.CalcFields("Qty. on Purch. Order");
        OnPo16_30 := ItemCalc."Qty. on Purch. Order";


        ItemCalc.SetRange("Date Filter", BaseDate + 31, BaseDate + 60);
        ItemCalc.CalcFields("Qty. on Purch. Order");
        OnPo31_60 := ItemCalc."Qty. on Purch. Order";

        ItemCalc.SetRange("Date Filter", BaseDate + 61, BaseDate + 90);
        ItemCalc.CalcFields("Qty. on Purch. Order");
        OnPo61_90 := ItemCalc."Qty. on Purch. Order";

        ItemCalc.SetFilter("Date Filter", '>%1', BaseDate + 90);
        ItemCalc.CalcFields("Qty. on Purch. Order");
        OnPo91_plus := ItemCalc."Qty. on Purch. Order";
    end;

}