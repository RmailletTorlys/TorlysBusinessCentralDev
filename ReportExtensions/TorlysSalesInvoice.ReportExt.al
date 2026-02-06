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
            column(Unit_of_Measure_Code; "Unit of Measure Code")
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
            column(TempDesc; TempDesc)
            {

            }
            column(refitem; refitem)
            {

            }
        }

        add(Header)
        {
            column(ShortCutDimCode; ShortCutDimCode[3])
            {

            }
            column(currencycode1; currcode)
            {

            }
            column(tagname; "Tag Name")
            {

            }
            column(billtoaddrTly1; billtoaddrTly[1])
            { }
            column(billtoaddrTly2; billtoaddrTly[2])
            { }
            column(billtoaddrTly3; billtoaddrTly[3])
            { }
            column(billtoaddrTly4; billtoaddrTly[4])
            { }
            column(billtoaddrTly5; billtoaddrTly[5])
            { }
            column(billtoaddrTly6; billtoaddrTly[6])
            { }
            column(billtoaddrTly7; billtoaddrTly[7])
            { }
            column(billtoaddrTly8; billtoaddrTly[8])
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

        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin

                DimMgmt.GetShortcutDimensions("Dimension Set ID", ShortCutDimCode);
                billaddr(billtoaddrTly, Header);
                ShipAddrTly(ShipToAddrTly, Header);

                if "Currency Code" = '' then
                    currcode1 := 'CAD' else
                    currcode1 := "Currency Code"
            end;
        }

        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                DescToPrint := Description + ' ' + "Description 2";
                TempDesc := '';
                refitem := '';


                // Clear(TempDesc);
                // If tempsalesline."Item Reference No." <> '' then begin
                //     Clear(tempitem);
                //     tempitem.get(tempsalesline."No.");
                //     TempDesc := tempsalesline.Description;
                //     tempsalesline.Description := tempitem.Description;
                //     tempsalesline.Modify();
                // Modify();
                // end;

                If ("No." <> '') and ("Item Reference No." <> '') then begin
                    Clear(tempcrossrefitem);
                    tempcrossrefitem.SetFilter("Item No.", "No.");
                    tempcrossrefitem.SetFilter("Reference Type", 'Customer');
                    If tempcrossrefitem.find('-') then
                        tempsalesline."No." := tempcrossrefitem."Reference No.";
                    TempDesc := tempcrossrefitem.Description;
                    refitem := tempcrossrefitem."Reference No.";
                end;

                OrderedQuantity := 0;
                if (Type = Type::Item) OR (Type = Type::"G/L Account") then
                    if "Order No." = '' then
                        OrderedQuantity := Quantity
                    else
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
        tempsalesline: Record "Sales Invoice Line" temporary;
        tempitem: Record Item;
        tempcrossrefitem: Record "Item Reference";
        OrderedQuantity: Decimal;
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        ShipQty: Decimal;
        TempDesc: Text;
        refitem: code[50];
        DescToPrint: Text;
        currcode1: Text;
        ShortCutDimCode: array[8] of Code[20];
        billtoaddrTly: array[8] of Text;
        ShipToAddrTly: array[8] of Text;
        FormatAddr1: Codeunit "Format Address";

    local procedure billaddr(var AddrArray: array[8] of Text[100]; var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
    begin
        FormatAddr1.FormatAddr(
            AddrArray, '', SalesInvoiceHeader."Bill-to Name", SalesInvoiceHeader."Bill-to Name 2", SalesInvoiceHeader."Bill-to Address", SalesInvoiceHeader."Bill-to Address 2",
            SalesInvoiceHeader."Bill-to City", SalesInvoiceHeader."Bill-to Post Code", '', SalesInvoiceHeader."Bill-to Country/Region Code");
    end;

    local procedure ShipAddrTly(var AddrArray: array[8] of Text[100]; var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
    begin
        FormatAddr1.FormatAddr(
            AddrArray, '', SalesInvoiceHeader."Ship-to Name", SalesInvoiceHeader."Ship-to Name 2", SalesInvoiceHeader."Ship-to Address", SalesInvoiceHeader."Ship-to Address 2",
            SalesInvoiceHeader."Ship-to City", SalesInvoiceHeader."Ship-to Post Code", '', SalesInvoiceHeader."Ship-to Country/Region Code");
    end;
}