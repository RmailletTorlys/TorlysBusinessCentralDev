report 50025 "Pre-Receiving Report PO"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/Pre-ReceivingReportPO.rdlc';
    Caption = 'Pre-Receiving Report PO';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = sorting("Booking No.") where("Document Type" = filter(Order), Type = Filter(Item | "G/L Account"));
            RequestFilterFields = "Document No.", "Expected Receipt Date", "Booking No.";

            dataitem(Pageloop; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                DataItemLinkReference = "Purchase Line";

                trigger OnAfterGetRecord()
                begin
                    If "Purchase Line".Type = "Purchase Line".Type::Item then
                        ItemNumber := "Purchase Line"."No.";
                    Quantity := "Purchase Line".Quantity;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                If HideQuantities then begin
                    QtyCase := 0;
                    QtyPallet := 0;
                    QtyBase := 0;
                end else begin
                    QtyCase := "Purchase Line"."Quantity Case";
                    QtyPallet := "Purchase Line"."Quantity Pallet";
                    QtyBase := "Purchase Line"."Quantity (Base)";
                end;

                BinLocation := '';
                BinContent.Reset();
                BinContent.SetRange("Location Code", "Location Code");
                BinContent.SetRange("Item No.", "No.");
                if (BinContent.Find('-')) then begin
                    repeat
                        If StrPos(BinLocation, BinContent."Bin Code") = 0 then begin
                            BinLocation := BinLocation + ' ' + BinContent."Bin Code";
                        end;
                    until BinContent.Next = 0;
                end;

                if "Buy-from Vendor No." = 'A197' then
                    CommentLabel := 'Comment(s) / Off Cuts'
                else
                    CommentLabel := 'Comment(s)';
            end;
        }
    }
    var
        Vendor: Record Vendor;
        BinContent: Record "Bin Content";
        HideQuantities: Boolean;
        ItemNumber: Code[20];
        CartageCompany: Code[20];
        BinLocation: Code[200];
        AppointDate: Date;
        AppointTime: Time;
        Quantity: Integer;
        QtyCase: Integer;
        QtyPallet: Integer;
        QtyBase: Decimal;
        PalletQty: Integer;
        CommentLabel: Text;
}