reportextension 51200 "TorlysShippingLabel" extends "Shipping Labels"
{
    dataset
    {
        modify("Sales Shipment Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                if "Shipment Method Code" = '' then
                    clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                If "Shipping Agent Code" = '' then
                    Clear(ShippingAgent)
                else
                    ShippingAgent.Get("Shipping Agent Code");

                If Not Location.Get("Sales Shipment Header"."Location Code") then
                    Clear(Location);
                FmtAddress.Location(LocationAddress, Location);

                DayOfWeekNo := Date2DWY("Shipment Date", 1);

                if DayOfWeekNo = 1 then begin
                    DayOfWeek := 'Monday';
                end else if DayOfWeekNo = 2 then begin
                    DayOfWeek := 'Tuesday';
                end else if DayOfWeekNo = 3 then begin
                    DayOfWeek := 'Wednesday';
                end else if DayOfWeekNo = 4 then begin
                    DayOfWeek := 'Thursday';
                end else if DayOfWeekNo = 5 then begin
                    DayOfWeek := 'Friday';
                end;
            end;
        }

        add("Sales Shipment Header")
        {
            column(OrderNo; "Order No.")
            {

            }
            column(ShipDate; "Shipment Date")
            {

            }
            column(External_Document_No_; "External Document No.")
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
            column(DayOfWeek; DayOfWeek)
            {

            }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
        }
    }

    var
        ShipmentMethod: Record "Shipment Method";
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        FmtAddress: Codeunit "Format Address";
        LocationAddress: array[8] of Text[100];
        DayOfWeekNo: Integer;
        DayOfWeek: Text;
}