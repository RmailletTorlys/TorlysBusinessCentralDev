report 50005 "Sales Order Label"
{
    Caption = 'Sales Order Label';
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;
    RDLCLayout = './Sales/Reports/Sales Order Label.rdlc';
    UsageCategory = ReportsAndAnalysis;


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

                FmtAddress.SalesHeaderShipTo(ShipToAddress, CustAddr, "Header");

                ShipToAddress_Record.Get("Sell-to Customer No.", "Ship-to Code");
            end;
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
}
