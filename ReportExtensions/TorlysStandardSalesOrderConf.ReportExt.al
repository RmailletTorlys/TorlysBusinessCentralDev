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

            column(ParentBinLocationLabel; "ParentBinLocationLabel")
            {

            }

            column(ParentBinLocation; "ParentBinLocation")
            {

            }

            column(TempDesc; "TempDesc")
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

                If "Qty. to Ship Pallet" > 0 then
                    If Type = Type::Item then
                        IncrementTotalPieces("No.", "Quantity Pallet", 2);

                If ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then
                    ToShipPieces += "Qty. to Ship";

                ParentBinLocation := '';
                ParentBinLocationLabel := '';
                ParentBinCOntent.Reset;
                ParentBinCOntent.SetRange(ParentBinCOntent."Location Code", "Location Code");
                ParentBinCOntent.SetRange(ParentBinCOntent."Item No.", "No.");
                If (ParentBinCOntent.Find('-')) then begin
                    repeat
                        if StrPos(ParentBinLocation, ParentBinCOntent."Bin Code") = 0 then begin
                            ParentBinLocation := ParentBinLocation + '  ' + ParentBinCOntent."Bin Code";
                        end;
                    Until ParentBinCOntent.Next = 0;
                    ParentBinLocationLabel := 'Bin(s): ';
                end;

                Clear(TempDesc);
                If "Item Reference No." <> '' then begin
                    Clear(ItemNoTemp);
                    ItemNoTemp.get("No.");
                    TempDesc := Description;
                    Description := ItemNoTemp.Description;
                    Modify;

                end;

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
        ItemNoTemp: Record Item;
        TempDesc: Text;
        ItemDescription: Text;
        ParentBinCOntent: Record "Bin Content";
        ParentBinLocationLabel: Text;
        ParentBinLocation: Code[100];


    procedure GetQtyUOM(Item: Record Item; UnitOfMeasureCode: Code[10]): Decimal
    Begin
        TorlysUOMManagement.GetQtyPerUnitOfMeasure(Item, UnitOfMeasureCode)
    End;



}