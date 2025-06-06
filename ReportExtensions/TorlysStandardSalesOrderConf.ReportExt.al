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
                if "Currency Code" = '' then
                    CurrencyCode := 'CDN'
                else
                    CurrencyCode := "Currency Code"
            end;
        }

        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                If "Item Reference No." <> '' then
                    ItemDescription := (Item."Description");

                If "Quantity Pallet" > 0 then
                    If Type = Type::Item then
                        IncrementTotalPieces("No.", "Quantity Pallet", 1);


                If ("Quantity Case" = 0) and ("Quantity Pallet" = 0) then
                    TotalPieces += "Quantity";

                If "Qty. to Ship Pallet" > 0 then
                    If Type = Type::Item then
                        IncrementTotalPieces("No.", "Quantity Pallet", 2);

                If ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then
                    ToShipPieces += "Qty. to Ship";

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    TotalWeight += ("Net Weight" * Quantity);
                ShipWeight += ("Net Weight" * "Qty. to Ship");
                TotalPieces += "Quantity Case";
                ToShipPieces += "Qty. to Ship Case";


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
        Item: Record Item;
        QtyRoundingHelper: Codeunit "Quantity Rounding Helper";
        TotalWeight: Decimal;
        ShipWeight: Decimal;
        TotalPieces: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        ToShipPieces: Decimal;
        CurrencyCode: Text;
        ItemDescription: Text;

    procedure IncrementTotalPieces(itemNo: Code[20]; QtyPallet: Decimal; fieldId: Integer): Decimal
    begin

        QtyPerPallet := QtyRoundingHelper.GetQuantityUoM(itemNo, 'PALLET');
        QtyPerCase := QtyRoundingHelper.GetQuantityUoM(itemNo, 'CASE');

        CASE (fieldId) OF
            1:
                TotalPieces += (QtyPallet * (QtyPerPallet / QtyPerCase));
            2:
                ToShipPieces += (QtyPallet * (QtyPerPallet / QtyPerCase));
        end;
    end;




}