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
            trigger OnAfterAfterGetRecord()
            begin
                If "Gen. Bus. Posting Group" <> 'IFS' then
                    TotalWeight += ("Net Weight" * Quantity);

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    ShipWeight += ("Net Weight" * "Qty. to Ship");

                If "Gen. Bus. Posting Group" <> 'IFS' then
                    TotalPieces += "Quantity Case";

                //        If "Quantity Pallet" > 0 then Begin
                //            If Type = Type::Item then Begin
                //                Item.Get("No.");
                //                QtyPerPallet := GetQtyUOM(Item, 'PALLET');
                //                QtyPerCase := GetQtyUOM(Item, 'CASE');
                //                TotalPieces += TotalPieces + ("Quantity Pallet" * (QtyPerPallet / QtyPerCase));
                //            End;
                //       End;


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
        ItemUOM: Record "Item Unit of Measure";
        TorlysUOMManagement: Codeunit "TorlysUOMManagement";
        UnitOfMeasureCode: Code[10];


    procedure GetQtyUOM(Item: Record Item; UnitOfMeasureCode: Code[10]): Decimal
    Begin
        TorlysUOMManagement.GetQtyPerUnitOfMeasure(Item, UnitOfMeasureCode, ItemUOM)
    End;



}