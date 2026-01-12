reportextension 51000 "TorlysPickSlip" extends "Pick Instruction"
{
    dataset
    {
        add("Sales Header")
        {
            column(Your_Reference; "Your Reference")
            {

            }
            column(EncodedText; EncodedText)
            {

            }
            column(Tag_Name; "Tag Name")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(SystemCreatedBy; LookupUserIdWithGuid(SystemCreatedBy))
            {

            }
            column(Comment; Comment)
            {

            }
            column(RePrintMessage; RePrintMessage)
            {

            }
            column(Pick_Slip_Printed_By; "Pick Slip Printed By")
            {

            }
            column(Pick_Slip_Printed_Date; Format("Pick Slip Printed Date", 0, '<month,2>/<day,2>/<year,2>'))
            {

            }
            column(Pick_Slip_Printed_Time; Format("Pick Slip Printed Time", 0, '<Hours24,2>:<Minutes,2>:<Seconds,2>'))
            {

            }
            column(No__Pick_Slips_Printed; "No. Pick Slips Printed")
            {

            }
            column(Order_Date; Format("Order Date", 0, '<month,2>/<day,2>/<year,2>'))
            {

            }
            column(Shipment_Date; Format("Shipment Date", 0, '<month,2>/<day,2>/<year,2>'))
            {

            }
            column(ShippingAgentCode; ShippingAgent.Code)
            {

            }
            column(PritingDescription; ShippingAgent.Name)
            {

            }
            column(agentno; shippingagent."Agent No.")
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
            column(DayofWeek; DayofWeek)
            {

            }
            column(Paymenttermsdesc; PaymentTerms.Description)
            {

            }
            column(TotalPieces; TotalPieces)
            {

            }
            column(TotalWeight; TotalWeight)
            {

            }
            column(Ship_to_Code; "Ship-to Code")
            {

            }
        }

        add("sales Line")
        {
            column(Document_No_; "Document No.")
            {

            }
            column(LocationCode; "Location Code")
            {

            }
            column(No_; "No.")
            {

            }
            column(description; (Description + ' ' + "Description 2"))
            {

            }
            column(UOM; "Unit of Measure Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(qty_to_ship; "Qty. to Ship")
            {

            }
            column(QtyPallet; "Qty. to Ship Pallet")
            {

            }
            column(QtyCase; "Qty. to Ship Case")
            {

            }
            column(ParentBinLocationLabel; ParentBinLocationLabel)
            {

            }
            column(ParentBinLocation; ParentBinLocation)
            {

            }
        }
        modify("Sales Header")
        {
            RequestFilterFields = "Ship-to Code";
            trigger OnAfterPreDataItem()
            begin
                "Sales Header".FilterGroup(2);
                "Sales Header".SetFilter("Qty. to Ship", '>0');
                "Sales Header".SetFilter("Status", 'Released');
                "Sales Header".SetFilter("On Hold", '%1', '');
                "Sales Header".FilterGroup(0);
            end;

            trigger OnAfterAfterGetRecord()
            var
                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";
                BarcodeStrings: Code[20];
            begin
                // "Sales Header".Reset();
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

                If "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                Else
                    SalesPurchPerson.get("Salesperson Code");

                If "Payment Terms Code" = '' then
                    Clear(PaymentTerms)
                Else
                    PaymentTerms.get("Payment Terms Code");

                If "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                Else
                    ShipmentMethod.get("Shipment Method Code");

                If "Shipping Agent Code" = '' then
                    Clear(ShippingAgent)
                Else
                    ShippingAgent.get("Shipping Agent Code");

                FormatAddress.SalesHeaderBillTo(BillToAddress, "Sales Header");
                FormatAddress.SalesHeaderShipTo(ShipToAddress, CustAddress, "Sales Header");

                Clear(BreakdownTitle);
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                TotalTaxLabel := Text008Lbl;
                TaxRegNo := '';
                TaxRegLabel := '';
                If "Tax Area Code" <> '' then begin
                    TaxArea.get("Tax Area Code");
                    Case TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            TotalTaxLabel := Text005Lbl;
                        TaxArea."Country/Region"::CA:
                            begin
                                TotalTaxLabel := Text007Lbl;
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    End;
                    SalesTaxCalc.StartSalesTaxCalculation();
                end;

                If "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                Else
                    UseDate := WorkDate();

                CurrReport.PageNo := 1;

                If Not CurrReport.Preview then begin
                    PickPrintComment := StrSubstNo(Text009Lbl, UserId, WorkDate(), Time);
                    SalesCommentLine1.Reset();
                    SalesCommentLine1.SetCurrentKey("Document Type", "No.");
                    SalesCommentLine1.SetRange("Document Type", "Document Type");
                    SalesCommentLine1.SetRange("No.", "No.");
                    If SalesCommentLine1.Find('+') then LineNo := SalesCommentLine1."Line No.";
                    SalesCommentLine1.Init();
                    SalesCommentLine1."Document Type" := "Document Type";
                    SalesCommentLine1."No." := "No.";
                    SalesCommentLine1."Line No." := LineNo + 10000;
                    SalesCommentLine1.Date := WorkDate();
                    //SalesCommentLine1.SystemCreatedBy := UserId;
                    SalesCommentLine1.Comment := CopyStr(PickPrintComment, 1, 80);
                    //SalesCommentLine1.Code := SalesCommentLine1.Code::"DOC-PRINT";
                    SalesCommentLine1.Insert();
                    Modify();
                end;

                If Not CurrReport.Preview then begin
                    "Pick Slip Printed By" := Format(UserId());
                    "Pick Slip Printed Date" := WorkDate();
                    "Pick Slip Printed Time" := Time;
                    "No. Pick Slips Printed" := "No. Pick Slips Printed" + 1;
                    Modify();
                end;

                TotalPieces := 0;
                TotalWeight := 0;

                If "No. Pick Slips Printed" > 0 then
                    RePrintMessage := 'REPRINT'
                else
                    RePrintMessage := '';

                SalesCommentLine.Reset();
                SalesCommentLine.SetRange("No.", "No.");
                SalesCommentLine.SetFilter("Print On Pick Ticket", 'Yes');
                if (SalesCommentLine.Find('-')) then
                    NotesMessages := 'SEE NOTES'
                Else
                    NotesMessages := '';

                case Date2DWY("Shipment Date", 1) of
                    1:
                        DayofWeek := 'Monday';
                    2:
                        DayofWeek := 'Tuesday';
                    3:
                        DayofWeek := 'Wednesday';
                    4:
                        DayofWeek := 'Thursday';
                    5:
                        DayofWeek := 'Friday';
                end;
            end;
        }
        modify("Sales Line")
        {
            trigger OnAfterPreDataItem()
            Begin
                TempSalesLine.Reset();
                TempSalesLine.DeleteAll();
            End;

            trigger OnAfterAfterGetRecord()
            begin
                If Type = Type::Item then
                    If "Qty. to Ship" = 0 then
                        If (Quantity - "Quantity Shipped" = 0) then
                            CurrReport.Skip();


                Clear(TempDesc3);

                If ("Item Reference No." <> '') then begin
                    Clear(TempItem);
                    TempItem.Get("No.");
                    TempDesc3 := Description;
                    Description := TempItem.Description;
                    Modify();
                end;

                If Type = Type::" " then begin
                    "No." := '';
                    "Unit of Measure" := '';
                    "Line Amount" := 0;
                    "Inv. Discount Amount" := 0;
                    Quantity := 0;
                end else
                    if Type = Type::"G/L Account" then
                        "No." := '';

                TaxAmount := "Amount Including VAT" - Amount;
                If TaxAmount <> 0 then begin
                    TaxFlag := true;
                    TaxLiable := Amount;
                end else begin
                    TaxFlag := false;
                    TaxLiable := 0;
                end;

                AmountExclInvDisc := "Line Amount";

                If Quantity = 0 then
                    UnitPriceToPrint := 0
                else
                    UnitPriceToPrint := Round(AmountExclInvDisc / Quantity, 0.00001);

                If Type = Type::Item then
                    Item.Get("No.")
                Else
                    Clear(Item);

                If "No." = '' then begin
                    LowDescription := Description;
                    HighDescription := '';
                end else begin
                    LowDescription := '';
                    HighDescription := Description;
                end;

                If "Gen. Prod. Posting Group" <> 'IFS' then
                    TotalPieces += "Qty. to Ship Case";

                If "Gen. Prod. Posting Group" <> 'IFS' then
                    TotalWeight += "Net Weight" * "Qty. to Ship";

                If "Qty. to Ship Pallet" > 0 then
                    if Type = Type::Item then begin
                        Item.get("No.");
                        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'Pallet');
                        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'Case');
                        TotalPieces += ("Qty. to Ship Pallet" * (QtyPerPallet / QtyPerCase));
                    end;

                if ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then
                    TotalPieces := TotalPieces + "Qty. to Ship";

                If ("Gen. Prod. Posting Group" = 'MOULDINGS') then
                    IF ("Item Category Code" <> 'ACC-86') AND (TempSalesLine."Item Category Code" <> 'ACC-107') AND
                    ("Item Category Code" <> 'ACC-108') THEN BEGIN
                        //"To Ship - Singles" := 0;
                        "Qty. to Ship Case" := 0;
                        "Qty. to Ship Pallet" := 0
                    end;

                IF "Gen. Prod. Posting Group" = 'MQ MOULDINGS' THEN BEGIN
                    //"To Ship - Singles" := 0;
                    "Qty. to Ship Case" := 0;
                    "Qty. to Ship Pallet" := 0
                END;

                IF "Gen. Prod. Posting Group" = 'SS MOULDINGS' THEN BEGIN
                    //"To Ship - Singles" := 0;
                    "Qty. to Ship Case" := 0;
                    "Qty. to Ship Pallet" := 0
                END;

                IF "Gen. Prod. Posting Group" = 'UNDERLAYMENT' THEN BEGIN
                    //"To Ship - Singles" := 0;
                    "Qty. to Ship Case" := 0;
                    "Qty. to Ship Pallet" := 0
                END;


                ParentBinLocationLabel := '';
                ParentBinLocation := '';
                ParentBinContent.RESET();
                ParentBinContent.SETRANGE("Location Code", "Location Code");
                ParentBinContent.SETRANGE("Item No.", "No.");
                IF (ParentBinContent.FIND('-')) THEN BEGIN
                    REPEAT
                        IF STRPOS(ParentBinLocation, ParentBinContent."Bin Code") = 0 THEN
                            ParentBinLocation := CopyStr(ParentBinLocation + '  ' + ParentBinContent."Bin Code", 1, 200);

                    UNTIL ParentBinContent.NEXT() = 0;
                    ParentBinLocationLabel := 'Bin(s): ';
                END;
            end;

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
        SalesPurchPerson: Record "Salesperson/Purchaser";
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        ShippingAgent: Record "Shipping Agent";
        TaxArea: Record "Tax Area";
        Item: Record Item;
        CompanyInformation: Record "Company Information";
        SalesCommentLine1: Record "Sales Comment Line";
        SalesCommentLine: Record "Sales Comment Line";
        ParentBinContent: Record "Bin Content";
        TempSalesLine: Record "Sales Line" temporary;
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TempItem: Record Item temporary;
        FormatAddress: Codeunit "Format Address";
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        UOMMgt: Codeunit "Unit of Measure Management";
        SalesPrinted: Codeunit "Sales-Printed";
        BillToAddress: array[8] of text;
        ShipToAddress: array[8] of text;
        CustAddress: array[8] of Text;
        TaxFlag: Boolean;
        ParentBinLocation: code[200];
        LineNo: Integer;
        NoLoops: Integer;
        NoCopies: Integer;
        CopyNo: Integer;
        HighestLineNo: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        BreakdownTitle: text;
        DayofWeek: Text;
        ParentBinLocationLabel: Text;
        RePrintMessage: Text;
        BreakdownLabel: Text;
        BreakdownAmt: Decimal;
        PrevTaxPercent: Decimal;
        AmountExclInvDisc: Decimal;
        TaxLiable: Decimal;
        TotalPieces: Decimal;
        TotalWeight: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        UnitPriceToPrint: Decimal;
        TaxAmount: Decimal;
        TotalTaxLabel: Text;
        HighDescription: Text;
        LowDescription: Text;
        TempDesc3: Text;
        NotesMessages: Text;
        PickPrintComment: Text;
        TaxRegLabel: Text;
        EncodedText: Text;
        TaxRegNo: Text;
        UseDate: Date;
        Text000Lbl: Label 'COPY';
#pragma warning disable AA0470
        Text001Lbl: Label 'Transferred from page %1';
        Text002Lbl: Label 'Transferred to page %1';
        Text003Lbl: Label 'Sales tax Breakdown:';
        Text004Lbl: Label 'Other Taxes';
        Text005Lbl: Label 'Total Sales Tax:';
        Text006Lbl: Label 'Tax Breakdown:';
        Text007Lbl: Label 'Total Tax:';
        Text008Lbl: Label 'Tax:';
        Text009Lbl: Label 'Pick Slip printed by %1 on %2 at %3';
#pragma warning restore AA0470
}