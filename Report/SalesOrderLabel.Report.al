report 50005 "Sales Order Label"
{
    Caption = 'Sales Order Label';
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;
    RDLCLayout = './Sales/Reports/Sales Order Label.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;


    dataset
    {

        dataitem(Header; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Sales Order Label';

            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(No_; "No.")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Project; "Tag Name")
            {

            }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            {

            }
            column(LocAdd1; LocationAddress[1])
            {

            }
            column(LocAdd2; LocationAddress[2])
            {

            }
            column(LocAdd3; LocationAddress[3])
            {

            }
            column(LocAdd4; LocationAddress[4])
            {

            }
            column(LocAdd5; LocationAddress[5])
            {

            }
            column(LocAdd6; LocationAddress[6])
            {

            }
            column(ShipAdd1; ShipToAddress[1])
            {

            }
            column(ShipAdd2; ShipToAddress[2])
            {

            }
            column(ShipAdd3; ShipToAddress[3])
            {

            }
            column(ShipAdd4; ShipToAddress[4])
            {

            }
            column(ShipAdd5; ShipToAddress[5])
            {

            }
            column(ShipAdd6; ShipToAddress[6])
            {

            }
            column(Comment; Comment)
            {

            }
            column(DayOfWeek; DayOfWeek)
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
            column(Last_Shipping_No_; "Last Shipping No.")
            {

            }
            column(BOL_No_; "BOL No.")
            {

            }

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                column(NoCopies; Number)
                {

                }

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, NoCopiesVar + 1);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if "Shipment Method Code" = '' then
                    clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                If "Shipping Agent Code" = '' then
                    Clear(ShippingAgent)
                else
                    ShippingAgent.Get("Shipping Agent Code");

                If Not Location.Get("Location Code") then
                    Clear(Location);
                FmtAddress.Location(LocationAddress, Location);

                DayOfWeekNo := Date2DWY("Shipment Date", 1);

                FmtAddress.SalesHeaderShipTo(ShipToAddress, CustAddr, "Header");

                case DayOfWeekNo of
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
                end;

                // ShipToAddress_Record.Get("Sell-to Customer No.", "Ship-to Code");
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

    var
        ShipmentMethod: Record "Shipment Method";
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        ShipToAddress_Record: Record "Ship-to Address";
        FmtAddress: Codeunit "Format Address";
        LocationAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        CustAddr: array[8] of Text[100];
        NoCopiesVar: Integer;
        DayOfWeekNo: Integer;
        DayOfWeek: Text;
}
