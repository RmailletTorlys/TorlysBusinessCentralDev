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
            column(LineTotalWeight; ("Net Weight" * "Qty. to Ship"))
            {

            }

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


    }


}