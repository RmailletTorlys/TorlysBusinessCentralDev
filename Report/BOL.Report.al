report 50008 "Bill Of Lading"
{
    Caption = 'Bill Of Lading';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "BOL Header";
    RDLCLayout = './Sales/Reports/BOL.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Bol Header"; TlyBillOfLadingHeader)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Bill Of Lading';

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
            column(No_; "No.")
            {

            }
            column(Pickup_Date; Format("Pickup Date", 0, '<day>/<month>/<year>'))
            {

            }
            // column(Picking_instructions; ShippingAgent."Pickup/Beyond Dest. Instr.")
            // {

            // }
            column(ShippingAgentName; ShippingAgent."Name")
            {

            }
            column(Shipping_Instructions_1; "Shipping Instructions 1")
            {

            }
            column(Shipping_Instructions_2; "Shipping Instructions 2")
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
            column(Shipping_Comment; "Shipping Comment")
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
            column(Last_Print_Date; "Last Print Date")
            {

            }
            column(No__Printed; "No. Printed")
            {

            }
            column(Package_Tracking_No_; "Package Tracking No.")
            {

            }
            column(CollectMessage; CollectMessage)
            {

            }
            column(Prepaidmessage; Prepaidmessage)
            {

            }
            column(ShippingAgent; ShippingAgent.Name)
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

                ShippingAgent1.Get("Bol Header"."Shipping Agent Code");
                If ShippingAgent1."Pickup/Beyond Method" then begin
                    ShipToAddress[1] := "Bol Header"."Ship-to Name";
                    ShipToAddress[2] := ShippingAgent1."Pickup/Beyond Address 1";
                    ShipToAddress[3] := ShippingAgent1."Pickup/Beyond Address 3";
                    ShipToAddress[4] := ShippingAgent1."Pickup/Beyond Address 5";
                    ShipToAddress[5] := ShippingAgent1."Pickup/Beyond Address 6";
                    ShipToAddress[6] := "Shipping Comment";
                    DestinationInstructions1 := ShippingAgent1."Pickup/Beyond Dest. Instr.";
                    DestinationInstructions2 := '';
                end else begin
                    ShipToAddress[1] := "Bol Header"."Ship-to Name";
                    ShipToAddress[2] := "Bol Header"."Ship-to Address";
                    ShipToAddress[3] := "Bol Header"."Ship-to Address 2";
                    ShipToAddress[4] := "Bol Header"."Ship-to City";
                    ShipToAddress[5] := "Bol Header"."Ship-to County";
                    ShipToAddress[6] := "Bol Header"."Ship-to Country/Region Code";
                    // FormatAddress.SalesShptShipTo(ShipToAddress, SalesShipmentHeader);
                    DestinationInstructions1 := "Shipping Comment";
                end;

                Location.Get("Bol Header"."Location Code");
                ShippingAgent.Get("Bol Header"."Shipping Agent Code");

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
                OrderString[7] := '';
                OrderString[8] := '';
                HeatRequiredMessage := '';

                LoadClassArray();


                BOLLine.SetFilter("BOL No.", "Bol Header"."No.");
                If BOLLine.Find('-') then begin
                    repeat
                        If BOLLine."Freight Charges" = BOLLine."Freight Charges"::Collect then
                            CollectMessage := '*'
                        else
                            Prepaidmessage := '*';
                        Case
                            "Bol Header"."Transaction Type" Of
                            "Bol Header"."Transaction Type"::Shipment:
                                Begin
                                    SalesShipmentLine.Reset();
                                    SalesShipmentLine.SetCurrentKey("Document No.", Type);
                                    SalesShipmentLine.SetFilter("Document No.", BOLLine."Shipment No.");
                                    SalesShipmentLine.SetFilter(Type, '=%1', SalesShipmentLine.Type::Item);
                                    SalesShipmentLine.SETFILTER(Quantity, '>0');
                                    IF SalesShipmentLine.FindSet() THEN begin
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

                                                    SalesShipmentLine.SetCurrentKey("Document No.", Type);
                                                    SalesShipmentLine.SetFilter("Document No.", BOLLine."Shipment No.");
                                                    SalesShipmentLine.SetFilter(Type, '=%1', SalesShipmentLine.Type::Item);
                                                    SalesShipmentLine.SETFILTER(Quantity, '>0');
                                                    SalesShipmentHeader.Get(SalesShipmentLine."Document No.");
                                                    OrderString[OrderStringToUse] := OrderString[OrderStringToUse] + BOLLine."Order No." + '-' + SalesShipmentHeader."External Document No." + ' ';
                                                end;
                                            end;
                                            //don't display order string because too long   
                                            If StrPos(LocationString, salesshipmentline."Location Code") = 0 then
                                                LocationString := LocationString + SalesShipmentLine."Location Code" + ' ';
                                        Until SalesShipmentLine.Next() = 0;
                                    end;
                                end;
                            "BOL Header"."Transaction Type"::Transfer:
                                begin
                                    TransferShipmentLine.RESET();
                                    TransferShipmentLine.SETFILTER("Document No.", BOLLine."Shipment No.");
                                    TransferShipmentLine.SETFILTER(Quantity, '>%1', 0);
                                    IF TransferShipmentLine.FIND('-') then
                                        repeat
                                            IF NoOrderString = FALSE THEN  //don't display order string because too long
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
                                            IF STRPOS(LocationString, TransferShipmentLine."Transfer-from Code") = 0 THEN
                                                LocationString := LocationString + TransferShipmentLine."Transfer-from Code" + ' ';
                                        until TransferShipmentLine.Next() = 0;

                                end;
                        End;
                    // BOLLine.Printed := True;
                    //BOLLine.Modify();
                    until bolline.next = 0;
                end;

                If not CurrReport.Preview then begin
                    "BOL Header"."No. Printed" := "BOL Header"."No. Printed" + 1;
                    "BOL Header"."Last Print Date" := CurrentDateTime();
                    // "BOL Header"."Last Print Time" := TIME;
                    // "BOL Header"."Last Print By" := FORMAT(USERID);
                    //"BOL Header"."Lines Deleted" := FALSE;
                    "BOL Header".MODIFY();
                end;
            end;
        }
    }
    procedure LoadClassArray()
    var
        Loop: Integer;

    begin
        Loop := 1;
        If ("Bol Header"."Weight - Flooring" > 0) or ("Bol Header"."Cases - Flooring" > 0) then begin
            CategoryArray[Loop] := 'Flooring';
            NumberofPackagesArray[Loop] := "Bol Header"."Cases - Flooring";
            WeightArray[Loop] := WeightArray[Loop] + "Bol Header"."Weight - Flooring";
            Loop := Loop + 1;
        end;
        If ("Bol Header"."Weight - Underlayment Rolls" > 0) or ("Bol Header"."Cases - Underlayment Rolls" > 0) then begin
            CategoryArray[Loop] := 'Underlayment Rolls';
            NumberofPackagesArray[Loop] := "Bol Header"."Cases - Underlayment Rolls";
            WeightArray[Loop] := WeightArray[Loop] + "Bol Header"."Weight - Underlayment Rolls";
            Loop := Loop + 1;
        end;
        If ("Bol Header"."Weight - Mouldings" > 0) or ("Bol Header"."Cases - Mouldings" > 0) then begin
            CategoryArray[Loop] := 'Mouldings';
            NumberofPackagesArray[Loop] := "Bol Header"."Cases - Mouldings";
            WeightArray[Loop] := WeightArray[Loop] + "Bol Header"."Weight - Mouldings";
            Loop := Loop + 1;
        end;
        If ("Bol Header"."Weight - Other" > 0) or ("Bol Header"."Cases - Other" > 0) then begin
            CategoryArray[Loop] := 'Other';
            NumberofPackagesArray[Loop] := "Bol Header"."Cases - Other";
            WeightArray[Loop] := WeightArray[Loop] + "Bol Header"."Weight - Other";
            Loop := Loop + 1;
        end;
    end;



    var
        ShippingAgent1: Record "Shipping Agent";
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        BOLLine: Record TlyBillOfLadingLine;
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
        OrderString: array[8] of Text[100];
        CategoryArray: array[8] of Text[30];
        NumberofPackagesArray: array[8] of Decimal;
        WeightArray: array[8] of Decimal;
        DestinationInstructions1: Text;
        DestinationInstructions2: Text;
        HeatRequiredMessage: Text;
        LocationString: Text;
        EncodedText: Text;
        CollectMessage: Text;
        Prepaidmessage: Text;
}