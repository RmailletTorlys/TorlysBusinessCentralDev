report 50018 "Packing Slip"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/PackingSlip.rdlc';
    Caption = 'Sales Shipment';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
            RequestFilterHeading = 'Sales Shipment';
            column(No_SalesShptHeader; "No.")
            {
            }
            column(ShippingAgent; ShippingAgent.Name)
            {

            }
            column(Comment; Comment)
            {

            }
            column(Tag_Name; "Tag Name")
            {

            }
            column(Your_Reference; "Your Reference")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");

                dataitem(SalesLineComments; "Sales Comment Line")
                {
                    DataItemLink = "No." = field("Document No."), "Document Line No." = field("Line No.");
                    DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") where("Document Type" = const(Shipment), "Print On Shipment" = const(true));

                    trigger OnAfterGetRecord()
                    begin
                        InsertTempLine(Comment, 10);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    TempSalesShipmentLine := "Sales Shipment Line";
                    TempSalesShipmentLine.Insert();
                    TempSalesShipmentLineAsm := "Sales Shipment Line";
                    TempSalesShipmentLineAsm.Insert();
                    HighestLineNo := "Line No.";

                    SRSetup.GET();
                end;

                trigger OnPreDataItem()
                begin
                    TempSalesShipmentLine.Reset();
                    TempSalesShipmentLine.DeleteAll();
                    TempSalesShipmentLineAsm.Reset();
                    TempSalesShipmentLineAsm.DeleteAll();
                end;
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLink = "No." = field("No.");
                DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") where("Document Type" = const(Shipment), "Print On Shipment" = const(true), "Document Line No." = const(0));

                trigger OnAfterGetRecord()
                begin
                    TempSalesShipmentLine.Init();
                    TempSalesShipmentLine."Document No." := "Sales Shipment Header"."No.";
                    TempSalesShipmentLine."Line No." := HighestLineNo + 1000;
                    HighestLineNo := TempSalesShipmentLine."Line No.";
                    TempSalesShipmentLine.Insert();

                    If StrLen(Comment) <= MaxStrLen(TempSalesShipmentLine.Description) then begin
                        TempSalesShipmentLine.Description := Comment;
                        TempSalesShipmentLine."Description 2" := '';
                    end else begin
                        SpacePointer := MaxStrLen(TempSalesShipmentLine.Description) + 1;
                        While (SpacePointer > 1) and (Comment[SpacePointer] <> ' ') do
                            SpacePointer := SpacePointer - 1;
                        If SpacePointer = 1 then
                            SpacePointer := MaxStrLen(TempSalesShipmentLine.Description) + 1;
                        TempSalesShipmentLine.Description := CopyStr(CopyStr(Comment, 1, SpacePointer - 1), 1, MaxStrLen(TempSalesShipmentLine.Description));
                        TempSalesShipmentLine."Description 2" := CopyStr(CopyStr(Comment, SpacePointer + 1), 1, MaxStrLen(TempSalesShipmentLine."Description 2"));
                        TempSalesShipmentLine.Insert();
                    end;
                end;
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);

                column(NoCopies; Number)
                {

                }
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo3.Picture)
                    {
                    }
                    column(CompanyAddress1; CompanyAddress[1])
                    {
                    }
                    column(CompanyAddress2; CompanyAddress[2])
                    {
                    }
                    column(CompanyAddress3; CompanyAddress[3])
                    {
                    }
                    column(CompanyAddress4; CompanyAddress[4])
                    {
                    }
                    column(CompanyAddress5; CompanyAddress[5])
                    {
                    }
                    column(CompanyAddress6; CompanyAddress[6])
                    {
                    }
                    column(CopyTxt; CopyTxt)
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
                    column(BillToAddress7; BillToAddress[7])
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
                    column(ShipToAddress7; ShipToAddress[7])
                    {
                    }
                    column(selltoaddr1; selltoaddr[1])
                    { }
                    column(selltoaddr2; selltoaddr[2])
                    { }
                    column(selltoaddr3; selltoaddr[3])
                    { }
                    column(selltoaddr4; selltoaddr[4])
                    { }
                    column(selltoaddr5; selltoaddr[5])
                    { }
                    column(selltoaddr6; selltoaddr[6])
                    { }
                    column(selltoaddr7; selltoaddr[7])
                    { }
                    column(selltoaddr8; selltoaddr[8])
                    { }

                    column(ShipToAddrTly1; ShipToAddrTly[1])
                    { }
                    column(ShipToAddrTly2; ShipToAddrTly[2])
                    { }
                    column(ShipToAddrTly3; ShipToAddrTly[3])
                    { }
                    column(ShipToAddrTly4; ShipToAddrTly[4])
                    { }
                    column(ShipToAddrTly5; ShipToAddrTly[5])
                    { }
                    column(ShipToAddrTly6; ShipToAddrTly[6])
                    { }
                    column(ShipToAddrTly7; ShipToAddrTly[7])
                    { }
                    column(ShipToAddrTly8; ShipToAddrTly[8])
                    { }
                    column(BilltoCustNo_SalesShptHeader; "Sales Shipment Header"."Bill-to Customer No.")
                    {
                    }
                    column(ExtDocNo_SalesShptHeader; "Sales Shipment Header"."External Document No.")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ShptDate_SalesShptHeader; "Sales Shipment Header"."Shipment Date")
                    {
                    }
                    column(CompanyAddress7; CompanyAddress[7])
                    {
                    }
                    column(CompanyAddress8; CompanyAddress[8])
                    {
                    }
                    column(BillToAddress8; BillToAddress[8])
                    {
                    }
                    column(ShipToAddress8; ShipToAddress[8])
                    {
                    }
                    column(ShipmentMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(OrderDate_SalesShptHeader; Format("Sales Shipment Header"."Order Date", 0, '<month,2>/<day,2>/<year,4>'))
                    {
                    }
                    column(OrderNo_SalesShptHeader; "Sales Shipment Header"."Order No.")
                    {
                    }
                    column(PackageTrackingNoText; PackageTrackingNoText)
                    {
                    }
                    column(ShippingAgentCodeText; ShippingAgentCodeText)
                    {
                    }
                    column(ShippingAgentCodeLabel; ShippingAgentCodeLabel)
                    {
                    }
                    column(PackageTrackingNoLabel; PackageTrackingNoLabel)
                    {
                    }
                    column(TaxRegNo; TaxRegNo)
                    {
                    }
                    column(TaxRegLabel; TaxRegLabel)
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(PageLoopNumber; Number)
                    {
                    }
                    column(BillCaption; BillCaptionLbl)
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
                    {
                    }
                    column(CustomerIDCaption; CustomerIDCaptionLbl)
                    {
                    }
                    column(PONumberCaption; PONumberCaptionLbl)
                    {
                    }
                    column(SalesPersonCaption; SalesPersonCaptionLbl)
                    {
                    }
                    column(ShipCaption; ShipCaptionLbl)
                    {
                    }
                    column(ShipmentCaption; ShipmentCaptionLbl)
                    {
                    }
                    column(ShipmentNumberCaption; ShipmentNumberCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(ShipViaCaption; ShipViaCaptionLbl)
                    {
                    }
                    column(PODateCaption; PODateCaptionLbl)
                    {
                    }
                    column(OurOrderNoCaption; OurOrderNoCaptionLbl)
                    {
                    }
                    dataitem(SalesShptLine; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(SalesShptLineNumber; Number)
                        {
                        }
                        column(TempSalesShptLineNo; TempSalesShipmentLine."No.")
                        {
                        }
                        column(itemtype; TempSalesShipmentLine.Type)
                        {

                        }
                        column(TempSalesShptLineUOM; TempSalesShipmentLine."Unit of Measure Code")
                        {
                        }
                        column(TempSalesShptLineQy; TempSalesShipmentLine.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(OrderedQuantity; OrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(BackOrderedQuantity; BackOrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(TempSalesShptLineDesc; TempSalesShipmentLine.Description + ' ' + TempSalesShipmentLine."Description 2")
                        {
                        }
                        column(PackageTrackingText; PackageTrackingText)
                        {
                        }
                        column(desc2; tempsalesshipmentline."Description 2")
                        {

                        }
                        column(AsmHeaderExists; AsmHeaderExists)
                        {
                        }
                        column(PrintFooter; PrintFooter)
                        {
                        }
                        column(ItemNoCaption; ItemNoCaptionLbl)
                        {
                        }
                        column(UnitCaption; UnitCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(ShippedCaption; ShippedCaptionLbl)
                        {
                        }
                        column(OrderedCaption; OrderedCaptionLbl)
                        {
                        }
                        column(BackOrderedCaption; BackOrderedCaptionLbl)
                        {
                        }
                        column(TempSalesShipmentLineNetWeight; TempSalesShipmentLine."Net Weight")
                        {

                        }
                        column(TotalPieces; TotalPieces)
                        {

                        }
                        column(TempSalesShipmentLinePallet; TempSalesShipmentLine."Quantity Pallet")
                        {

                        }
                        column(TempSalesShipmentLineCaseEnd; TempSalesShipmentLine."Quantity Case")
                        {

                        }
                        column(TempSalesShipmentLineItemRefNo; TempSalesShipmentLine."Item Reference No.")
                        {

                        }
                        column(TempDesc3; TempDesc3)
                        {

                        }
                        dataitem(AsmLoop; "Integer")
                        {
                            DataItemTableView = sorting(Number);
                            column(PostedAsmLineItemNo; BlanksForIndent() + PostedAsmLine."No.")
                            {
                            }
                            column(PostedAsmLineDescription; BlanksForIndent() + PostedAsmLine.Description)
                            {
                            }
                            column(PostedAsmLineQuantity; PostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(PostedAsmLineUOMCode; GetUnitOfMeasureDescr(PostedAsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    PostedAsmLine.FindSet()
                                else
                                    PostedAsmLine.Next();
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break();
                                if not AsmHeaderExists then
                                    CurrReport.Break();
                                if not TempSalesShipmentLineAsm.Get(TempSalesShipmentLine."Document No.", TempSalesShipmentLine."Line No.") then
                                    CurrReport.Break();
                                PostedAsmLine.SetRange("Document No.", PostedAsmHeader."No.");
                                SetRange(Number, 1, PostedAsmLine.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            SalesShipmentLine: Record "Sales Shipment Line";
                        begin
                            OnLineNumber := OnLineNumber + 1;

                            if OnLineNumber = 1 then
                                TempSalesShipmentLine.Find('-')
                            else
                                TempSalesShipmentLine.Next();

                            Clear(TempDesc3);
                            If (TempSalesShipmentLine."Item Reference No." <> '') then begin
                                Clear(ItemBuffer);
                                ItemBuffer.Get(TempSalesShipmentLine."No.");
                                TempDesc3 := TempSalesShipmentLine.Description;
                                TempSalesShipmentLine.Description := ItemBuffer.Description;
                                TempSalesShipmentLine.Modify();
                            end;

                            OrderedQuantity := 0;
                            BackOrderedQuantity := 0;
                            if TempSalesShipmentLine."Order No." = '' then
                                OrderedQuantity := TempSalesShipmentLine.Quantity
                            else
                                if OrderLine.Get(1, TempSalesShipmentLine."Order No.", TempSalesShipmentLine."Order Line No.") then begin
                                    OrderedQuantity := OrderLine.Quantity;
                                    BackOrderedQuantity := OrderLine."Outstanding Quantity";
                                end else begin
                                    ReceiptLine.SetCurrentKey("Order No.", "Order Line No.");
                                    ReceiptLine.SetRange("Order No.", TempSalesShipmentLine."Order No.");
                                    ReceiptLine.SetRange("Order Line No.", TempSalesShipmentLine."Order Line No.");
                                    ReceiptLine.Find('-');
                                    repeat
                                        OrderedQuantity := OrderedQuantity + ReceiptLine.Quantity;
                                    until 0 = ReceiptLine.Next();
                                end;

                            if TempSalesShipmentLine.Type = TempSalesShipmentLine.Type::" " then begin
                                OrderedQuantity := 0;
                                BackOrderedQuantity := 0;
                                TempSalesShipmentLine."No." := '';
                                TempSalesShipmentLine."Unit of Measure" := '';
                                TempSalesShipmentLine.Quantity := 0;
                            end else
                                if TempSalesShipmentLine.Type = TempSalesShipmentLine.Type::"G/L Account" then
                                    TempSalesShipmentLine."No." := '';

                            PackageTrackingText := '';
                            if (TempSalesShipmentLine."Package Tracking No." <> "Sales Shipment Header"."Package Tracking No.") and
                               (TempSalesShipmentLine."Package Tracking No." <> '') and PrintPackageTrackingNosVar
                            then
                                PackageTrackingText := Text002Lbl + ' ' + TempSalesShipmentLine."Package Tracking No.";

                            if DisplayAssemblyInformation then
                                if TempSalesShipmentLineAsm.Get(TempSalesShipmentLine."Document No.", TempSalesShipmentLine."Line No.") then begin
                                    SalesShipmentLine.Get(TempSalesShipmentLine."Document No.", TempSalesShipmentLine."Line No.");
                                    AsmHeaderExists := SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader);
                                end;

                            // If TempSalesShipmentLine.Type = TempSalesShipmentLine.Type::" " then
                            //     if (TempSalesShipmentLine.Quantity = 0) and (BackOrderedQuantity = 0) then
                            //         CurrReport.Skip();

                            If (TempSalesShipmentLine."Qty. to Ship Pallet" > 0) and (TempSalesShipmentLine.Type = TempSalesShipmentLine.Type::Item) then begin
                                Item.Get(TempSalesShipmentLine."No.");
                                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'Pallet');
                                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'Case');
                                TotalPieces := (TempSalesShipmentLine."Qty. to Ship Pallet" * (QtyPerPallet / QtyPerCase)) + TempSalesShipmentLine."Quantity Case"
                            end else
                                TotalPieces := TempSalesShipmentLine."Quantity Case";

                            If (TempsalesShipmentline."Gen. Prod. Posting Group" = 'MOULDINGS') then begin
                                //"To Ship - Singles" := 0;
                                TempSalesShipmentLine."Qty. to Ship Case" := 0;
                                TempSalesShipmentLine."Qty. to Ship Pallet" := 0;
                                TotalPieces := 0;
                            end;

                            IF TempSalesShipmentLine."Gen. Prod. Posting Group" = 'MQ MOULDINGS' THEN BEGIN
                                //"To Ship - Singles" := 0;
                                TempSalesShipmentLine."Qty. to Ship Case" := 0;
                                TempSalesShipmentLine."Qty. to Ship Pallet" := 0;
                                TotalPieces := 0;
                            END;

                            IF TempSalesShipmentLine."Gen. Prod. Posting Group" = 'SS MOULDINGS' THEN BEGIN
                                //"To Ship - Singles" := 0;
                                TempSalesShipmentLine."Qty. to Ship Case" := 0;
                                TempSalesShipmentLine."Qty. to Ship Pallet" := 0;
                                TotalPieces := 0;
                            END;

                            IF TempSalesShipmentLine."Gen. Prod. Posting Group" = 'UNDERLAYMENT' THEN BEGIN
                                //"To Ship - Singles" := 0;
                                TempSalesShipmentLine."Qty. to Ship Case" := 0;
                                TempSalesShipmentLine."Qty. to Ship Pallet" := 0;
                                TotalPieces := 0;
                            end;

                            if OnLineNumber = NumberOfLines then
                                PrintFooter := true;
                        end;

                        trigger OnPreDataItem()
                        begin
                            NumberOfLines := TempSalesShipmentLine.Count();
                            SetRange(Number, 1, NumberOfLines);
                            OnLineNumber := 0;
                            PrintFooter := false;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if CopyNo = NoLoops then begin
                        if not CurrReport.Preview then
                            SalesShipmentPrinted.Run("Sales Shipment Header");
                        CurrReport.Break();
                    end;
                    CopyNo := CopyNo + 1;
                    if CopyNo = 1 then // Original
                        Clear(CopyTxt)
                    else
                        CopyTxt := Text000Lbl;
                end;

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, NoCopiesVar + 1);
                    NoLoops := 1 + Abs(NoCopiesVar);
                    if NoLoops <= 0 then
                        NoLoops := 1;
                    CopyNo := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if PrintCompany then
                    if RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                CurrReport.Language := LanguageMgt.GetLanguageIdOrDefault("Language Code");
                CurrReport.FormatRegion := LanguageMgt.GetFormatRegionOrDefault("Format Region");

                if "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.Get("Salesperson Code");

                if "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                if "Shipping Agent Code" = '' then
                    Clear(ShippingAgent)
                else
                    ShippingAgent.get("Shipping Agent Code");

                // if "Sell-to Customer No." = '' then begin
                //     "Bill-to Name" := Text009;
                //     "Ship-to Name" := Text009;
                // end;
                if not Cust.Get("Sell-to Customer No.") then
                    Clear(Cust);

                FormatAddress.SalesShptBillTo(BillToAddress, BillToAddress, "Sales Shipment Header");
                FormatAddress.SalesShptShipTo(ShipToAddress, "Sales Shipment Header");

                selladdr(selltoaddr, "Sales Shipment Header");
                ShipAddrTly(ShipToAddrTly, "Sales Shipment Header");

                ShippingAgentCodeLabel := '';
                ShippingAgentCodeText := '';
                PackageTrackingNoLabel := '';
                PackageTrackingNoText := '';
                if PrintPackageTrackingNosVar then begin
                    ShippingAgentCodeLabel := Text003Lbl;
                    ShippingAgentCodeText := "Sales Shipment Header"."Shipping Agent Code";
                    PackageTrackingNoLabel := Text001Lbl;
                    PackageTrackingNoText := "Sales Shipment Header"."Package Tracking No.";
                end;

                TotalPieces := 0.0;

                if LogInteractionVar then
                    if not CurrReport.Preview then
                        SegManagement.LogDocument(
                          5, "No.", 0, 0, DATABASE::Customer, "Sell-to Customer No.",
                          "Salesperson Code", "Campaign No.", "Posting Description", '');
                TaxRegNo := '';
                TaxRegLabel := '';
                if "Tax Area Code" <> '' then begin
                    TaxArea.Get("Tax Area Code");
                    case TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            ;
                        TaxArea."Country/Region"::CA:
                            begin
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    end;
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = false;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoCopies; NoCopiesVar)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Number of Additional Copies';
                        ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                        MinValue = 0;
                    }
                    field(PrintCompanyAddress; PrintCompany)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Company Address';
                        ToolTip = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.';
                    }
                    field(PrintPackageTrackingNos; PrintPackageTrackingNosVar)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Package Tracking Nos.';
                        ToolTip = 'Specifies if you want the individual package tracking numbers to be printed on each line.';
                    }
                    field(LogInteraction; LogInteractionVar)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';
                    }
                    field(DisplayAsmInfo; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies that you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := LogInteractionVar;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        SalesSetup.Get();

        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                begin
                    CompanyInfo3.Get();
                    CompanyInfo3.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.Get();
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.Get();
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction();

        CompanyInformation.Get();
        SalesSetup.Get();

        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                CompanyInformation.CalcFields(Picture);
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.Get();
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.Get();
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;

        if PrintCompany then
            FormatAddress.Company(CompanyAddress, CompanyInformation)
        else
            Clear(CompanyAddress);
    end;

    var

        ShipmentMethod: Record "Shipment Method";
        ReceiptLine: Record "Sales Shipment Line";
        OrderLine: Record "Sales Line";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        CompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        TempSalesShipmentLine: Record "Sales Shipment Line" temporary;
        TempSalesShipmentLineAsm: Record "Sales Shipment Line" temporary;
        RespCenter: Record "Responsibility Center";
        TaxArea: Record "Tax Area";
        Cust: Record Customer;
        Item: Record Item;
        ItemBuffer: Record Item;
        ShippingAgent: Record "Shipping Agent";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        SRSetup: Record "Sales & Receivables Setup";
        LanguageMgt: Codeunit Language;
        UOMMgt: Codeunit "Unit of Measure Management";
        SalesShipmentPrinted: Codeunit "Sales Shpt.-Printed";
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CompanyAddress: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        CopyTxt: Text;
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        NoCopiesVar: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        SpacePointer: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        HighestLineNo: Integer;
        OrderedQuantity: Decimal;
        TotalPieces: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
        BackOrderedQuantity: Decimal;
        PackageTrackingText: Text;
        PrintPackageTrackingNosVar: Boolean;
        PackageTrackingNoText: Text;
        PackageTrackingNoLabel: Text;
        ShippingAgentCodeText: Text;
        ShippingAgentCodeLabel: Text;
        TempDesc3: Text;
        LogInteractionVar: Boolean;
        selltoaddr: array[8] of Text;
        ShipToAddrTly: array[8] of Text;
        Text000Lbl: Label 'COPY';
        Text001Lbl: Label 'Tracking No.';
        Text002Lbl: Label 'Specific Tracking No.';
        Text003Lbl: Label 'Shipping Agent';
        TaxRegNo: Text;
        TaxRegLabel: Text;
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmHeaderExists: Boolean;
        BillCaptionLbl: Label 'Bill';
        ToCaptionLbl: Label 'To:';
        CustomerIDCaptionLbl: Label 'Customer ID';
        PONumberCaptionLbl: Label 'P.O. Number';
        SalesPersonCaptionLbl: Label 'SalesPerson';
        ShipCaptionLbl: Label 'Ship';
        ShipmentCaptionLbl: Label 'SHIPMENT';
        ShipmentNumberCaptionLbl: Label 'Shipment Number:';
        ShipmentDateCaptionLbl: Label 'Shipment Date:';
        PageCaptionLbl: Label 'Page:';
        ShipViaCaptionLbl: Label 'Ship Via';
        PODateCaptionLbl: Label 'P.O. Date';
        OurOrderNoCaptionLbl: Label 'Our Order No.';
        ItemNoCaptionLbl: Label 'Item No.';
        UnitCaptionLbl: Label 'Unit';
        DescriptionCaptionLbl: Label 'Description';
        ShippedCaptionLbl: Label 'Shipped';
        OrderedCaptionLbl: Label 'Ordered';
        BackOrderedCaptionLbl: Label 'Back Ordered';
        FormatAddr1: Codeunit "Format Address";

    protected var
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";

    procedure InitLogInteraction()
    begin
        LogInteractionVar := SegManagement.FindInteractionTemplateCode("Interaction Log Entry Document Type"::"Sales Shpt. Note") <> '';
    end;

    procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[10]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(CopyStr(UnitOfMeasure.Description, 1, 10));
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;

    // procedure InitializeRequest(NewNoOfCopies: Integer)
    // begin
    //     NoCopiesVar := NewNoOfCopies;
    // end;

    local procedure InsertTempLine(Comment: Text[80]; IncrNo: Integer)
    begin
        TempSalesShipmentLine.Init();
        TempSalesShipmentLine."Document No." := "Sales Shipment Header"."No.";
        TempSalesShipmentLine."Line No." := HighestLineNo + IncrNo;
        HighestLineNo := TempSalesShipmentLine."Line No.";
        FormatDocument.ParseComment(Comment, TempSalesShipmentLine.Description, TempSalesShipmentLine."Description 2");
        TempSalesShipmentLine.Insert();
    end;

    local procedure selladdr(var AddrArray: array[8] of Text[100]; var SalesHeader: Record "Sales Shipment Header")
    var
    begin
        FormatAddr1.FormatAddr(
            AddrArray, '', '', SalesHeader."Sell-to Customer Name", SalesHeader."Sell-to Address", SalesHeader."Sell-to Address 2",
            SalesHeader."Sell-to City", SalesHeader."Sell-to Post Code", '', SalesHeader."Sell-to Country/Region Code");
    end;

    local procedure ShipAddrTly(var AddrArray: array[8] of Text[100]; var SalesHeader: Record "Sales Shipment Header")
    var
    begin
        FormatAddr1.FormatAddr(
            AddrArray, '', '', SalesHeader."Ship-to Name", SalesHeader."Ship-to Address", SalesHeader."Ship-to Address 2",
            SalesHeader."Ship-to City", SalesHeader."Ship-to Post Code", '', SalesHeader."Ship-to Country/Region Code");
    end;
}

