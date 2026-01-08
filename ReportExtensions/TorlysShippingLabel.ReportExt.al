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

                ShippingAgent1.Get("Shipping Agent Code");
                If ShippingAgent1."Pickup/Beyond Method" then begin
                    ShipToAddress[1] := "Ship-to Name";
                    ShipToAddress[2] := ShippingAgent1."Pickup/Beyond Address 1";
                    ShipToAddress[3] := ShippingAgent1."Pickup/Beyond Address 2";
                    ShipToAddress[4] := ShippingAgent1."Pickup/Beyond Address 3";
                    ShipToAddress[5] := ShippingAgent1."Pickup/Beyond Address 4";
                    ShipToAddress[6] := ShippingAgent1."Pickup/Beyond Address 5";
                end else
                    FmtAddress.SalesShptShipTo(ShipToAddress, "Sales Shipment Header");


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

    requestpage
    {
        layout
        {
            addbefore(NumOfBlanksInput)
            {
                field(NoCopies; NoCopiesVar)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Number of Copies';
                    ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                }
            }
        }
    }

    var
        ShipmentMethod: Record "Shipment Method";
        ShippingAgent: Record "Shipping Agent";
        ShippingAgent1: Record "Shipping Agent";
        Location: Record Location;
        FmtAddress: Codeunit "Format Address";
        LocationAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        DayOfWeekNo: Integer;
        DayOfWeek: Text;
        ShipDate: Text[10];
        NoCopiesVar: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
}