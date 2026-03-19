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
                field(Category; Rec."Item Category Code")
                {
                    Caption = 'Category';
                }

                field(Class; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Class';
                }

                field(Vendor_No_; Rec."Vendor No.")
                {
                    Caption = 'Vendor Number';
                }

                field(Base_Unit_of_Measure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }

                field(Item_Category_Code; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }

                field(Product_Group_Code; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Product Group Code';
                }

                field(Country_Region_of_Origin; Rec."Country/Region of Origin Code")
                {
                    Caption = 'Country/Region of Origin';
                }

                field(PG1; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'PG1';
                }
                field(PG2; Rec."Item Category Code")
                {
                    Caption = 'PG2';
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

                field(TOR_QtyOnPO; TorQtyOnPo)
                {
                    Caption = 'TOR Qty On PO';
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

                field(CAL_QtyOnPO; CalQtyOnPo)
                {
                    Caption = 'CAL Qty On PO';
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
        TorQtyOnPo: Decimal;
        CALNetAvailabled: Decimal;
        CALQtyOnHand: Decimal;
        CALQtyOnSalesOrder: Decimal;
        CALQtyToShip: Decimal;
        CALQtyToShipTransfer: Decimal;
        CALQtyInTransitTransfer: Decimal;
        CALQtyOnPo: Decimal;


    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields(Rec.Inventory);

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
        TorQtyOnPo := TORRec."Qty. on Purch. Order";
        CALNetAvailabled := Rec."Qty. on Hand (CAL)" - CALRec."Qty. to Ship" - CALRec."Qty. to Ship (Transfer)";
        CALQtyOnHand := Rec."Qty. on Hand (CAL)";
        CALQtyOnSalesOrder := Rec."Qty. on Sales Order (CAL)";
        CALQtyToShip := CALRec."Qty. to Ship";
        CALQtyToShipTransfer := CALRec."Qty. to Ship (Transfer)";
        CALQtyInTransitTransfer := CALRec."Qty. in Transit";
        CALQtyOnPo := CALRec."Qty. on Purch. Order";

    end;
}