report 50007 "Summary Pick Slip Transfer TLY"
{
    Caption = 'Summary Pick Slip Transfer TLY';
    PreviewMode = PrintLayout;
    WordMergeDataItem = Transfer_Line;
    RDLCLayout = './Sales/Reports/SummaryPickSlipTransferTLY.rdl';
    UsageCategory = ReportsAndAnalysis;


    dataset
    {
        dataitem(Transfer_Line; "Transfer Line")
        {
            DataItemTableView = sorting("Document No.");
            RequestFilterFields = "Document No.";
            RequestFilterHeading = 'Summary Pick Slip Transfer TLY';

            column(PrintDate; Format(PrintDate, 0, '<month,2>/<day,2>/<year,4>'))
            {

            }
            column(PrintTime; Format(PrintTime, 0, '<Hours24,2>:<Minutes,2>:<Seconds,2>'))
            {

            }
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
            column(TransferLineFilter; TransferLineFilter)
            {

            }

            trigger OnPreDataItem()
            begin
                TransferLineFilter := "transfer_line".GetFilters;

                PrintDate := Today;
                PrintTime := Time;

                CurrReport.CreateTotals(ToShipSingles, ToShipCase, ToShipPallet);
            end;

            trigger OnAfterGetRecord()
            begin
                ItemCaseUOM.Get("Item No.", 'CASE');
                ItemPalletUOM.Get("Item No.", 'PALLET');

                ToShipSingles := Abs("Qty. to Ship");
                ToShipCase := Abs("Qty. to Ship Case");
                ToShipPallet := Abs("Qty. to Ship Pallet");

                TotalWeight += ("Net Weight" * Quantity);
                ToShipWeight += ("Net Weight" * "Qty. to Ship");
                ToReceiveWeight += ("Net Weight" * "Qty. to Receive");

                BinLocation := '';
                BinContent.Reset();
                BinContent.SetRange("Location Code", "Transfer-from Code");
                BinContent.SetRange("Item No.", "Item No.");
                If (BinContent.Find('-')) then begin
                    repeat
                        if StrPos(BinLocation, BinContent."Bin Code") = 0 then begin
                            BinLocation := BinLocation + ' ' + BinContent."Bin Code";
                        end;
                    until BinContent.Next = 0;
                end;
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
    }

    var
        Transferline: Record "Sales Line";
        ItemCaseUOM: Record "Item Unit of Measure";
        ItemPalletUOM: Record "Item Unit of Measure";
        BinContent: Record "Bin Content";
        Item: Record Item;
        UOMMgt: Codeunit "Unit of Measure Management";
        TransferLineFilter: Text;
        BinLocation: Text;
        ToShipSingles: Decimal;
        ToShipCase: Decimal;
        ToShipPallet: Decimal;
        TotalWeight: Decimal;
        ToShipWeight: Decimal;
        ToReceiveWeight: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        PalletQty: Decimal;
        CaseQty: Decimal;
        CalculatedCase: Decimal;
        PrintDate: Date;
        PrintTime: Time;
}
