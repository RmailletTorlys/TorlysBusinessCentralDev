report 50010 "BOL Shipment Label"
{
    Caption = 'BOL Shipment Label';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "BOL Header";
    RDLCLayout = './Sales/Reports/BOL Shipment Label.rdlc';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Bol Header"; "Torlys BOL Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'BOL Shipment Label';

            trigger OnAfterGetRecord()
            begin
                If "Shipping Agent Code" = '' then
                    Clear(ShippingAgent)
                else
                    ShippingAgent.Get("Shipping Agent Code");

                If Not Location.Get("Location Code") then
                    Clear(Location);
                FormatAddress.Location(LocationAddress, Location);

                //FormatAddress.BOLHeaderShipTo(ShipToAddress,"BOL Header");

                BOLLine.Reset();
                BOLLine.SetRange("BOL No.", "No.");
                POCount := BOLLine.Count;
            end;
        }
    }

    // local procedure BOLHeaderShipTo(var AddrArray: array[8] of Text[100]; var SalesHeader: Record "Sales Header")
    // var
    //     Handled: Boolean;
    //     FormatAddrress: Codeunit "Format Address";
    // begin
    //     FormatAddr(
    //         AddrArray, SalesHeader."Sell-to Customer Name", SalesHeader."Sell-to Customer Name 2", SalesHeader."Sell-to Contact", SalesHeader."Sell-to Address", SalesHeader."Sell-to Address 2",
    //         SalesHeader."Sell-to City", SalesHeader."Sell-to Post Code", SalesHeader."Sell-to County", SalesHeader."Sell-to Country/Region Code");
    // end;

    var
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        BOLLine: Record "Torlys BOL Line";
        FormatAddress: Codeunit "Format Address";
        LocationAddress: array[8] of Text[50];
        ShipToAddress: array[8] of Text[50];
        POCount: Integer;
        PONumbers: Text;

}