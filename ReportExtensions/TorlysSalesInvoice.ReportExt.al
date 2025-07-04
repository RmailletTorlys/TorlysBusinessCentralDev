reportextension 50100 "TorlysSalesInvoice" extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Line)
        {
            column(locationcode; "Location Code")
            {

            }
            column(OrderedQuantity; OrderedQuantity)
            {

            }
            column(UnitPriceToPrint; UnitPriceToPrint)
            {

            }
            column(Descoprint; DescToPrint)
            {

            }
            column(ShipQty; "Quantity")
            {

            }
        }

        add(Header)
        {
            column(ShortCutDimCode; ShortCutDimCode[3])
            {

            }
            column(TempDesc; TempDesc)
            {

            }
            column(currencycode1; currcode)
            {

            }
            // column(tagname; "Tag Name")
            // {

            // }

        }

        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                DimMgmt.GetShortcutDimensions("Dimension Set ID", ShortCutDimCode);

                if "Currency Code" = '' then
                    currcode1 := 'CDN' else
                    currcode1 := "Currency Code"
            end;
        }

        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                DescToPrint := Description + ' ' + "Description 2";

                Clear(TempDesc);
                If "Item Reference No." <> '' then begin
                    Clear(ItemNoTemp);
                    ItemNoTemp.get("No.");
                    TempDesc := Description;
                    Description := ItemNoTemp.Description;
                    Modify();
                end;

                OrderedQuantity := 0;
                if (Type = Type::Item) OR (Type = Type::"G/L Account") then begin
                    if "Order No." = '' then
                        OrderedQuantity := Quantity
                    else begin
                        If OrderLine.Get(1, "Order No.", "Line No.") then
                            OrderedQuantity := OrderLine.Quantity
                        else begin
                            ShipLine.SetRange("Order No.", "Order No.");
                            ShipLine.SetRange("Order Line No.", "Line No.");
                            if ShipLine.FIND('-') then;
                            repeat
                                OrderedQuantity := OrderedQuantity + ShipLine.Quantity;
                            until 0 = ShipLine.Next();
                        end;
                    end;
                end;

                AmountExclInvDisc := Amount + "Inv. Discount Amount";

                If Quantity = 0 then
                    UnitPriceToPrint := 0
                else
                    UnitPriceToPrint := Round(AmountExclInvDisc / Quantity, 0.01);
            end;
        }
    }

    var
        ItemNoTemp: Record Item;
        OrderLine: Record "Sales Line";
        ShipLine: Record "Sales Shipment Line";
        DimMgmt: CodeUnit DimensionManagement;
        OrderedQuantity: Decimal;
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        ShipQty: Decimal;
        TempDesc: Text;
        DescToPrint: Text;
        currcode1: Text;
        ShortCutDimCode: array[8] of Code[20];
}