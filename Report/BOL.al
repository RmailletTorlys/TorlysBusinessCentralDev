report 50008 "Bill Of Lading"
{
    Caption = 'Bill Of Lading';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "BOL Header";
    RDLCLayout = './Sales/Reports/BOL.rdlc';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Bol Header"; "Torlys BOL Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Bill Of Lading';

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No.");
            end;

            trigger OnAfterGetRecord()
            begin
                ShippingAgent1.Get("Shipping Agent Code");
                If ShippingAgent1."Pickup/Beyond Method" then begin
                    ShipToAddress[1] := "Ship-to Name";
                    ShipToAddress[2] := ShippingAgent1."Pickup/Beyond Address 1";
                    ShipToAddress[3] := ShippingAgent1."Pickup/Beyond Address 3";
                    ShipToAddress[4] := ShippingAgent1."Pickup/Beyond Address 5";
                    ShipToAddress[5] := ShippingAgent1."Pickup/Beyond Address 6";
                    ShipToAddress[6] := "Destination Instructions 1";
                    ShipToAddress[7] := "Destination Instructions 2";
                    DestinationInstructions1 := ShippingAgent1."Destination Instructions";
                    DestinationInstructions2 := '';
                end else begin
                    FormatAddress.BOLHeader(ShipToAddress, "Bol Header");
                    DestinationInstructions1 := "Destination Instructions 1";
                    DestinationInstructions2 := "Destination Instructions 2";
                end;

                Location.Get("Location Code");
                ShippingAgent.Get("Shipping Agent Code");

                FormatAddress.Location(LocationAddress, Location);
                LocationAddress[8] := Location."Phone No." + ' Fax: ' + Location."Fax No.";
                CompressArray(LocationAddress);

                OrderStringToUse := 1;
                OrderString[1] := '';
                OrderString[2] := '';
                OrderString[3] := '';
                OrderString[4] := '';
                OrderString[5] := '';
                OrderString[6] := '';
                HeatRequiredMessage := '';

                LoadClassArray()
            end;


        }
    }

    var
        ShippingAgent1: Record "Shipping Agent";
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        FormatAddress: Codeunit "Format Address";
        LastFieldNo: Integer;
        OrderStringToUse: Integer;
        ShipToAddress: array[8] of Text[100];
        LocationAddress: array[8] of Text[100];
        OrderString: array[6] of Text[100];
        CategoryArray: array[6] of Text[30];
        DestinationInstructions1: Text;
        DestinationInstructions2: Text;
        HeatRequiredMessage: Text;

}