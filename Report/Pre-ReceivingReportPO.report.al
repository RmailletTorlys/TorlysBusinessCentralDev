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
            DataItemTableView = sorting("Document No.") where("Document Type" = filter(Order), Type = Filter(Item | "G/L Account"));
            RequestFilterFields = "Document No.", "Expected Receipt Date";

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