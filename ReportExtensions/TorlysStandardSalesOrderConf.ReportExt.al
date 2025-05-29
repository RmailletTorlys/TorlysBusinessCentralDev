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

        }

        modify(Line)
        {
            trigger OnBeforeAfterGetRecord()
            begin
                If "Gen. Bus. Posting Group" <> 'IFS' then
                    TotalWeight += "Net Weight" * "Quantity";

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    ShipWeight += "Net Weight" * "Qty. to Ship";

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    TotalPieces += "Quantity Case";
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
            column(Total_Pieces; "TotalPieces")
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
        }


    }

    var
        TotalWeight: Decimal;
        ShipWeight: Decimal;
        TotalPieces: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;


}