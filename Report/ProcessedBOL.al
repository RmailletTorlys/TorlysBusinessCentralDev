report 50009 "Processed Bill Of Lading"
{
    Caption = 'Processed Bill Of Lading';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Processed BOL Header";
    RDLCLayout = './Sales/Reports/ProcessedBOL.rdlc';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Processed Bol Header"; "Torlys Processed BOL Header")
        {
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
                    DestinationInstructions1 := ShippingAgent1."Pickup/Beyond Dest. Instr.";
                    DestinationInstructions2 := '';
                end else begin
                    //FormatAddress.BOLHeader(ShipToAddress, "Bol Header");
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

                //LoadClassArray()
            end;
        }
    }

    var
        ShippingAgent: Record "Shipping Agent";
        ProcessedBOLLine: Record "Torlys Processed BOL Line";
        Customer: Record Customer;
        Item: Record Item;
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        Location: Record Location;
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        TransferShipmentLine: Record "Transfer Shipment Line";
        ShippingAgent1: Record "Shipping Agent";
        FormatAddress: Codeunit "Format Address";
        ShipToAddress: array[8] of Text[50];
        LocationAddress: array[8] of Text[50];
        OrderString: array[6] of Text[100];
        LastFieldNo: Integer;
        OrderStringToUse: Integer;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        FooterPrinter: Boolean;
        NoOrderString: Boolean;
        NumberOfPackagesArray: Decimal;
        WeightArray: Decimal;
        LocationString: Text;
        CategoryArray: Text;
        HeatRequiredMessage: Text;
        CollectMessage: Text;
        PrePaidMessage: Text;
        BarCodeNo: Text;
        DestinationInstructions1: Text;
        DestinationInstructions2: Text;


}