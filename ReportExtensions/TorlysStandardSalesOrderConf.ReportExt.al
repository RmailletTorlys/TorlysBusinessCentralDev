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
                    CurrencyCode := 'CAD'
                else
                    CurrencyCode := "Currency Code";

                DimMgmt.GetShortcutDimensions("Dimension Set ID", ShortCutDimCode);
                selladdr(selltoaddr, Header);
                ShipAddrTly(ShipToAddrTly, Header);

                if "MK Required" then
                    MKREQUIRED := 'MK REQUIRED'
                else
                    MKREQUIRED := '';

                if "MK Staged" then
                    MKSTAGED := 'MK STAGED'
                else
                    MKSTAGED := '';

                mklocationtext := 'MK STAGED LOCATION';
                if "MK Staged" then
                    MKlocation := mklocationtext + ' : ' + "MK Staged Location"
                else
                    MKlocation := '';

                mkquantitytest := 'MK STAGED QUANTITY';
                mkquantity1 := "MK Staged Quantity";
                if "MK Staged" then
                    mkqyantity := mkquantitytest + ' : ' + mkquantity1.ToText()
                else
                    mkqyantity := '';


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
            column(ShipMethod; "shipping agent code")
            {

            }
            column(MK_Required; "MK Required")
            {

            }
            column(MK_Staged; "MK Staged")
            {

            }
            column(mkqyantity; mkqyantity)
            { }
            column(MKlocation; MKlocation)
            { }
            column(MKREQUIRED; MKREQUIRED)
            { }
            column(MKSTAGED; MKSTAGED)
            { }
            column(MK_Staged_Location; "MK Staged Location")
            {

            }
            column(MK_Staged_Quantity; "MK Staged Quantity")
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
            column(selltoaddr1; selltoaddr[1])
            { }
            column(selltoaddr2; selltoaddr[2])
            { }
            column(selltoaddr3; selltoaddr[3])
            { }
            column(selltoaddr4; selltoaddr[4])
            { }
            column(selltoaddr5; selltoaddr[5])
            { }
            column(selltoaddr6; selltoaddr[6])
            { }
            column(selltoaddr7; selltoaddr[7])
            { }
            column(selltoaddr8; selltoaddr[8])
            { }

            column(ShipToAddrTly1; ShipToAddrTly[1])
            { }
            column(ShipToAddrTly2; ShipToAddrTly[2])
            { }
            column(ShipToAddrTly3; ShipToAddrTly[3])
            { }
            column(ShipToAddrTly4; ShipToAddrTly[4])
            { }
            column(ShipToAddrTly5; ShipToAddrTly[5])
            { }
            column(ShipToAddrTly6; ShipToAddrTly[6])
            { }
            column(ShipToAddrTly7; ShipToAddrTly[7])
            { }
            column(ShipToAddrTly8; ShipToAddrTly[8])
            { }
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
        selltoaddr: array[8] of Text;
        ShipToAddrTly: array[8] of Text;
        FormatAddr1: Codeunit "Format Address";
        MKREQUIRED: text;
        MKSTAGED: Text;
        MKlocation: text;
        mkqyantity: text;
        mkquantity1: Decimal;
        mklocationtext: text;
        mkquantitytest: Text;


    procedure SetQtyConst(No_: Code[20])
    begin
        Item.Get(No_);
        // QtyPerPallet := UoMHelper.GetQuantityUoM(Item."No.", 'PALLET');
        // QtyPerCase := UoMHelper.GetQuantityUoM(Item."No.", 'CASE');
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
    end;

    local procedure selladdr(var AddrArray: array[8] of Text[100]; var SalesHeader: Record "Sales Header")
    var
    begin
        FormatAddr1.FormatAddr(
            AddrArray, '', '', SalesHeader."Sell-to Customer Name", SalesHeader."Sell-to Address", SalesHeader."Sell-to Address 2",
            SalesHeader."Sell-to City", SalesHeader."Sell-to Post Code", '', SalesHeader."Sell-to Country/Region Code");
    end;

    local procedure ShipAddrTly(var AddrArray: array[8] of Text[100]; var SalesHeader: Record "Sales Header")
    var
    begin
        FormatAddr1.FormatAddr(
            AddrArray, '', '', SalesHeader."Ship-to Name", SalesHeader."Ship-to Address", SalesHeader."Ship-to Address 2",
            SalesHeader."Ship-to City", SalesHeader."Ship-to Post Code", '', SalesHeader."Ship-to Country/Region Code");
    end;
}