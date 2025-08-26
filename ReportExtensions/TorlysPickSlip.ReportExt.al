reportextension 51000 "TorlysPickSlip" extends "Pick Instruction"
{
    dataset
    {
        add("Sales Header")
        {
            column(Order_Date; "Order Date")
            {

            }
            column(CurrReportPageNo; CurrReport.PageNo())
            {

            }
            column(BillToAddress1; BillToAddress[1])
            {

            }
            column(BillToAddress2; BillToAddress[2])
            {

            }
            column(BillToAddress3; BillToAddress[3])
            {

            }
            column(BillToAddress4; BillToAddress[4])
            {

            }
            column(BillToAddress5; BillToAddress[5])
            {

            }
            column(BillToAddress6; BillToAddress[6])
            {

            }
            column(ShipToAddress1; ShipToAddress[1])
            {

            }
            column(ShipToAddress2; ShipToAddress[2])
            {

            }
            column(ShipToAddress3; ShipToAddress[3])
            {

            }
            column(ShipToAddress4; ShipToAddress[4])
            {

            }
            column(ShipToAddress5; ShipToAddress[5])
            {

            }
            column(ShipToAddress6; ShipToAddress[6])
            {

            }
            column(Tag_Name; "Tag Name")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Your_Reference; "Your Reference")
            {

            }
            column(ShipingAgent_AgentNo; ShipAgent."Agent No.")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            column(PaymentTermsDesc; PaymentTerms.Description)
            {

            }
            column(SystemCreatedBy; LookupUserIdWithGuid(SystemCreatedBy))
            {

            }
            column(Pick_Slip_Printed_By; "Pick Slip Printed By")
            {

            }
            column(Pick_Slip_Printed_Date; "Pick Slip Printed Date")
            {

            }
            column(Pick_Slip_Printed_Time; "Pick Slip Printed Time")
            {

            }
            column(No__Pick_Lists_Printed; "No. Pick Lists Printed")
            {

            }
            column(Comment; Comment)
            {

            }
            column(EncodedText; EncodedText)
            {

            }
            column(DayOfWeek; DayOfWeek)
            {

            }
        }

        add("Sales Line")
        {
            column(Location_Code; "Location Code")
            {

            }
            column(No_; TempSalesLine."No.")
            {

            }
            column(Description; (TempSalesLine.Description + TempSalesLine."Description 2"))
            {

            }
            column(ParentBinLocationLabel; ParentBinLocationLabel)
            {

            }
            column(ParentBinLocation; ParentBinLocation)
            {

            }
            column(Qty__to_Ship; "Qty. to Ship")
            {

            }
            column(Qty__to_Ship_Case; "Qty. to Ship Case")
            {

            }
            column(Qty__to_Ship_Pallet; "Qty. to Ship Pallet")
            {

            }
            column(TotalPieces; TotalPieces)
            {

            }
            column(TotalWeight; TotalWeight)
            {

            }
        }

        modify("Sales Header")
        {
            trigger OnAfterPreDataItem()
            Begin
                CompanyInformation.Get('');
                SalesSetup.Get;
                If PrintCompany then
                    FormatAddress.Company(CompanyAddress, CompanyInformation)
                Else
                    Clear(CompanyAddress);
            End;

            trigger OnAfterAfterGetRecord()
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

                If PrintCompany then begin
                    if RespCenter.get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                end;

                If "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.get("Salesperson Code");
                if "Payment Terms Code" = '' then
                    Clear(PaymentTerms)
                else
                    PaymentTerms.get("Payment Terms Code");
                if "Shipment Method Code" = '' then
                    Clear(ShipMethod)
                else
                    ShipMethod.get("Shipment Method Code");
                if "Shipping Agent Code" = '' then
                    Clear(ShipAgent)
                else
                    ShipAgent.get("Shipping Agent Code");

                If NOT Cust.Get("Sell-to Customer No.") then
                    Clear(Cust);

                FormatAddress.SalesHeaderSellTo(BillToAddress, "Sales Header");
                FormatAddress.SalesHeaderShipTo(ShipToAddress, CustAddr, "Sales Header");

                Clear(BreakdownTitle);
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                TotalTaxLabel := Text008;
                TaxRegNo := '';
                TaxRegLabel := '';
                If "Tax Area Code" <> '' then begin
                    TaxArea.get("Tax Area Code");
                    Case TaxArea."Country/Region" OF
                        TaxArea."Country/Region"::US:
                            TotalTaxLabel := Text005;
                        TaxArea."Country/Region"::CA:
                            begin
                                TotalTaxLabel := Text007;
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    End;
                    SalesTaxCalc.StartSalesTaxCalculation;
                end;

                If "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                else
                    UseDate := WorkDate;

                CurrReport.PageNo := 1;
                BarcodeNo := '*' + "Sales Header"."No." + '*';

                If Not CurrReport.Preview then begin
                    PickPrintComment := StrSubstNo('Pick slip printed by %1 on %2 at %3', UserId, WorkDate, Time);
                    SalesCommentLine1.Reset; /// 11/09/2021 - SD - added this so wouldn't copy checkboxes from above
                    SalesCommentLine1.SetCurrentKey("Document Type", "No.");
                    SalesCommentLine1.SetRange("Document Type", "Document Type");
                    SalesCommentLine1.SetRange("No.", "No.");
                    If SalesCommentLine1.Find('+') then LineNo := SalesCommentLine1."Line No.";

                    SalesCommentLine1.Init;
                    SalesCommentLine1."Document Type" := "Document Type";
                    SalesCommentLine1."No." := "No.";
                    SalesCommentLine1."Line No." := LineNo + 10000;
                    SalesCommentLine1.Date := WorkDate;
                    SalesCommentLine1."SystemCreatedBy" := UserId;
                    SalesCommentLine1.Comment := PickPrintComment;
                    //SalesCommentLine1.Code := SalesCommentLine1.Code::"DOC-PRINT";
                    SalesCommentLine1.Insert;

                    "Pick Slip Printed By" := UserId;
                    "Pick Slip Printed Date" := WorkDate;
                    "Pick Slip Printed Time" := Time;
                    // "Pick Slip Printed" := TRUE;
                    Modify;
                end;

                TotalPieces := 0;
                TotalWeight := 0;

                If "No. Pick Lists Printed" > 0 then
                    RePrintMessage := 'REPRINT'
                else
                    RePrintMessage := '';

                SalesCommentLine.Reset();
                SalesCommentLine.SetRange("No.", "No.");
                SalesCommentLine.SetFilter("Print On Pick Ticket", 'Yes');
                If (SalesCommentLine.Find('-')) then begin
                    NotesMessage := 'SEE NOTES';
                end else begin
                    NotesMessage := '';
                end;

                If Date2DWY("Shipment Date", 1) = 1 then
                    DayOfWeek := 'Monday'
                Else If Date2DWY("Shipment Date", 1) = 2 then
                    DayOfWeek := 'Tuesday'
                Else If Date2DWY("Shipment Date", 1) = 3 then
                    DayOfWeek := 'Wednesday'
                Else If Date2DWY("Shipment Date", 1) = 4 then
                    DayOfWeek := 'Thursday'
                Else If Date2DWY("Shipment Date", 1) = 5 then
                    DayOfWeek := 'Friday'
            end;
        }
        Modify("sales Line")
        {
            trigger OnAfterPreDataItem()
            begin
                TempSalesLine.Reset;
                TempSalesLine.DeleteAll;

                CurrReport.CreateTotals(TaxLiable, TaxAmount, AmountExclInvDisc, TempSalesLine."Line Amount", TempSalesLine."Inv. Discount Amount");
                NumberOfLines := TempSalesLine.Count;
                //SetRange(Number, 1, NumberOfLines);
                OnLineNumber := 0;
                PrintFooter := False;
            end;

            trigger OnAfterAfterGetRecord()
            begin
                If Type <> Type::" " then begin
                    if (Quantity - "Quantity Shipped" = 0) then
                        CurrReport.Skip();
                end;

                TempSalesLine := "Sales Line";
                TempSalesLine.Insert();
                HighestLineNo := "Line No.";
                If "Sales Header"."Tax Area Code" <> '' then
                    SalesTaxCalc.AddSalesLine(TempSalesLine);

                OnLineNumber := OnLineNumber + 1;
                with TempSalesLine do begin
                    if OnLineNumber = 1 then
                        Find('-')
                    else
                        next;

                    Clear(TempDesc3);

                    If ("Item Reference No." <> '') then begin
                        // Link to item card
                        Clear(TempItem);
                        TempItem.Get("No.");

                        // Set the cross ref desc to a variable
                        TempDesc3 := Description;

                        // Set the actual desc field equal to the desc from the item card
                        Description := TempItem.Description;
                        MODIFY;
                    end;

                    If Type = Type::" " then begin
                        "No." := '';
                        "Unit of Measure" := '';
                        "Line Amount" := 0;
                        "Inv. Discount Amount" := 0;
                        Quantity := 0;
                    end else if Type = Type::"G/L Account" then
                            "No." := '';

                    TaxAmount := "Amount Including VAT" - Amount;
                    If TaxAmount <> 0 Then Begin
                        TaxFlag := True;
                        TaxLiable := Amount;
                    End else begin
                        TaxFlag := false;
                        TaxLiable := 0;
                    end;

                    AmountExclInvDisc := "Line Amount";

                    If Quantity = 0 then
                        UnitPriceToPrint := 0 // So it won't print
                    else
                        UnitPriceToPrint := Round(AmountExclInvDisc / Quantity, 0.00001);

                    If Type = Type::Item then
                        Item.Get("No.")
                    Else
                        Clear(Item);
                End;

                If "No." = '' then begin
                    LowDescription := Description;
                    HighDescription := '';
                end else begin
                    LowDescription := '';
                    HighDescription := Description;
                end;

                If "Gen. Prod. Posting Group" <> 'IFS' then
                    TotalPieces += ("Qty. to Ship Case");
                TotalWeight += ("Net Weight" * "Qty. to Ship");

                If "Qty. to Ship Pallet" > 0 then Begin
                    If Type = Type::Item then begin
                        Item.Get("No.");
                        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET');
                        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');
                        TotalPieces += ("Qty. to Ship Pallet" * (QtyPerPallet / QtyPerCase));
                    End;
                End;

                ParentBinLocation := '';
                ParentBinLocationLabel := '';
                ParentBinCOntent.Reset();
                ParentBinCOntent.SetRange(ParentBinCOntent."Location Code", "Location Code");
                ParentBinCOntent.SetRange(ParentBinCOntent."Item No.", "No.");
                if (ParentBinCOntent.Find('-')) then begin
                    repeat
                        if StrPos(ParentBinLocation, ParentBinCOntent."Bin Code") = 0 then
                            ParentBinLocation := ParentBinLocation + '  ' + ParentBinCOntent."Bin Code";
                    Until ParentBinCOntent.Next() = 0;
                    ParentBinLocationLabel := 'Bin(s): ';
                end;
            end;

            //            trigger OnAfterPostDataItem()
            //            begin
            //                If "Sales Header"."Tax Area Code" <> '' then begin
            //                    SalesTaxCalc.EndSalesTaxCalculation(UseDate);
            //                    SalesTaxCalc.DistTaxOverSalesLines(TempSalesLine);
            //                    SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
            //                    BrkIdx := 0;
            //                    PrevPrintOrder := 0;
            //                    PrevTaxPercent := 0;
            //                    with TempSalesTaxAmtLine do begin
            //                        reset;
            //                        SetCurrentKey("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
            //                        If find('-') then
            //                            repeat
            //                                If ("Print Order" = 0) or
            //                                ("Print Order" <> PrevPrintOrder) or
            //                                ("Tax %" <> PrevTaxPercent)
            //                                then begin
            //                                    BrkIdx := BrkIdx + 1;
            //                                    if BrkIdx > 1 then begin
            //                                        If TaxArea."Country/Region" = TaxArea."Country/Region"::CA then
            //                                            BreakdownTitle := Text006
            //                                        else
            //                                            BreakdownTitle := Text003;
            //                                    end;
            //If BrkIdx > ArrayLen(BreakdownAmt) then begin
            //  BrkIdx := BrkIdx - 1;
            //BreakdownLabel[BrkIdx] := Text004;
            //end else
            //  BreakdownLabel[BrkIdx] := StrSubstNo("Print Description", "Tax %");
            //                                end;
            //                                BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
            //                            until Next = 0;
            //                    end;
            //                    if BrkIdx = 1 then begin
            //                        Clear(BreakdownLabel);
            //                        clear(BreakdownAmt);
            //                    end;
            //                end;
            //            end;
        }

        addfirst("Sales Header")
        {
            dataitem(SalesComment; "Sales Comment Line")
            {
                trigger OnAfterGetRecord()
                begin
                    With TempSalesLine Do Begin
                        INIT;
                        "Document Type" := "Sales Header"."Document Type";
                        "Document No." := "Sales Header"."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    End;
                    If StrLen(Comment) <= MaxStrLen(TempSalesLine.Description) then begin
                        TempSalesLine.Description := Comment;
                        TempSalesLine."Description 2" := '';
                    end else begin
                        SpacePointer := MaxStrLen(TempSalesLine.Description) + 1;
                        TempSalesLine."Qty. to Ship" := 1; //since we dont show items with 0 qty to ship, we need to fake out for comments
                        while (SpacePointer > 1) And (Comment[SpacePointer] <> ' ') do
                            SpacePointer := SpacePointer - 1;
                        If SpacePointer = 1 then
                            SpacePointer := MaxStrLen(TempSalesLine.Description) + 1;
                        TempSalesLine."Qty. to Ship" := 1;
                        //since we dont show items with 0 qty to ship, we need to fake out for comments
                        TempSalesLine.Description := CopyStr(Comment, 1, SpacePointer - 1);
                        TempSalesLine."Description 2" := CopyStr(CopyStr(Comment, SpacePointer + 1), 1, MaxStrLen(TempSalesLine."Description 2"));
                    end;
                    TempSalesLine.Insert;
                end;
            }
        }
    }
    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;


    var
        CompanyInformation: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        RespCenter: Record "Responsibility Center";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        PaymentTerms: Record "Payment Terms";
        ShipMethod: Record "Shipment Method";
        ShipAgent: Record "Shipping Agent";
        Cust: Record Customer;
        TaxArea: Record "Tax Area";
        SalesCommentLine1: Record "Sales Comment Line";
        SalesCommentLine: Record "Sales Comment Line";
        TempSalesLine: Record "Sales Line";
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line";
        TempItem: Record Item;
        Item: Record Item;
        ParentBinCOntent: Record "Bin Content";
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        TaxFlag: Boolean;
        FormatAddress: Codeunit "Format Address";
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        UOMMgt: Codeunit "Unit of Measure Management";
        CompanyAddress: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        CustAddr: array[8] of Text[100];
        BreakdownAmt: array[8] of Decimal;
        LineNo: Integer;
        HighestLineNo: Integer;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        SpacePointer: Integer;
        OnLineNumber: Integer;
        UseDate: Date;
        BreakdownTitle: Text;
        BreakdownLabel: text;
        TotalTaxLabel: Text;
        TaxRegNo: Text;
        TaxRegLabel: Text;
        BarcodeNo: Text;
        PickPrintComment: Text;
        RePrintMessage: Text;
        NotesMessage: Text;
        TempDesc3: Text;
        HighDescription: Text;
        EncodedText: Text;
        LowDescription: Text;
        Text004toString: Text;
        ParentBinLocationLabel: Text;
        TotalPieces: Decimal;
        PrevTaxPercent: Decimal;
        TotalWeight: Decimal;
        TaxLiable: Decimal;
        TaxAmount: Decimal;
        AmountExclInvDisc: Decimal;
        NumberOfLines: Decimal;
        UnitPriceToPrint: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        DayOfWeek: Code[20];
        ParentBinLocation: Code[100];
        Text000: Label 'COPY';
        Text001: label 'Transferred from page %1';
        Text002: label 'Transferred to page %1';
        Text003: label 'Sales Tax Breakdown:';
        Text004: Char;
        Text005: Label 'Total Sales Tax:';
        Text006: Label 'Tax Breakdown:';
        Text007: Label 'Total Tax:';
        Text008: Label 'Tax:';

}