report 50010 "BOL Shipment Label"
{
    Caption = 'BOL Shipment Label';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "BOL Header";
    RDLCLayout = './Sales/Reports/BOL Shipment Label.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Bol Header"; TlyBillOfLadingHeader)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Customer No.", "Ship-to Code", "No. Printed";
            RequestFilterHeading = 'BOL Shipment Label';

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                DataItemLinkReference = "Bol Header";

                column(NoCopies; Number)
                {

                }

                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    DataItemLinkReference = CopyLoop;

                    column(LocationAddress1; LocationAddress[1])
                    {

                    }
                    column(LocationAddress2; LocationAddress[2])
                    {

                    }
                    column(LocationAddress3; LocationAddress[3])
                    {

                    }
                    column(LocationAddress4; LocationAddress[4])
                    {

                    }
                    column(LocationAddress5; LocationAddress[5])
                    {

                    }
                    column(LocationAddress6; LocationAddress[6])
                    {

                    }
                    column(ShippingAgent; ShippingAgent."Pickup/Beyond Dest. Instr.")
                    {

                    }
                    column(ShipToAddress1; ShipToAddress[1])
                    {

                    }
                    column(ShipToAddress2; ShipToAddress[2])
                    {

                    }
                    column(ShipToAddress3; ShipToAddress[3])
                    {

                    }
                    column(ShipToAddress4; ShipToAddress[4])
                    {

                    }
                    column(ShipToAddress5; ShipToAddress[5])
                    {

                    }
                    column(ShipToAddress6; ShipToAddress[6])
                    {

                    }
                    column(Shipping_comment; "Bol Header"."Shipping Comment")
                    {

                    }
                    column(PickupDate; Format(("Bol Header"."Pickup Date"), 0, '<month,2>/<day,2>/<year,4>'))
                    {

                    }
                    column(BOL_No; "Bol Header"."No.")
                    {

                    }
                    column(PieceCount; "Bol Header"."Piece Count")
                    {

                    }
                    column(POCount; POCount)
                    {

                    }
                    column(ShippingAgent1; "Bol Header"."Shipping Agent code")
                    {

                    }
                }

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, NoCopiesVar + 1);
                end;

                // trigger OnPreDataItem()
                // begin
                //     NoLoops := 1 + Abs(NoCopies);
                //     If NoLoops <= 0 then
                //         NoLoops := 1;
                //     CopyNo := 0;
                // end;

                // trigger OnAfterGetRecord()
                // begin
                //     CurrReport.PageNo := 1;
                //     If CopyNo = NoLoops then
                //         CurrReport.Break()
                //     else
                //         CopyNo := CopyNo + 1;
                // end;
            }

            trigger OnAfterGetRecord()
            begin
                If "Shipping Agent Code" = '' then
                    Clear(ShippingAgent)
                else
                    ShippingAgent.Get("Shipping Agent Code");

                If Not Location.Get("Location Code") then
                    Clear(Location);
                FormatAddress.Location(LocationAddress, Location);

                BOLHeaderShipTo(ShipToAddress, "BOL Header");

                BOLLine.Reset();
                BOLLine.SetRange("BOL No.", "No.");
                POCount := BOLLine.Count;
            end;
        }


    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                field(NoCopies; NoCopiesVar)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Number of Additional Copies';
                    ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                    MinValue = 0;
                }
            }
        }
    }

    local procedure BOLHeaderShipTo(var AddrArray: array[8] of Text[100]; var BOLHeader: Record TlyBillOfLadingHeader)
    var
    begin
        FormatAddress.FormatAddr(
            AddrArray, '', '', '', BOLHeader."Ship-to Address", BOLHeader."Ship-to Address 2",
            BOLHeader."Ship-to City", BOLHeader."Ship-to Post Code", '', BOLHeader."Ship-to Country/Region Code");
    end;


    var
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        BOLLine: Record TlyBillOfLadingLine;
        FormatAddress: Codeunit "Format Address";
        LocationAddress: array[8] of Text[50];
        ShipToAddress: array[8] of Text[50];
        POCount: Integer;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        NoCopiesVar: Integer;
}