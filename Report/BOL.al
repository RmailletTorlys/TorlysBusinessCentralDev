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

                //LoadClassArray();

                //BOLLine.SetFilter("BOL No.", "Bol Header"."No.");
                //If BOLLine.Find('-') then begin
                //    repeat
                //        IF BOLLine."Heated Service" = TRUE THEN
                //        HeatRequiredMessage := 'HEAT REQUIRED';
                //        IF BOLLine."Freight Charges" = BOLLine."Freight Charges"::Collect THEN
                //        CollectMessage := '*'
                //        ELSE
                //        PrePaidMessage := '*';
                //End;

                Case
                    "Bol Header"."Transaction Type" Of
                    "Bol Header"."Transaction Type"::Shipment:
                        Begin
                            SalesShipmentLine.Reset;
                            SalesShipmentLine.SetCurrentKey("Document No.", Type);
                            SalesShipmentLine.SetFilter("Document No.", BOLLine."Shipment No.");
                            SalesShipmentLine.SetFilter(Type, '=%1', SalesShipmentLine.Type::Item);
                            SalesShipmentLine.SETFILTER(Quantity, '>%1', 0);
                            IF SalesShipmentLine.FIND('-') THEN begin
                                repeat
                                    IF NoOrderString = FALSE THEN begin
                                        IF STRPOS(OrderString[OrderStringToUse], BOLLine."Order No.") = 0 THEN begin
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

                                            SalesShipmentHeader.Get(SalesShipmentLine."Document No.");
                                            OrderString[OrderStringToUse] := OrderString[OrderStringToUse] + BOLLine."Order No." + '-' + SalesShipmentHeader."External Document No." + ' ';
                                        end;
                                    end; //don't display order string because too long   
                                    If StrPos(LocationString, salesshipmentline."Location Code") = 0 then
                                        LocationString := LocationString + SalesShipmentLine."Location Code" + ' ';
                                Until SalesShipmentLine.Next = 0;
                            end;
                        End;
                    "BOL Header"."Transaction Type"::Transfer:
                        begin
                            TransferShipmentLine.RESET;
                            TransferShipmentLine.SETFILTER("Document No.", BOLLine."Shipment No.");
                            TransferShipmentLine.SETFILTER(Quantity, '>%1', 0);
                            IF TransferShipmentLine.FIND('-') then begin
                                repeat
                                    IF NoOrderString = FALSE THEN begin //don't display order string because too long
                                        IF STRPOS(OrderString[OrderStringToUse], BOLLine."Order No.") = 0 then begin
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
                                            OrderString[OrderStringToUse] := OrderString[OrderStringToUse] + BOLLine."Order No." + '-' + TransferShipmentHeader."External Document No." + ' ';
                                        end;
                                    end;
                                    IF STRPOS(LocationString, TransferShipmentLine."Transfer-from Code") = 0 THEN
                                        LocationString := LocationString + TransferShipmentLine."Transfer-from Code" + ' ';
                                until TransferShipmentLine.Next = 0;
                            end;
                        end;
                End;
                //BOLLine.Printed := True;
                //BOLLine.Modify();
                //until bolline.next = 0;

                If not CurrReport.Preview then begin
                    "BOL Header"."No. Printed" := "BOL Header"."No. Printed" + 1;
                    //"BOL Header"."Last Print Date" := workdate;
                    "BOL Header"."Last Print Time" := TIME;
                    "BOL Header"."Last Print By" := USERID;
                    //"BOL Header"."Lines Deleted" := FALSE;
                    "BOL Header".MODIFY;
                end;


            end;


        }
    }

    var
        ShippingAgent1: Record "Shipping Agent";
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        BOLLine: Record "Torlys BOL Line";
        Customer: Record Customer;
        Item: Record Item;
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        TransferShipmentLine: Record "Transfer Shipment Line";
        FormatAddress: Codeunit "Format Address";
        NoOrderString: Boolean;
        LastFieldNo: Integer;
        OrderStringToUse: Integer;
        ShipToAddress: array[8] of Text[100];
        LocationAddress: array[8] of Text[100];
        OrderString: array[6] of Text[100];
        CategoryArray: array[6] of Text[30];
        DestinationInstructions1: Text;
        DestinationInstructions2: Text;
        HeatRequiredMessage: Text;
        LocationString: Text;
        CollectMessage: Text;
        PrePaidMessage: Text;
        EncodedText: Text;
        NumberofPackagesArray: Decimal;
        WeightArray: Decimal;

}