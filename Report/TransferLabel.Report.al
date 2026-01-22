report 50027 "Transfer Label"
{
    Caption = 'Transfer Label';
    PreviewMode = PrintLayout;
    WordMergeDataItem = TransferHeader;
    RDLCLayout = './Sales/Reports/Transfer Label.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(TransferHeader; "Transfer Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterHeading = 'Transfer Label';
            RequestFilterFields = "No.";

            column(LocationAddress1; LocationAddress[1])
            { }
            column(LocationAddress2; LocationAddress[2])
            { }
            column(LocationAddress3; LocationAddress[3])
            { }
            column(LocationAddress4; LocationAddress[4])
            { }
            column(LocationAddress5; LocationAddress[5])
            { }
            column(LocationAddress6; LocationAddress[6])
            { }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            { }
            column(ShipToAddress1; ShipToAddress[1])
            { }
            column(ShipToAddress2; ShipToAddress[2])
            { }
            column(ShipToAddress3; ShipToAddress[3])
            { }
            column(ShipToAddress4; ShipToAddress[4])
            { }
            column(ShipToAddress5; ShipToAddress[5])
            { }
            column(ShipToAddress6; ShipToAddress[6])
            { }
            column(No_; "No.")
            { }
            column(Shipment_Date; "Shipment Date")
            { }
            column(External_Document_No_; "External Document No.")
            { }

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                // DataItemLinkReference = TransferHeader;

                column(NoCopies; Number)
                { }

                // dataitem(PageLoop; Integer)
                // {
                //     DataItemTableView = sorting(Number) where(Number = const(1));
                //     DataItemLinkReference = CopyLoop;


                // }
                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, NoCopies + 1);
                end;
                // trigger OnPreDataItem()
                // begin
                //     NoLoops := 1 + ABS(NoCopies);
                //     IF NoLoops <= 0 THEN
                //         NoLoops := 1;
                //     CopyNo := 0;
                // end;

                // trigger OnAfterGetRecord()
                // begin
                //     CurrReport.PAGENO := 1;

                //     IF CopyNo = NoLoops THEN BEGIN
                //         CurrReport.BREAK;
                //     END ELSE
                //         CopyNo := CopyNo + 1;
                // end;

            }

            trigger OnAfterGetRecord()
            begin
                IF "Shipment Method Code" = '' THEN
                    CLEAR(ShipmentMethod)
                ELSE
                    ShipmentMethod.GET("Shipment Method Code");

                IF "Shipping Agent Code" = '' THEN
                    CLEAR(ShippingAgent)
                ELSE
                    ShippingAgent.GET("Shipping Agent Code");

                Location.GET(TransferHeader."Transfer-from Code");
                FormatAddress.Location(LocationAddress, Location);

                FormatAddress.TransferHeaderTransferTo(ShipToAddress, TransferHeader);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                field(NoCopies; NoCopies)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Number of Additional Copies';
                    ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                    MinValue = 0;
                }
            }
        }
    }

    var
        Location: Record Location;
        shipmentmethod: Record "Shipment Method";
        salespurchperson: Record "Salesperson/Purchaser";
        shippingagent: Record "Shipping Agent";
        ShipToAddress: array[8] of Text;
        LocationAddress: array[8] of Text;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        FormatAddress: Codeunit "Format Address";
}