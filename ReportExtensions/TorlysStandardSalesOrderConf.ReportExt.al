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
                TotalWeight += "Net Weight" * "Qty. to Ship";
            end;


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
        }


    }

    var
        TotalWeight: Decimal;


}