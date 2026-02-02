report 50021 "Summary PickSlip"
{
    Caption = 'Summary Pick Slip';
    PreviewMode = PrintLayout;
    WordMergeDataItem = CopyLoop;
    RDLCLayout = './Sales/Reports/SummaryPickSlip.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(CopyLoop; Integer)
        {

            DataItemTableView = sorting(Number);

            dataitem(PageLoop; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                DataItemLinkReference = CopyLoop;

                dataitem("Sales Header"; "Sales Header")
                {
                    // DataItemTableView = sorting("No.", "Document Type");
                    DataItemTableView = where("Qty. to Ship" = filter(> 0), Status = const(Released), "On Hold" = filter(''));
                    DataItemLinkReference = PageLoop;
                    RequestFilterFields = "Sell-to Customer No.", "Ship-to Code", "Shipment Date", "Location Code", "Shipping Agent Code", "No. Pick Slips Printed";
                    RequestFilterHeading = 'Summary Pick Slip';

                    dataitem("Shipping Agent"; "Shipping Agent")
                    {
                        DataItemLink = Code = field("Shipping Agent Code");
                        DataItemLinkReference = "sales Header";

                        column(Agent_No_; "Agent No.")
                        {

                        }
                    }

                    column(SalesHeaderFilter; SalesHeaderFilter)
                    {

                    }
                    column(PrintDate; Format(PrintDate, 0, '<month,2>/<day,2>/<year,4>'))
                    {

                    }
                    column(Shipping_Agent_Code; "Shipping Agent Code")
                    {

                    }
                    column(PrintTime; Format(PrintTime, 0, '<Hours24,2>:<Minutes,2>:<Seconds,2>'))
                    {

                    }
                    column(DayOfWeek; DayOfWeek)
                    {

                    }
                    column(SalesOrderCount; SalesOrderCount)
                    {

                    }
                    column(OrderString; OrderString)
                    {

                    }

                    dataitem(Sales_line; "Sales Line")
                    {
                        DataItemTableView = sorting("Document Type", Type, "No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemLink = "Document No." = field("No.");

                        column(TotalWeight; TotalWeight)
                        {

                        }
                        column(No_; "No.")
                        {

                        }
                        column(ToShipCase; ToShipCase)
                        {

                        }
                        column(ToShipSingle; ToShipSingle)
                        {

                        }
                        column(ToShipPallet; ToShipPallet)
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
                        column(ParentBinLocationLabel; ParentBinLocationLabel)
                        {

                        }
                        column(BinLocation; BinLocation)
                        {

                        }
                        column(ItemNoCount; ItemNoCount)
                        {

                        }


                        trigger OnAfterGetRecord()
                        begin
                            // If ("Gen. Prod. Posting Group" = 'MOULDINGS') then
                            //     IF ("Item Category Code" <> 'ACC-86') AND (Sales_line."Item Category Code" <> 'ACC-107') AND
                            //     ("Item Category Code" <> 'ACC-108') THEN BEGIN
                            //         //"To Ship - Singles" := 0;
                            //         "Qty. to Ship Case" := 0;
                            //         "Qty. to Ship Pallet" := 0
                            //     end;

                            // IF "Gen. Prod. Posting Group" = 'MQ MOULDINGS' THEN BEGIN
                            //     //"To Ship - Singles" := 0;
                            //     "Qty. to Ship Case" := 0;
                            //     "Qty. to Ship Pallet" := 0
                            // END;

                            // IF "Gen. Prod. Posting Group" = 'SS MOULDINGS' THEN BEGIN
                            //     //"To Ship - Singles" := 0;
                            //     "Qty. to Ship Case" := 0;
                            //     "Qty. to Ship Pallet" := 0
                            // END;

                            // IF "Gen. Prod. Posting Group" = 'UNDERLAYMENT' THEN BEGIN
                            //     //"To Ship - Singles" := 0;
                            //     "Qty. to Ship Case" := 0;
                            //     "Qty. to Ship Pallet" := 0
                            // END;

                            If ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then begin
                                ToShipSingle := Abs("Qty. to Ship (Base)");
                                ToShipCase := 0;
                                ToShipPallet := 0;
                            end;

                            If ("Qty. to Ship Case" > 0) or ("Qty. to Ship Pallet" > 0) then begin
                                ItemCaseUOM.Get("No.", 'CASE');
                                ItemPalletUOM.Get("No.", 'PALLET');
                                ToShipSingle := "Qty. to Ship" -
                    (ToShipCase * ItemCaseUOM."Qty. per Unit of Measure") -
                    (ToShipPallet * ItemPalletUOM."Qty. per Unit of Measure");
                                ToShipCase := Abs("Qty. to Ship Case");
                                ToShipPallet := Abs("Qty. to Ship Pallet");
                            end;

                            TotalWeight := 0;

                            TotalWeight += ("Net Weight" * "Qty. to Ship (Base)");

                            BinLocation := '';
                            BinContent.Reset();
                            BinContent.SetRange("Location Code", "Location Code");
                            BinContent.SetRange("Item No.", "No.");
                            If (BinContent.Find('-')) then begin
                                repeat
                                    If StrPos(BinLocation, BinContent."Bin Code") = 0 then
                                        BinLocation := CopyStr(BinLocation + ' ' + BinContent."Bin Code", 1, 100);
                                Until BinContent.Next() = 0;
                                ParentBinLocationLabel := 'Bin Location: ';
                            end;

                            ItemNoCount := Sales_line.Count;
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        SalesHeaderFilter := "Sales Header".GetFilters;

                        PrintDate := Today;
                        PrintTime := Time;

                    end;

                    trigger OnAfterGetRecord()
                    begin
                        OrderString += "No." + ' ';

                        SalesOrderCount := "Sales Header".Count;

                        CASE DATE2DWY("Shipment Date", 1) OF
                            1:
                                DayOfWeek := 'Monday';
                            2:
                                DayOfWeek := 'Tuesday';
                            3:
                                DayOfWeek := 'Wednesday';
                            4:
                                DayOfWeek := 'Thursday';
                            5:
                                DayOfWeek := 'Friday';
                        END;
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

                If CopyNo = NoLoops then
                    CurrReport.Break()
                else
                    CopyNo := CopyNo + 1;
            end;
        }
    }

    var
        salesline: Record "Sales Line";
        ItemCaseUOM: Record "Item Unit of Measure";
        ItemPalletUOM: Record "Item Unit of Measure";
        BinContent: Record "Bin Content";


        OrderString: text[1000];
        NoLoops: Integer;
        NoCopies: Integer;
        CopyNo: Integer;
        SalesOrderCount: Integer;
        PrintDate: Date;
        PrintTime: Time;
        ToShipSingle: Decimal;
        ToShipCase: Decimal;
        ToShipPallet: Decimal;
        TotalWeight: Decimal;
        BinLocation: Code[100];
        DayOfWeek: Code[9];
        SalesHeaderFilter: Text;
        ParentBinLocationLabel: Text;
        previosfieldvalue: Text;
        ItemNoCount: Integer;
}