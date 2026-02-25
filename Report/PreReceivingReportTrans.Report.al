report 50019 "Receiving Report - Trans"
{
    Caption = 'Receiving Report - Trans';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Transfer Header";
    RDLCLayout = './Sales/Reports/ReceivingReport-Trans.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Booking No.";

            dataitem(TlyBookingInfo; TlyBookingInfo)
            {
                DataItemLinkReference = "Transfer Header";
                DataItemLink = "No." = field("Booking No.");

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
            column(Transfer_Type; "Transfer Type")
            {

            }
            column(In_Transit_Code; "In-Transit Code")
            {

            }
            column(Transfer_to_Code; "Transfer-to Code")
            {

            }
            column(OrderString; OrderString)
            {

            }
            column(TransferOrderCount; TransferOrderCount)
            {

            }
            column(Grouped; Grouped)
            {

            }

            dataitem("Transfer Line"; "Transfer Line")
            {
                DataItemTableView = sorting("Item No.") where("Item No." = filter(<> ''), "Derived From Line No." = filter(0));
                DataItemLinkReference = "Transfer Header";
                DataItemLink = "Document No." = field("No.");
                RequestFilterFields = "Document No.";


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
                column(Sales_Order_No_; "Sales Order No.")
                {

                }
                column(CommentLabel; CommentLabel)
                {

                }
                // column(Grouped; Grouped)
                // {

                // }


                // dataitem("Transfer Header"; "Transfer Header")
                // {
                //     DataItemTableView = sorting("No.");
                //     DataItemLinkReference = "Transfer Line";
                //     DataItemLink = "No." = field("Document No.");
                //     RequestFilterFields = "Booking No.";

                //     column(Booking_No_; "Booking No.")
                //     {

                //     }
                //     column(Transfer_Type; "Transfer Type")
                //     {

                //     }
                // }


                trigger OnAfterGetRecord()
                begin
                    ItemNumber := "Transfer Line"."Item No.";
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
            trigger OnAfterGetRecord()
            begin
                OrderString += "No." + ' ';

                TransferOrderCount := "Transfer Header".Count;
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
        transferheader: Record "Transfer Header";
        BinContent: Record "Bin Content";
        bookinginfo: Record TlyBookingInfo;
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
        OrderString: text[1000];
        Grouped: Boolean;
        BookingNO: code[25];
        TransferOrderCount: Integer;
        appointmentdate: Date;
        apointmenttime: Time;
}