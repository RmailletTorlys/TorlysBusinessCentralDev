report 50009 "Processed Bill Of Lading"
{
    Caption = 'Processed Bill Of Lading';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Processed BOL Header";
    RDLCLayout = './Sales/Reports/ProcessedBOL.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Processed Bol Header"; "Torlys Processed BOL Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Processed Bill Of Lading';

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
            column(Carrier_Tracking_No_; "Carrier Tracking No.")
            {

            }
            column(No_; "No.")
            {

            }
            column(Pickup_Date; Format("Pickup Date", 0, '<day>/<month>/<year>'))
            {

            }
            column(Picking_instructions; ShippingAgent."Pickup/Beyond Dest. Instr.")
            {

            }
            column(DestinationInstructions1; DestinationInstructions1)
            {

            }
            column(DestinationInstructions2; DestinationInstructions2)
            {

            }
            column(Shipping_Instructions_1; "Shipping Instructions 1")
            {

            }
            column(Shipping_Instructions_2; "Shipping Instructions 2")
            {

            }
            column(Shipping_Instructions_3; "Shipping Instructions 3")
            {

            }
            column(Shipping_Instructions_4; "Shipping Instructions 4")
            {

            }
            column(OrderString1; OrderString[1])
            {

            }
            column(OrderString2; OrderString[2])
            {

            }
            column(OrderString3; OrderString[3])
            {

            }
            column(OrderString4; OrderString[4])
            {

            }
            column(OrderString5; OrderString[5])
            {

            }
            column(OrderString6; OrderString[6])
            {

            }
            column(OrderString7; OrderString[7])
            {

            }
            column(OrderString8; OrderString[8])
            {

            }
            column(CategoryArray1; CategoryArray[1])
            {

            }
            column(CategoryArray2; CategoryArray[2])
            {

            }
            column(CategoryArra3; CategoryArray[3])
            {

            }
            column(CategoryArray4; CategoryArray[4])
            {

            }
            column(CategoryArray5; CategoryArray[5])
            {

            }
            column(CategoryArray6; CategoryArray[6])
            {

            }
            column(CategoryArray7; CategoryArray[7])
            {

            }
            column(CategoryArray8; CategoryArray[8])
            {

            }
            column(WeightArray1; WeightArray[1])
            {

            }
            column(WeightArray2; WeightArray[2])
            {

            }
            column(WeightArray3; WeightArray[3])
            {

            }
            column(WeightArray4; WeightArray[4])
            {

            }
            column(WeightArray5; WeightArray[5])
            {

            }
            column(WeightArray6; WeightArray[6])
            {

            }
            column(WeightArray7; WeightArray[7])
            {

            }
            column(WeightArray8; WeightArray[8])
            {

            }
            column(NumberofPackagesArray1; NumberofPackagesArray[1])
            {

            }
            column(NumberofPackagesArray2; NumberofPackagesArray[2])
            {

            }
            column(NumberofPackagesArray3; NumberofPackagesArray[3])
            {

            }
            column(NumberofPackagesArray4; NumberofPackagesArray[4])
            {

            }
            column(NumberofPackagesArray5; NumberofPackagesArray[5])
            {

            }
            column(NumberofPackagesArray6; NumberofPackagesArray[6])
            {

            }
            column(NumberofPackagesArray7; NumberofPackagesArray[7])
            {

            }
            column(NumberofPackagesArray8; NumberofPackagesArray[8])
            {

            }
            column(Piece_Count; "Piece Count")
            {

            }
            column(LocationString; LocationString)
            {

            }
            column(Cases___Total; "Cases - Total")
            {

            }
            column(Weight___Total; "Weight - Total")
            {

            }
            column(EncodedText; EncodedText)
            {

            }
            column(Last_Print_Time; "Last Print Time")
            {

            }
            column(Last_Print_Date; "Last Print Date")
            {

            }
            column(No__Printed; "No. Printed")
            {

            }
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
                    ShipToAddress[1] := COPYSTR("Ship-to Name", 1, 50);
                    ShipToAddress[2] := ShippingAgent1."Pickup/Beyond Address 1";
                    ShipToAddress[3] := ShippingAgent1."Pickup/Beyond Address 3";
                    ShipToAddress[4] := ShippingAgent1."Pickup/Beyond Address 5";
                    ShipToAddress[5] := ShippingAgent1."Pickup/Beyond Address 6";
                    ShipToAddress[6] := "Shipping Comment";
                    DestinationInstructions1 := ShippingAgent1."Pickup/Beyond Dest. Instr.";
                    DestinationInstructions2 := '';
                end else
                    //FormatAddress.BOLHeader(ShipToAddress, "Bol Header");
                    DestinationInstructions1 := "Shipping Comment";



                Location.Get("Location Code");
                ShippingAgent.Get("Shipping Agent Code");

                FormatAddress.Location(LocationAddress, Location);
                LocationAddress[8] := COPYSTR(Location."Phone No." + ' Fax: ' + Location."Fax No.", 1, 50);
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

                Case "Processed Bol Header"."Transaction Type" of
                    "Processed Bol Header"."Transaction Type"::Shipment:
                        begin
                            SalesShipmentLine.Reset();
                            SalesShipmentLine.SetCurrentKey("Document No.", Type);
                            SalesShipmentLine.SetFilter("Document No.", ProcessedBOLLine."Shipment No.");
                            SalesShipmentLine.SetFilter(Type, '=%1', SalesShipmentLine.Type::Item);
                            SalesShipmentLine.SetFilter(Quantity, '>%1', 0);
                            If SalesShipmentLine.Find('-') then
                                repeat
                                    IF NoOrderString = FALSE THEN
                                        IF STRPOS(OrderString[OrderStringToUse], ProcessedBOLLine."Order No.") = 0 THEN begin
                                            IF STRLEN(OrderString[1]) > 75 THEN
                                                OrderStringToUse := 2;
                                            IF STRLEN(OrderString[2]) > 75 THEN
                                                OrderStringToUse := 3;
                                            IF STRLEN(OrderString[3]) > 75 THEN
                                                OrderStringToUse := 4;
                                            IF STRLEN(OrderString[4]) > 75 THEN
                                                OrderStringToUse := 5;
                                            IF STRLEN(OrderString[5]) > 75 THEN
                                                OrderStringToUse := 6;
                                            IF STRLEN(OrderString[6]) > 75 THEN
                                                OrderStringToUse := 7;
                                            IF STRLEN(OrderString[7]) > 75 THEN
                                                OrderStringToUse := 8;
                                            SalesShipmentHeader.GET(SalesShipmentLine."Document No.");
                                            OrderString[OrderStringToUse] := OrderString[OrderStringToUse] + ProcessedBOLLine."Order No." + '-' + SalesShipmentHeader."External Document No." + ' ';
                                        end;
                                    If StrPos(LocationString, SalesShipmentLine."Location Code") = 0 then
                                        LocationString := LocationString + SalesShipmentLine."Location Code" + ' ';
                                Until SalesShipmentLine.Next() = 0;

                        end;
                    "Processed Bol Header"."Transaction Type"::Transfer:
                        begin
                            TransferShipmentLine.RESET();
                            TransferShipmentLine.SETFILTER("Document No.", ProcessedBOLLine."Shipment No.");
                            TransferShipmentLine.SETFILTER(Quantity, '>%1', 0);
                            IF TransferShipmentLine.FIND('-') THEN
                                repeat
                                    IF NoOrderString = FALSE THEN
                                        IF STRPOS(OrderString[OrderStringToUse], ProcessedBOLLine."Order No.") = 0 THEN begin
                                            IF STRLEN(OrderString[1]) > 75 THEN
                                                OrderStringToUse := 2;
                                            IF STRLEN(OrderString[2]) > 75 THEN
                                                OrderStringToUse := 3;
                                            IF STRLEN(OrderString[3]) > 75 THEN
                                                OrderStringToUse := 4;
                                            IF STRLEN(OrderString[4]) > 75 THEN
                                                OrderStringToUse := 5;
                                            IF STRLEN(OrderString[5]) > 75 THEN
                                                OrderStringToUse := 6;
                                            IF STRLEN(OrderString[6]) > 75 THEN
                                                OrderStringToUse := 7;
                                            IF STRLEN(OrderString[7]) > 75 THEN
                                                OrderStringToUse := 8;
                                            TransferShipmentHeader.GET(TransferShipmentLine."Document No.");
                                            OrderString[OrderStringToUse] := OrderString[OrderStringToUse] + ProcessedBOLLine."Order No." + '-' + TransferShipmentHeader."External Document No." + ' ';
                                        end;
                                    If StrPos(LocationString, TransferShipmentLine."Transfer-from Code") = 0 then
                                        LocationString := LocationString + TransferShipmentLine."Transfer-from Code" + ' ';
                                Until TransferShipmentLine.Next() = 0;
                        end;
                End;
                //UNTIL ProcessedBOLLine.NEXT = 0;

                // CalcFields("Processed Bol Header"."Cases - Total", "Processed Bol Header"."Weight - Total");

                If not CurrReport.Preview then begin
                    "Processed Bol Header"."No. Printed" := "Processed Bol Header"."No. Printed" + 1;
                    //"Processed Bol Header"."Last Print Date" := WorkDate;
                    "Processed Bol Header"."Last Print Time" := Time;
                    "Processed Bol Header"."Last Print By" := COPYSTR(FORMAT(UserId), 1, 20);
                    //"Processed Bol Header"."Lines Deleted" := False;
                    "Processed Bol Header".Modify();
                end;
            end;
        }
    }
    procedure LoadClassArray()
    var
        Loop: Integer;
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
        Location: Record Location;
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        TransferShipmentLine: Record "Transfer Shipment Line";
        ShippingAgent1: Record "Shipping Agent";
        FormatAddress: Codeunit "Format Address";
        ShipToAddress: array[8] of Text[50];
        LocationAddress: array[8] of Text[50];
        OrderString: array[8] of Text[100];
        CategoryArray: array[8] of Text[30];
        NumberofPackagesArray: array[8] of Decimal;
        WeightArray: array[8] of Decimal;
        LastFieldNo: Integer;
        OrderStringToUse: Integer;
        NoOrderString: Boolean;
        LocationString: Text;
        HeatRequiredMessage: Text;
        DestinationInstructions1: Text;
        DestinationInstructions2: Text;
        EncodedText: Text;


}