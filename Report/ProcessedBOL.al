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
            var
                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";
                BarcodeStrings: Code[20];
            begin
                // Declare the barcode provider using the barcode provider interface and enum
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;

                // Declare the font using the barcode symbology enum
                BarcodeSymbology := Enum::"Barcode Symbology"::"Code39";

                // Set data string source
                BarcodeStrings := "No.";

                // Validate the input. This method is not available for 2D provider
                BarcodeFontProvider.ValidateInput(BarcodeStrings, BarcodeSymbology);

                // Encode the data string to the barcode font
                EncodedText := BarcodeFontProvider.EncodeFont(BarcodeStrings, BarcodeSymbology);

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

                LoadClassArray();

                //ProcessedBOLLine.SetFilter("BOL No.", "Processed Bol Header"."No.");
                //If ProcessedBOLLine.Find('-') then begin
                //    repeat
                //        IF ProcessedBOLLine."Heated Service" = TRUE THEN
                //        HeatRequiredMessage := 'HEAT REQUIRED';
                //        IF ProcessedBOLLine."Freight Charges" = ProcessedBOLLine."Freight Charges"::Collect THEN
                //        CollectMessage := '*'
                //        ELSE
                //        PrePaidMessage := '*';
                //End;

            end;
        }
    }
    procedure LoadClassArray()
    var
        Loop: Integer;
        Found: Boolean;
    begin
        Loop := 1;
        If ("Processed Bol Header"."Weight - Flooring" > 0) or ("Processed Bol Header"."Cases - Flooring" > 0) then begin
            CategoryArray[Loop] := 'Flooring';
            NumberofPackagesArray[Loop] := "Processed Bol Header"."Cases - Flooring";
            WeightArray[Loop] := WeightArray[Loop] + "Processed Bol Header"."Weight - Flooring";
            Loop := Loop + 1;
        end;
        If ("Processed Bol Header"."Weight - Underlayment Rolls" > 0) or ("Processed Bol Header"."Cases - Underlayment Rolls" > 0) then begin
            CategoryArray[Loop] := 'Underlayment Rolls';
            NumberofPackagesArray[Loop] := "Processed Bol Header"."Cases - Underlayment Rolls";
            WeightArray[Loop] := WeightArray[Loop] + "Processed Bol Header"."Weight - Underlayment Rolls";
            Loop := Loop + 1;
        end;
        If ("Processed Bol Header"."Weight - Mouldings" > 0) or ("Processed Bol Header"."Cases - Mouldings" > 0) then begin
            CategoryArray[Loop] := 'Mouldings';
            NumberofPackagesArray[Loop] := "Processed Bol Header"."Cases - Mouldings";
            WeightArray[Loop] := WeightArray[Loop] + "Processed Bol Header"."Weight - Mouldings";
            Loop := Loop + 1;
        end;
        If ("Processed Bol Header"."Weight - Other" > 0) or ("Processed Bol Header"."Cases - Other" > 0) then begin
            CategoryArray[Loop] := 'Other';
            NumberofPackagesArray[Loop] := "Processed Bol Header"."Cases - Other";
            WeightArray[Loop] := WeightArray[Loop] + "Processed Bol Header"."Weight - Other";
            Loop := Loop + 1;
        end;
    end;

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
        CategoryArray: array[1] of Text[30];
        NumberofPackagesArray: array[1] of Decimal;
        WeightArray: array[1] of Decimal;
        LastFieldNo: Integer;
        OrderStringToUse: Integer;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        FooterPrinter: Boolean;
        NoOrderString: Boolean;
        LocationString: Text;
        HeatRequiredMessage: Text;
        CollectMessage: Text;
        PrePaidMessage: Text;
        BarCodeNo: Text;
        DestinationInstructions1: Text;
        DestinationInstructions2: Text;
        EncodedText: Text;


}