Page 56103 salesiItem
{
    PageType = API;
    SourceTable = Item;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesItem';
    EntitySetName = 'salesItems';
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No_; Rec."No.")
                {
                    Caption = 'Item Number';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                // field(ItemCategoryCode1; '')
                // {
                //     Caption = 'Item Category Code 1 NA';
                // }

                // field(Class; '')
                // {
                //     Caption = 'Class';
                // }

                field(VendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }

                // field(BaseUnitOfMeasure; Rec."Base Unit of Measure")
                // {
                //     Caption = 'Base Unit of Measure';
                // }

                // field(ItemCategoryCode2; '')
                // {
                //     Caption = 'Item Category Code 2 NA';
                // }

                // field(Category; '')
                // {
                //     Caption = 'Category NA';
                // }

                // field(CountryOfOrigin; Rec."Country/Region of Origin Code")
                // {
                //     Caption = 'Country Of Origin';
                // }

                field(Category; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Category';
                }

                field(ItemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }

                // field(NetAvailable; '0')
                // {
                //     Caption = 'Net Available';
                // }

                // field(TOR_NetAvailable; '0')
                // {
                //     Caption = 'TOR Net Available';
                // }

                // field(TOR_QtyOnHand; '0')
                // {
                //     Caption = 'TOR Qty On Hand';
                // }

                // field(TOR_QtyOnSalesOrder; '0')
                // {
                //     Caption = 'TOR Qty On Sales Order';
                // }

                // field(TOR_QtyToShip; '0')
                // {
                //     Caption = 'TOR Qty To Ship';
                // }

                // field(TOR_QtyToShip_Transfer; '0')
                // {
                //     Caption = 'TOR Qty To Ship Transfer';
                // }

                // field(TOR_QtyInTransit_Transfer; '0')
                // {
                //     Caption = 'TOR Qty In Transit Transfer';
                // }

                // field(TOR_QtyOnPO; '0')
                // {
                //     Caption = 'TOR Qty On PO';
                // }

                // field(CAL_NetAvailable; '0')
                // {
                //     Caption = 'CAL Net Available';
                // }

                // field(CAL_QtyOnHand; '0')
                // {
                //     Caption = 'CAL Qty On Hand';
                // }

                // field(CAL_QtyOnSalesOrder; '0')
                // {
                //     Caption = 'CAL Qty On Sales Order';
                // }

                // field(CAL_QtyToShip; '0')
                // {
                //     Caption = 'CAL Qty To Ship';
                // }

                // field(CAL_QtyToShip_Transfer; '0')
                // {
                //     Caption = 'CAL Qty To Ship Transfer';
                // }

                // field(CAL_QtyInTransit_Transfer; '0')
                // {
                //     Caption = 'CAL Qty In Transit Transfer';
                // }

                // field(CAL_QtyOnPO; '0')
                // {
                //     Caption = 'CAL Qty On PO';
                // }
            }
        }
    }
    // var
    // TORRec: Record Item;
    // CALRec: Record Item;
    // NetAvailable: Decimal;
    // TorNetAvailabled: Decimal;
    // TorQtyOnHand: Decimal;
    // TorQtyOnSalesOrder: Decimal;
    // TorQtyToShip: Decimal;
    // TorQtyToShipTransfer: Decimal;
    // TORQtyInTransitTransfer: Decimal;
    // TorQtyOnPo: Decimal;
    // CALNetAvailabled: Decimal;
    // CALQtyOnHand: Decimal;
    // CALQtyOnSalesOrder: Decimal;
    // CALQtyToShip: Decimal;
    // CALQtyToShipTransfer: Decimal;
    // CALQtyInTransitTransfer: Decimal;
    // CALQtyOnPo: Decimal;

    // trigger OnAfterGetCurrRecord()
    // begin
    //     Rec.CalcFields(Rec.Inventory);
    //     NetAvailable := Rec.Inventory - Rec."Qty. to Ship" - Rec."Qty. to Ship (Transfer)";

    //     TORRec.Reset();

    //     if TORRec.Get(Rec."No.") then begin
    //         TORRec.SetFilter("Location Filter", 'TOR|TMT');
    //         TORRec.CalcFields(
    //             Inventory,
    //             "Qty. on Sales Order",
    //             "Qty. to Ship",
    //             "Qty. to Ship (Transfer)",
    //             "Qty. in Transit",
    //             "Qty. on Purch. Order"
    //         );

    //         TorQtyOnHand := TORRec.Inventory;
    //         TorQtyOnSalesOrder := TORRec."Qty. on Sales Order";
    //         TorQtyToShip := TORRec."Qty. to Ship";
    //         TorQtyToShipTransfer := TORRec."Qty. to Ship (Transfer)";
    //         TORQtyInTransitTransfer := TORRec."Qty. in Transit";
    //         TorQtyOnPo := TORRec."Qty. in Transit";

    //         TorNetAvailabled := TorQtyOnHand - TorQtyToShip - TorQtyToShipTransfer;
    //     end;

    //     CALRec.Reset();
    //     if CALRec.Get(Rec."No.") then begin
    //         CALRec.SetFilter("Location Filter", 'CAL');
    //         CALRec.CalcFields(
    //             Inventory,
    //             "Qty. on Sales Order",
    //             "Qty. to Ship",
    //             "Qty. to Ship (Transfer)",
    //             "Qty. in Transit",
    //             "Qty. on Purch. Order"
    //         );

    //         CALQtyOnHand := CALRec.Inventory;
    //         CALQtyOnSalesOrder := CALRec."Qty. on Sales Order";
    //         CALQtyToShip := CALRec."Qty. to Ship";
    //         CALQtyToShipTransfer := CALRec."Qty. to Ship (Transfer)";
    //         CALQtyInTransitTransfer := CALRec."Qty. in Transit";
    //         CALQtyOnPo := CALRec."Qty. in Transit";

    //         CALNetAvailabled := CALQtyOnHand - CALQtyToShip - CALQtyToShipTransfer;
    //     end;
    // end;
}