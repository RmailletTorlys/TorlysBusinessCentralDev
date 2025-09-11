report 50012 "Summary Pick Slip"
{
    Caption = 'Summary Pick Slip';
    PreviewMode = PrintLayout;
    WordMergeDataItem = CopyLoop;
    RDLCLayout = './Sales/Reports/SummaryPickSlip.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(CopyLoop; Integer)
        {

            DataItemTableView = sorting(Number);

            dataitem(PageLoop; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                DataItemLinkReference = CopyLoop;

                dataitem(Sales_line; "Sales Line")
                {
                    DataItemTableView = sorting("Document Type", Type, "No.");
                    DataItemLinkReference = PageLoop;
                    RequestFilterFields = "Sell-to Customer No.", "LAX Ship-to Code", "Shipment Date", "Location Code", "Shipping Agent Code";
                    RequestFilterHeading = 'Summary Pick Slip';

                    column(DayOfWeek; DayOfWeek)
                    {

                    }
                    column(SalesOrderCount; SalesOrderCount)
                    {

                    }
                    column(SalesLineFilter; SalesLineFilter)
                    {

                    }
                    column(TotalWeight; TotalWeight)
                    {

                    }
                    column(OrderString1; OrderString[1])
                    {

                    }
                    column(OrderString2; OrderString[2])
                    {

                    }
                    column(OrderString3; OrderString[3])
                    {

                    }
                    column(OrderString4; OrderString[4])
                    {

                    }
                    column(OrderString5; OrderString[5])
                    {

                    }
                    column(OrderString6; OrderString[6])
                    {

                    }
                    column(PrintDate; Format(PrintDate, 0, '<month,2>/<day,2>/<year,4>'))
                    {

                    }
                    column(PrintTime; Format(PrintTime, 0, '<Hours24,2>:<Minutes,2>:<Seconds,2>'))
                    {

                    }
                    column(No_; "No.")
                    {

                    }
                    column(Description; Description)
                    {

                    }
                    column(Qty__to_Ship__Base_; "Qty. to Ship (Base)")
                    {

                    }
                    column(QtyToShipSingle; "Qty. to Ship (Base)" - (Round(("Qty. to Ship (Base)" / ItemCaseUOM."Qty. per Unit of Measure"), 1, '<') * ItemCaseUOM."Qty. per Unit of Measure"))
                    {

                    }
                    column(Qty__to_Ship_Case; Round((("Qty. to Ship (Base)" - (ItemPalletUOM."Qty. per Unit of Measure" * (Round("Qty. to Ship (Base)" / ItemPalletUOM."Qty. per Unit of Measure", 1, '<')))) / ItemCaseUOM."Qty. per Unit of Measure"), 1, '<'))
                    {

                    }
                    column(Qty__to_Ship_Pallet; Round("Qty. to Ship (Base)" / ItemPalletUOM."Qty. per Unit of Measure", 1, '<'))
                    {

                    }
                    column(BinLocation; BinLocation)
                    {

                    }

                    trigger OnPreDataItem()
                    begin
                        SalesLineFilter := Sales_line.GetFilters;

                        PrintDate := Today;
                        PrintTime := Time;

                        CurrReport.CreateTotals(ToShipSingle, ToShipCase, ToShipPallet);
                    end;

                    trigger OnAfterGetRecord()
                    begin
                        ItemCaseUOM.Get("No.", 'CASE');
                        ItemPalletUOM.Get("No.", 'PALLET');

                        //ToShipSingle := Abs("Qty. to Ship");
                        ToShipCase := Abs("Qty. to Ship Case");
                        ToShipPallet := Abs("Qty. to Ship Pallet");

                        OrderStringToUse := 1;
                        OrderString[1] := '';
                        OrderString[2] := '';
                        OrderString[3] := '';
                        OrderString[4] := '';
                        OrderString[5] := '';
                        OrderString[6] := '';

                        TotalWeight := 0;

                        salesline.Reset();
                        salesline.SetCurrentKey("Document No.");
                        salesline.SetFilter("Document Type", '%1', "Document Type"::Order);
                        salesline.SetFilter("Sell-to Customer No.", Sales_line."Sell-to Customer No.");
                        salesline.SetFilter("LAX Ship-to Code", Sales_line."LAX Ship-to Code");
                        salesline.SetRange("Shipment Date", Sales_line."Shipment Date");
                        salesline.SetRange("Location Code", Sales_line."Location Code");
                        salesline.SetRange("Shipping Agent Code", Sales_line."Shipping Agent Code");
                        salesline.SetFilter("Qty. to Ship (Base)", '>%1', 0);
                        //salesline.SetFilter(Released,'Yes');
                        If salesline.Find('-') then begin
                            repeat

                                If StrPos(OrderString[OrderStringToUse], salesline."Document No.") = 0 then begin
                                    If StrLen(OrderString[1]) > 90 then
                                        OrderStringToUse := 2;
                                    If StrLen(OrderString[2]) > 90 then
                                        OrderStringToUse := 3;
                                    If StrLen(OrderString[3]) > 90 then
                                        OrderStringToUse := 4;
                                    If StrLen(OrderString[4]) > 90 then
                                        OrderStringToUse := 5;
                                    If StrLen(OrderString[5]) > 90 then
                                        OrderStringToUse := 6;

                                    OrderString[OrderStringToUse] := OrderString[OrderStringToUse] + salesline."Document No." + '  ';
                                    TotalWeight += (salesline."Net Weight" * salesline."Qty. to Ship (Base)");
                                end;
                            Until salesline.Next = 0;
                        end;

                        BinLocation := '';
                        BinContent.Reset();
                        BinContent.SetRange("Location Code", "Location Code");
                        BinContent.SetRange("Item No.", "No.");
                        If (BinContent.Find('-')) then begin
                            repeat
                                If StrPos(BinLocation, BinContent."Bin Code") = 0 then begin
                                    BinLocation := BinLocation + ' ' + BinContent."Bin Code";
                                end
                            Until BinContent.Next = 0;
                        end;

                        IF DATE2DWY("Shipment Date", 1) = 1 THEN
                            DayOfWeek := 'Monday'
                        ELSE IF DATE2DWY("Shipment Date", 1) = 2 THEN
                            DayOfWeek := 'Tuesday'
                        ELSE IF DATE2DWY("Shipment Date", 1) = 3 THEN
                            DayOfWeek := 'Wednesday'
                        ELSE IF DATE2DWY("Shipment Date", 1) = 4 THEN
                            DayOfWeek := 'Thursday'
                        ELSE IF DATE2DWY("Shipment Date", 1) = 5 THEN
                            DayOfWeek := 'Friday'
                    end;
                }
            }

            trigger OnPreDataItem()
            begin
                NoLoops := 1 + Abs(NoCopies);
                If NoLoops <= 0 then
                    NoLoops := 1;
                CopyNo := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                CurrReport.PageNo := 1;

                If CopyNo = NoLoops then begin
                    CurrReport.Break();
                end else
                    CopyNo := CopyNo + 1;
            end;
        }
    }

    var
        salesline: Record "Sales Line";
        salesheader: Record "Sales Header";
        Item: Record Item;
        ItemCaseUOM: Record "Item Unit of Measure";
        ItemPalletUOM: Record "Item Unit of Measure";
        BinContent: Record "Bin Content";
        UOMMgt: Codeunit "Unit of Measure Management";
        OrderString: array[6] of Text;
        NoLoops: Integer;
        NoCopies: Integer;
        CopyNo: Integer;
        OrderStringToUse: Integer;
        SalesOrderCount: Integer;
        PrintDate: Date;
        PrintTime: Time;
        ToShipSingle: Decimal;
        ToShipCase: Decimal;
        ToShipPallet: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        TempQtyToShip: Decimal;
        PalletQty: Decimal;
        CalculatedCase: Decimal;
        TotalWeight: Decimal;
        CaseQty: Decimal;
        BinLocation: Code[100];
        DayOfWeek: Code[9];
        SalesLineFilter: Text;
}