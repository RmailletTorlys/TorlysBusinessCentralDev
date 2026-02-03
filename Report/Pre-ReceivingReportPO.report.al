report 50025 "Receiving Report PO"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/ReceivingReportPO.rdlc';
    Caption = 'Receiving Report PO';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = sorting("Booking No.") where("Document Type" = filter(Order), Type = Filter(Item | "G/L Account"));
            RequestFilterFields = "Document No.", "Expected Receipt Date", "Booking No.";
            dataitem(TlyBookingInfo; TlyBookingInfo)
            {
                DataItemLink = "No." = field("Booking No.");
                DataItemLinkReference = "Purchase Line";

                column(Appointment_Date; "Appointment Date")
                {

                }
                column(Appointment_Time; "Appointment Time")
                {

                }
            }
            column(Booking_No_; "Booking No.")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(PalletQty; PalletQty)
            {

            }
            column(ItemNumber; ItemNumber)
            {

            }
            column(BinLocation; BinLocation)
            {

            }
            column(QtyCase; QtyCase)
            {

            }
            column(QtyBase; QtyBase)
            {

            }
            column(QtyPallet; QtyPallet)
            {

            }
            column(Description; Description)
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Confirmation_No_; "Confirmation No.")
            {

            }
            column(CommentLabel; CommentLabel)
            {

            }
            column(Grouped; Grouped)
            {

            }

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
                    If (QtyCase = 0) and (QtyPallet = 0) then
                        QtyBase := Quantity;
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
                    field(HideQuantities; HideQuantities)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        Grouped := True;
    end;

    var
        Vendor: Record Vendor;
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
}