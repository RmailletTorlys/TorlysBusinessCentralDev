report 50007 "Summary Pick Slip Transfer TLY"
{
    Caption = 'Summary Pick Slip Transfer TLY';
    PreviewMode = PrintLayout;
    WordMergeDataItem = CopyLoop;
    RDLCLayout = './Sales/Reports/SummaryPickSlipTransferTLY.rdl';
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

                dataitem("Transfer Header"; "Transfer Header")
                {
                    DataItemLinkReference = PageLoop;
                    RequestFilterFields = "Transfer-from Code", "Transfer-to Code", "Shipment Date", "No.";
                    RequestFilterHeading = 'Summary Pick Slip Transfer TLY';

                    column(OrderString; OrderString)
                    {

                    }
                    column(TransferHeaderFilter; TransferHeaderFilter)
                    {

                    }
                    column(TransferOrderCount; TransferOrderCount)
                    {

                    }
                    column(PrintDate; Format(PrintDate, 0, '<month,2>/<day,2>/<year,4>'))
                    {

                    }
                    column(PrintTime; Format(PrintTime, 0, '<Hours24,2>:<Minutes,2>:<Seconds,2>'))
                    {

                    }

                    dataitem(Transfer_Line; "Transfer Line")
                    {
                        DataItemTableView = sorting("document No.");
                        DataItemLinkReference = "Transfer Header";
                        DataItemLink = "Document No." = field("No.");


                        column(Item_No_; "Item No.")
                        {

                        }
                        column(Description; Description)
                        {

                        }
                        column(BinLocation; BinLocation)
                        {

                        }
                        column(Qty__to_Ship__Base_; "Qty. to Ship (Base)")
                        {

                        }
                        column(ToShipSingles; "Qty. to Ship (Base)" - (Round("Qty. to Ship (Base)" / ItemCaseUOM."Qty. per Unit of Measure", 1, '<') * ItemCaseUOM."Qty. per Unit of Measure"))
                        {

                        }
                        column(ToShipCase; Round((("Qty. to Ship (Base)" - (ItemPalletUOM."Qty. per Unit of Measure" * (Round("Qty. to Ship (Base)" / ItemPalletUOM."Qty. per Unit of Measure", 1, '<')))) / ItemCaseUOM."Qty. per Unit of Measure"), 1, '<'))
                        {

                        }
                        column(ToShipPallet; Round("Qty. to Ship (Base)" / ItemPalletUOM."Qty. per Unit of Measure", 1, '<'))
                        {

                        }
                        column(TotalWeight; TotalWeight)
                        {

                        }
                        column(ToShipWeight; ToShipWeight)
                        {

                        }
                        column(ToReceiveWeight; ToReceiveWeight)
                        {

                        }


                        // trigger OnPreDataItem()
                        // begin
                        //     TransferLineFilter := "transfer_line".GetFilters;

                        //     PrintDate := Today;
                        //     PrintTime := Time;

                        //     CurrReport.CreateTotals(ToShipSingles, ToShipCase, ToShipPallet);
                        // end;

                        trigger OnAfterGetRecord()
                        begin
                            ItemCaseUOM.Get("Item No.", 'CASE');
                            ItemPalletUOM.Get("Item No.", 'PALLET');

                            If ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then begin
                                ToShipSingles := Abs("Qty. to Ship (Base)");
                                ToShipCase := 0;
                                ToShipPallet := 0;
                            end;

                            If ("Qty. to Ship Case" > 0) or ("Qty. to Ship Pallet" > 0) then begin
                                ToShipSingles := 0;
                                ToShipCase := Abs("Qty. to Ship Case");
                                ToShipPallet := Abs("Qty. to Ship Pallet");
                            end;

                            TotalWeight := 0;
                            ToShipWeight := 0;
                            ToReceiveWeight := 0;

                            TotalWeight += ("Net Weight" * "Quantity (Base)");
                            ToShipWeight += ("Net Weight" * "Qty. to Ship (Base)");
                            ToReceiveWeight += ("Net Weight" * "Qty. to Receive (Base)");

                            BinLocation := '';
                            BinContent.Reset();
                            BinContent.SetRange("Location Code", "Transfer-from Code");
                            BinContent.SetRange("Item No.", "Item No.");
                            If (BinContent.Find('-')) then
                                repeat
                                    if StrPos(BinLocation, BinContent."Bin Code") = 0 then
                                        BinLocation := BinLocation + ' ' + BinContent."Bin Code"
                                until BinContent.Next() = 0;

                            ItemNoCount := Transfer_Line.Count;
                        end;

                    }
                    dataitem(InventoryCommnetLine; "Inventory Comment Line")
                    {
                        column(No_; "No.")
                        {

                        }
                        column(Comment; Comment)
                        {

                        }
                    }

                    trigger OnPreDataItem()
                    begin
                        TransferHeaderFilter := "Transfer Header".GetFilters;

                        PrintDate := Today;
                        PrintTime := Time;
                    end;

                    trigger OnAfterGetRecord()
                    begin
                        OrderString += "No." + ' ';

                        TransferOrderCount := "Transfer Header".Count;
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

        ItemCaseUOM: Record "Item Unit of Measure";
        ItemPalletUOM: Record "Item Unit of Measure";
        BinContent: Record "Bin Content";
        TransferHeaderFilter: Text;
        OrderString: text[600];
        BinLocation: Text;
        ToShipSingles: Decimal;
        ToShipCase: Decimal;
        ToShipPallet: Decimal;
        TotalWeight: Decimal;
        ToShipWeight: Decimal;
        ToReceiveWeight: Decimal;
        TransferOrderCount: Integer;
        CopyNo: Integer;
        NoLoops: Integer;
        NoCopies: Integer;
        ItemNoCount: Integer;
        PrintDate: Date;
        PrintTime: Time;
}
