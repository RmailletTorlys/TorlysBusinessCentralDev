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
            column(QtyOrd; "Quantity")
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
                    CurrencyCode := "Currency Code";

                DimMgmt.GetShortcutDimensions("Dimension Set ID", ShortCutDimCode);
            end;
        }

        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if "Gen. Bus. Posting Group" <> 'IFS' then begin
                    TotalWeight += ("Net Weight" * Quantity);
                    ShipWeight += ("Net Weight" * "Qty. to Ship");
                    TotalPieces += "Quantity Case";
                    ToShipPieces += "Qty. to Ship Case";
                end;

                if "Quantity Pallet" > 0 then begin
                    if Type = Type::Item then
                        SetQtyConst("No.");
                    TotalPieces += ("Quantity Pallet" * (QtyPerPallet / QtyPerCase));
                end;

                if ("Quantity Case" = 0) and ("Quantity Pallet" = 0) then
                    TotalPieces += "Quantity";

                if "Qty. to Ship Pallet" > 0 then begin
                    if Type = Type::Item then
                        SetQtyConst("No.");
                    ToShipPieces += ("Qty. to Ship Pallet" * (QtyPerPallet / QtyPerCase));
                end;

                if ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then
                    ToShipPieces += "Qty. to Ship";

                ParentBinLocation := '';
                ParentBinLocationLabel := '';
                ParentBinCOntent.Reset();
                ParentBinCOntent.SetRange(ParentBinCOntent."Location Code", "Location Code");
                ParentBinCOntent.SetRange(ParentBinCOntent."Item No.", "No.");
                if (ParentBinCOntent.Find('-')) then begin
                    repeat
                        if StrPos(ParentBinLocation, ParentBinCOntent."Bin Code") = 0 then
                            ParentBinLocation := CopyStr(ParentBinLocation + '  ' + ParentBinCOntent."Bin Code", 1, 100);
                    Until ParentBinCOntent.Next() = 0;
                    ParentBinLocationLabel := 'Bin(s): ';
                end;

                Clear(TempDesc);
                if "Item Reference No." <> '' then begin
                    Clear(ItemNoTemp);
                    ItemNoTemp.get("No.");
                    TempDesc := Description;
                    Description := ItemNoTemp.Description;
                    Modify();

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
            column(ShortCutDimCode; ShortCutDimCode[3])
            {

            }
            column(tagname; "Tag Name")
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
        ItemNoTemp: Record Item;
        ParentBinCOntent: Record "Bin Content";
        DimMgmt: CodeUnit DimensionManagement;
        // UoMHelper: CodeUnit "Quantity Rounding Helper";
        UOMMgt: Codeunit "Unit of Measure Management";
        TotalWeight: Decimal;
        ShipWeight: Decimal;
        TotalPieces: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        ToShipPieces: Decimal;
        QtyOrd: Decimal;
        CurrencyCode: Text;
        TempDesc: Text;
        ItemDescription: Text;
        ParentBinLocationLabel: Text;
        ParentBinLocation: Code[100];
        ShortCutDimCode: array[8] of Code[20];


    procedure SetQtyConst(No_: Code[20])
    begin
        Item.Get(No_);
        // QtyPerPallet := UoMHelper.GetQuantityUoM(Item."No.", 'PALLET');
        // QtyPerCase := UoMHelper.GetQuantityUoM(Item."No.", 'CASE');
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
    end;

}