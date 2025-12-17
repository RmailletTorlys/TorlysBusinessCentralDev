report 50019 "Pre-Receiving Report - Trans"
{
    Caption = 'Pre-Receiving Report - Trans';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Transfer Line";
    RDLCLayout = './Sales/Reports/Pre-ReceivingReport-Trans.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Transfer Line"; "Transfer Line")
        {
            DataItemTableView = sorting("Item No.") where("Item No." = filter(<> ''), "Derived From Line No." = filter(0));
            RequestFilterFields = "TPS CMG Container No.", "Document No.";

            trigger OnAfterGetRecord()
            begin
                // transferheader.get("Boo")
                If HideQuantities then begin
                    QtyCase := 0;
                    QtyPallet := 0;
                    QtyBase := 0;
                end else begin
                    QtyCase := "Transfer Line"."Quantity Case";
                    QtyPallet := "Transfer Line"."Quantity Pallet";
                    QtyBase := "Transfer Line"."Quantity (Base)";
                    If (QtyCase = 0) and (QtyPallet = 0) then
                        QtyBase := Quantity;
                end;

                BinLocation := '';
                BinContent.Reset();
                BinContent.SetRange("Location Code", "Transfer-to Code");
                BinContent.SetRange("Item No.", "Item No.");
                if (BinContent.Find('-')) then begin
                    repeat
                        If StrPos(BinLocation, BinContent."Bin Code") = 0 then begin
                            BinLocation := BinLocation + ' ' + BinContent."Bin Code";
                        end;
                    until BinContent.Next = 0;
                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(Grouped; Grouped)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }
            }
        }
    }
    var
        Vendor: Record Vendor;
        transferheader: Record "Transfer Header";
        BinContent: Record "Bin Content";
        HideQuantities: Boolean;
        ItemNumber: Code[20];
        CartageCompany: Code[20];
        BinLocation: Code[200];
        AppointDate: Date;
        AppointTime: Time;
        Quantity: Decimal;
        QtyCase: Decimal;
        QtyPallet: Decimal;
        QtyBase: Decimal;
        PalletQty: Integer;
        CommentLabel: Text;
        Grouped: Boolean;
        BookingNO: code[25];

}