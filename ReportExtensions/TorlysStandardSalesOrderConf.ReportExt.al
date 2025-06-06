reportextension 50000 "TorlysStandardSalesOrderConf" extends "Standard Sales - Order Conf."
{
    dataset
    {
        add(Line)
        {
            column(LocationCode; "Location Code")
            {

            }
            column(BaseUoM; "Unit of Measure Code")
            {

            }

            column(Qty_toShip; "Qty. to Ship")
            {

            }

            column(Shipped; "Quantity Shipped")
            {

            }

            column(Item_Description; "ItemDescription")
            {

            }

        }

        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if "Currency Code" = '' then begin
                    CurrencyCode := 'CDN'
                end else begin
                    CurrencyCode := "Currency Code"
                end;
            end;
        }

        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                If "Item Reference No." <> '' then
                    ItemDescription := (Item."Description");

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    TotalWeight += ("Net Weight" * Quantity);

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    ShipWeight += ("Net Weight" * "Qty. to Ship");

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    TotalPieces += "Quantity Case";

                If "Quantity Pallet" > 0 then Begin
                    If Type = Type::Item then Begin
                        Item.Get("No.");
                        QtyPerPallet := TorlysUOMManagement.GetQtyPerUnitOfMeasure(Item, 'PALLET');
                        QtyPerCase := TorlysUOMManagement.GetQtyPerUnitOfMeasure(Item, 'CASE');
                        TotalPieces += ("Quantity Pallet" * (QtyPerPallet / QtyPerCase));
                    End;
                End;

                If ("Quantity Case" = 0) and ("Quantity Pallet" = 0) then
                    TotalPieces += "Quantity";

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    ToShipPieces += "Qty. to Ship Case";

                If "Qty. to Ship Pallet" > 0 then Begin
                    If Type = Type::Item then Begin
                        Item.Get("No.");
                        QtyPerPallet := TorlysUOMManagement.GetQtyPerUnitOfMeasure(Item, 'PALLET');
                        QtyPerCase := TorlysUOMManagement.GetQtyPerUnitOfMeasure(Item, 'CASE');
                        ToShipPieces += ("Qty. to Ship Pallet" * (QtyPerPallet / QtyPerCase));
                    End;
                End;

                If ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then
                    ToShipPieces += "Qty. to Ship";


            End;
        }




        add(Header)
        {
            column(ShipMethod; "Transport Method")
            {

            }

            column(Shipping_Advice; "Shipping Advice")
            {

            }
        }

        add(Totals)
        {
            column(Total_Weight; TotalWeight)
            {

            }
            column(Ship_Weight; ShipWeight)
            {

            }
            column(Total_Pieces; "TotalPieces")
            {

            }
            column(ToShip_Pieces; "ToShipPieces")
            {

            }

        }


    }

    var
        TotalWeight: Decimal;
        ShipWeight: Decimal;
        TotalPieces: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        UOMMgt: Decimal;
        Item: Record Item;
        TorlysUOMManagement: Codeunit "TorlysUOMManagement";
        UnitOfMeasureCode: Code[10];
        ToShipPieces: Decimal;
        CurrencyCode: Text;
        ItemDescription: Text;


    procedure GetQtyUOM(Item: Record Item; UnitOfMeasureCode: Code[10]): Decimal
    Begin
        TorlysUOMManagement.GetQtyPerUnitOfMeasure(Item, UnitOfMeasureCode)
    End;



}