report 50026 "Proforma"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/Proforma.rdlc';
    Caption = 'Proforma';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            RequestFilterHeading = 'Sales Order';
            RequestFilterFields = "No.", "Sell-to Customer No.", "Ship-to Code", "Shipment Date";

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where("Document Type" = const(Order));
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");

                trigger OnPreDataItem()
                begin
                    TempSalesLine.Reset();
                    TempSalesLine.DeleteAll();
                end;

                trigger OnAfterGetRecord()
                begin
                    TempSalesLine := "Sales Line";

                    If IgnoreBackorder then begin
                        TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                        TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                    end;
                    TempSalesLine.Insert();

                    If IgnoreBackorder then begin
                        TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                        TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                    end;

                    TempSalesLine.Modify();

                    HighestLineNo := "Line No.";
                    If "Sales Header"."Tax Area Code" <> '' then
                        SalesTaxCalc.AddSalesLine(TempSalesLine);
                end;

                // trigger OnPostDataItem()
                // begin
                //     If "Sales Header"."Tax Area Code" <> '' then begin
                //         SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                //         SalesTaxCalc.DistTaxOverSalesLines(TempSalesLine);
                //         SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                //         BrkIdx := 0;
                //         PrevPrintOrder := 0;
                //         PrevTaxPercent := 0;
                //         with TempSalesTaxAmtLine do begin
                //             Reset();
                //             SetCurrentKey("Print Order","Tax Area Code for Key","Tax Jurisdiction Code");
                //             If find('-') then
                //             repeat
                //             If (("Print Order" = 0) or
                //             ("Print Order" <> PrevPrintOrder) or
                //             ("Tax %" <> PrevTaxPercent))
                //             then begin
                //                 BrkIdx := BrkIdx + 1;

                //                 if BrkIdx > 1 then begin
                //                     If TaxArea."Country/Region" = TaxArea."Country/Region"::CA then
                //                     BreakdownTitle := Text006
                //                     else
                //                     BreakdownTitle := Text003;
                //                 end;

                //                 if BrkIdx > ArrayLen(BreakdownAmt) then begin

                //                 end;
                //             end;
                //         end;
                //     end;    
                // end;

            }

            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") where("Document Type" = const(Order), "Print On Order Confirmation" = const(true));
                DataItemLinkReference = "Sales Header";
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord()
                begin
                    with TempSalesLine do begin
                        INit;
                        "Document Type" := "Sales Header"."Document Type";
                        "Document No." := "Sales Header"."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    end;

                    If StrLen(Comment) <= MaxStrLen(TempSalesLine.Description) then begin
                        TempSalesLine.Description := Comment;
                        TempSalesLine."Description 2" := '';
                        TempSalesLine."Qty. to Ship" := 1;
                        TempSalesLine."Quantity Shipped" := 1;
                    end else begin

                        SpacePointer := MAXSTRLEN(TempSalesLine.Description) + 1;
                        TempSalesLine."Qty. to Ship" := 1; //since we dont show items with 0 qty to ship, we need to fake out for comments
                        TempSalesLine."Quantity Shipped" := 1; //since we dont show items with 0 quantity shipped, we need to fake out for comments
                        WHILE (SpacePointer > 1) AND (Comment[SpacePointer] <> ' ') DO
                            SpacePointer := SpacePointer - 1;

                        IF SpacePointer = 1 THEN
                            SpacePointer := MAXSTRLEN(TempSalesLine.Description) + 1;
                        TempSalesLine."Qty. to Ship" := 1; //since we dont show items with 0 qty to ship, we need to fake out for comments
                        TempSalesLine."Quantity Shipped" := 1; //since we dont show items with 0 quantity shipped, we need to fake out for comments
                        TempSalesLine.Description := COPYSTR(Comment, 1, SpacePointer - 1);
                        TempSalesLine."Description 2" := COPYSTR(COPYSTR(Comment, SpacePointer + 1), 1, MAXSTRLEN(TempSalesLine."Description 2"));
                    end;
                    TempSalesLine.Insert;
                end;
            }

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                DataItemLinkReference = "Sales Header";

                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    DataItemLinkReference = CopyLoop;

                    column(CALaddress1; CALaddress1)
                    {

                    }
                    column(Location; "Sales Header"."Location Code")
                    {

                    }
                    column(CALaddress2; CALaddress2)
                    {

                    }
                    column(CALaddress3; CALaddress3)
                    {

                    }
                    column(CALaddress4; CALaddress4)
                    {

                    }
                    column(CALaddress5; CALaddress5)
                    {

                    }
                    column(ORNo; "Sales Header"."No.")
                    {

                    }
                    column(ORDate; "Sales header"."Order Date")
                    {

                    }
                    column(PageNo; CurrReport.PageNo)
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
                    column(Yourreference; "Sales Header"."Your Reference")
                    {

                    }
                    column(shipvia; "sales header"."Shipping Agent Code")
                    {

                    }
                    column(Shipdate; "Sales Header"."Shipment Date")
                    {

                    }
                    column(Payterms; Paymentterms.Description)
                    {

                    }
                    column(TaxNo; Customer."VAT Registration No.")
                    {

                    }
                    column(tagname; "Sales Header"."Tag Name")
                    {

                    }
                    column(customerID; "Sales Header"."Bill-to Customer No.")
                    {

                    }
                    column(PONumber; "Sales Header"."External Document No.")
                    {

                    }
                    column(PODate; "Sales Header"."Order Date")
                    {

                    }
                    column(Salesperson; salespurchperson.Name)
                    {

                    }

                    dataitem(SalesLine; Integer)
                    {
                        DataItemTableView = sorting(Number);
                        DataItemLinkReference = PageLoop;

                        column(AmountExclInvDisc; AmountExclInvDisc)
                        {

                        }
                        column(TotalAmountExclInvDisc; TotalAmountExclInvDisc)
                        {

                        }
                        column(ItemNo; tempsalesline."No.")
                        {

                        }
                        column(Itemtype; tempsalesline.Type)
                        {

                        }
                        column(Desc; tempsalesline.Description)
                        {

                        }
                        column(Desc2; tempsalesline."Description 2")
                        {

                        }
                        column(UOM; TempSalesLine."Unit of Measure Code")
                        {

                        }
                        column(Weight1Calc; Weight1Calc)
                        {

                        }
                        column(Weight2Calc; Weight2Calc)
                        {

                        }
                        column(Weight1Label; Weight1Label)
                        {

                        }
                        column(Weight2Label; Weight2Label)
                        {

                        }
                        column(QtyOrderedLabel; QtyOrderedLabel)
                        {

                        }
                        column(QtyOrderedNo; QtyOrderedNo)
                        {

                        }
                        column(UnitPriceToPrint; UnitPriceToPrint)
                        {

                        }
                        column(CountryOfOrigin; CountryOfOrigin)
                        {

                        }
                        column(TariffNo; TariffNo)
                        {

                        }
                        column(TariffNote; TariffNote)
                        {

                        }
                        column(TotalWeight; TotalWeight)
                        {

                        }
                        column(TotalPieces; TotalPieces)
                        {

                        }
                        column(TotalLabel; TotalLabel)
                        {

                        }
                        column(BreakdownLabel1; BreakdownLabel[1])
                        {

                        }
                        column(BreakdownLabel2; BreakdownLabel[2])
                        {

                        }
                        column(BreakdownLabel3; BreakdownLabel[3])
                        {

                        }
                        column(BreakdownLabel4; BreakdownLabel[4])
                        {

                        }
                        column(TotalVATAmount; TotalVATAmount)
                        {

                        }
                        column(VATAmount; VATAmount)
                        {

                        }
                        column(BreakdownAmt1; BreakdownAmt[1])
                        {

                        }
                        column(BreakdownAmt2; BreakdownAmt[2])
                        {

                        }
                        column(BreakdownAmt3; BreakdownAmt[3])
                        {

                        }
                        column(BreakdownAmt4; BreakdownAmt[4])
                        {

                        }
                        column(CurrencyCode; CurrencyCode)
                        {

                        }
                        column(GrandTotalLabel; GrandTotalLabel)
                        {

                        }

                        trigger OnPreDataItem()
                        begin
                            CurrReport.CREATETOTALS(TaxLiable, TaxAmount, AmountExclInvDisc, TempSalesLine."Line Amount", TempSalesLine."Inv. Discount Amount",
                                                    TotalPieces);
                            NumberOfLines := TempSalesLine.COUNT;
                            SETRANGE(Number, 1, NumberOfLines);
                            OnLineNumber := 0;
                            PrintFooter := FALSE;

                            GrandTotalLabel := 'Total:';

                            IF IgnoreBackorder THEN BEGIN
                                QtyLabel := '';
                                QtyOrderedLabel := '';
                                TotalLabel := 'Total:';
                                GrandTotalLabel := '';
                                GrandTotal := 0;
                            END
                            ELSE BEGIN
                                QtyLabel := '';
                                QtyOrderedLabel := 'Quantity';
                                TotalLabel := 'Subtotal:';
                                GrandTotal := 1;
                            END;
                        end;

                        trigger OnAfterGetRecord()
                        begin
                            OnLineNumber := OnLineNumber + 1;
                            // TempSalesLine.SetFilter("Document No.", "Sales Header"."No.");

                            with TempSalesLine do begin
                                If OnLineNumber = 1 then
                                    Find('-') else
                                    Next();

                                if Type = Type::" " then begin
                                    "No." := '';
                                    "Unit of Measure code" := '';
                                    "Line Amount" := 0;
                                    "Inv. Discount Amount" := 0;
                                    Quantity := 0;
                                    Weight1Calc := 0;
                                    Weight2Calc := 0;
                                    QtyOrderedNo := 0;
                                    UnitPriceToPrint := 0;
                                    AmountExclInvDisc := 0;
                                end else if type = Type::"G/L Account" then begin
                                    "No." := '';
                                    "Unit of Measure code" := '';
                                    "Line Amount" := 0;
                                    "Inv. Discount Amount" := 0;
                                    Quantity := 0;
                                    Weight1Calc := 0;
                                    Weight2Calc := 0;
                                    QtyOrderedNo := 0;
                                    UnitPriceToPrint := 0;
                                    AmountExclInvDisc := 0;
                                end;

                                TaxAmount := "Amount Including VAT" - Amount;
                                if TaxAmount <> 0 then begin
                                    TaxFlag := true;
                                    TaxLiable := Amount;
                                end else begin
                                    TaxFlag := false;
                                    TaxLiable := 0;
                                end;
                                IF "Sales Header"."Currency Code" = '' THEN BEGIN
                                    CurrencyCode := 'CDN';
                                END ELSE BEGIN
                                    CurrencyCode := "Sales Header"."Currency Code"
                                END;


                                // Message('tempsalesline %1', TempSalesLine);
                                If NOT (Type = Type::" ") and NOt (Type = Type::"G/L Account") then begin
                                    Item3.GET("No.");
                                    IF (OrderShipped) THEN BEGIN
                                        IF (CostInsteadOfPrice) THEN
                                            AmountExclInvDisc := "Unit Cost (LCY)" * "Quantity Shipped"
                                        ELSE IF (UseListPrice) THEN
                                            AmountExclInvDisc := "Unit Price" * "Quantity Shipped"
                                        ELSE IF (BackoutDuty) AND (Item3."Tariff Charge Required") THEN
                                            AmountExclInvDisc := (((ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=')) / 1.25)
                                                                * "Quantity Shipped")
                                        ELSE begin
                                            AmountExclInvDisc := ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') * "Quantity Shipped";
                                            // Message('%1', AmountExclInvDisc);
                                        end;
                                        // AmountExclInvDisc := ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') * "Quantity Shipped";


                                        QtyOrderedNo := "Quantity Shipped";
                                        IF "Quantity Shipped" = 0 THEN
                                            UnitPriceToPrint := 0  // so it won't print
                                        ELSE
                                            UnitPriceToPrint := ROUND(AmountExclInvDisc / "Quantity Shipped", 0.00001);

                                        IF AdditionalWeight = 0 THEN BEGIN
                                            Weight1Label := 'Net Weight (LB)';
                                            Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped");
                                            Weight2Label := 'Net Weight (KG)';
                                            Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped") * 0.453592;
                                        END ELSE BEGIN
                                            Weight1Label := 'Net Weight (KG)';
                                            Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped") * 0.453592;
                                            Weight2Label := 'Gross Weight (KG)';
                                            Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped") * 0.453592;
                                        END;

                                        TotalWeight := TotalWeight + "Net Weight" * "Quantity Shipped";
                                        TotalAmountExclInvDisc += AmountExclInvDisc;

                                        UOM1 := TempSalesLine."Unit of Measure Code";
                                        if (CostInsteadOfPrice) then
                                            VATAmount := Round(("Unit Cost (LCY)" * "Qty. to Invoice" * "VAT %") / 100)
                                        else
                                            VATAmount := Round(Amount * "VAT %" / 100 * ("Qty. to Invoice" / "Quantity Shipped"));

                                        TotalVATAmount += VATAmount;
                                    end;
                                    IF Type = Type::Item THEN BEGIN
                                        IF Item.GET("No.") THEN BEGIN
                                            CountryOfOrigin := Item."Country/Region of Origin Code";
                                            // ICProgramNo := Item.;
                                            TariffNote := Item."Customs/Tariff Note"; //TLY-SD - 04/09/2025
                                            IF UsePurchasesTariff THEN
                                                TariffNo := Item."Tariff No."
                                            ELSE
                                                TariffNo := Item."Tariff No. (Sales)";
                                        END ELSE BEGIN
                                            CountryOfOrigin := '';
                                            TariffNo := '';
                                        END;
                                    END ELSE BEGIN
                                        CountryOfOrigin := '';
                                        TariffNo := '';
                                    END;
                                    TotalPieces := CalcTotalPieces;
                                end;

                                If NOT (Type = Type::" ") and NOt (Type = Type::"G/L Account") then begin
                                    Item3.GET("No.");
                                    IF (NOT OrderShipped) THEN BEGIN
                                        IF (CostInsteadOfPrice) THEN
                                            AmountExclInvDisc := "Unit Cost (LCY)" * "Qty. to Ship"
                                        ELSE IF (UseListPrice) THEN
                                            AmountExclInvDisc := "Unit Price" * "Qty. to Ship"
                                        ELSE IF (BackoutDuty) AND (Item3."Tariff Charge Required") THEN
                                            AmountExclInvDisc := (((ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=')) / 1.25)
                                                                * "Qty. to Ship")
                                        ELSE
                                            AmountExclInvDisc := (ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') * "Qty. to Ship");

                                        QtyOrderedNo := "Qty. to Ship";
                                        IF "Qty. to Ship" = 0 THEN
                                            UnitPriceToPrint := 0  // so it won't print
                                        ELSE
                                            UnitPriceToPrint := ROUND(AmountExclInvDisc / "Qty. to Ship", 0.00001);

                                        IF AdditionalWeight = 0 THEN BEGIN
                                            Weight1Label := 'Net Weight (LB)';
                                            Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship");
                                            Weight2Label := 'Net Weight (KG)';
                                            Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                        END ELSE BEGIN
                                            Weight1Label := 'Net Weight (KG)';
                                            Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                            Weight2Label := 'Gross Weight (KG)';
                                            Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                        END;

                                        TotalWeight := TotalWeight + "Net Weight" * "Qty. to Ship";


                                        // TotalAmountExclInvDisc += AmountExclInvDisc;
                                        // if (CostInsteadOfPrice) then
                                        //     VATAmount := Round(("Unit Cost (LCY)" * "Qty. to Invoice" * "VAT %") / 100)
                                        // else
                                        //     VATAmount := Round(Amount * "VAT %" / 100 * ("Qty. to Invoice" / "Qty. to Ship"));

                                        // TotalVATAmount += VATAmount;
                                        // TotalVATAmount += VATAmount;
                                    END;
                                    // end;

                                    IF Type = Type::Item THEN BEGIN
                                        IF Item.GET("No.") THEN BEGIN
                                            CountryOfOrigin := Item."Country/Region of Origin Code";
                                            // ICProgramNo := Item.;
                                            TariffNote := Item."Customs/Tariff Note"; //TLY-SD - 04/09/2025
                                            IF UsePurchasesTariff THEN
                                                TariffNo := Item."Tariff No."
                                            ELSE
                                                TariffNo := Item."Tariff No. (Sales)";
                                        END ELSE BEGIN
                                            CountryOfOrigin := '';
                                            TariffNo := '';
                                        END;
                                    END ELSE BEGIN
                                        CountryOfOrigin := '';
                                        TariffNo := '';
                                    END;
                                    TotalPieces := CalcTotalPieces;
                                end;
                            end;

                            IF RemoveFreight THEN BEGIN
                                IF TempSalesLine."Gen. Prod. Posting Group" = 'FREIGHT' THEN BEGIN
                                    // IF TempSalesLine."No." = '60700' THEN BEGIN
                                    TempSalesLine."No." := '';
                                    TempSalesLine.Description := '';
                                    TempSalesLine."Description 2" := '';
                                    TempSalesLine."Unit of Measure Code" := '';
                                    Weight1Calc := 0;
                                    Weight2Calc := 0;
                                    QtyOrderedNo := 0;
                                    UnitPriceToPrint := 0;
                                    AmountExclInvDisc := 0;
                                END;
                            END;

                            IF RemoveDuty THEN BEGIN
                                IF TempSalesLine."Gen. Prod. Posting Group" = 'DUTY' THEN BEGIN
                                    // IF TempSalesLine."No." = '51400' THEN BEGIN
                                    TempSalesLine."No." := '';
                                    TempSalesLine.Description := '';
                                    TempSalesLine."Description 2" := '';
                                    TempSalesLine."Unit of Measure Code" := '';
                                    Weight1Calc := 0;
                                    Weight2Calc := 0;
                                    QtyOrderedNo := 0;
                                    UnitPriceToPrint := 0;
                                    AmountExclInvDisc := 0;
                                END;
                            END;
                        end;
                    }
                }

                trigger OnPreDataItem()
                begin
                    NoLoops := 1 + ABS(NoCopies);
                    IF NoLoops <= 0 THEN
                        NoLoops := 1;
                    CopyNo := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    CurrReport.PAGENO := 1;

                    IF CopyNo = NoLoops THEN BEGIN
                        IF NOT CurrReport.PREVIEW THEN
                            SalesPrinted.RUN("Sales Header");
                        CurrReport.BREAK;
                    END ELSE
                        CopyNo := CopyNo + 1;
                    IF CopyNo = 1 THEN // Original
                        CLEAR(CopyTxt)
                    ELSE
                        CopyTxt := Text000;

                    TotalWeight := 0;
                end;
            }
            trigger OnPreDataItem()
            begin
                CompanyInformation.Get('');
                If PrintCompany then
                    FormatAddress.Company(CompanyAddress, CompanyInformation)
                else
                    Clear(CompanyAddress);
            end;

            trigger OnAfterGetRecord()
            begin
                If PrintCompany then begin
                    If RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                end;
                // CurrReport.Language := Language.getLanguageID("Language Code");

                If "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.get("Salesperson Code");

                If "Payment Terms Code" = '' then
                    clear(PaymentTerms)
                else
                    PaymentTerms.get("Payment Terms Code");

                If "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                If not Customer.get("Sell-to Customer No.") then
                    Clear(Customer);

                FormatAddress.SalesHeaderSellTo(BillToAddress, "Sales Header");
                FormatAddress.SalesHeaderShipTo(ShipToAddress, CustAddress, "Sales Header");


                If LogInteraction then begin
                    CalcFields("No. of Archived Versions");
                    If "Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(3, "No.", "Doc. No. Occurrence", "No. of Archived Versions", Database::Customer, "Bill-to Contact No.",
                        "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.")
                    else
                        SegManagement.LogDocument(3, "No.", "Doc. No. Occurrence", "No. of Archived Versions", Database::Customer, "Bill-to Customer No.",
                        "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.");
                end;

                Clear(BreakdownTitle);
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                TotalTaxLabel := Text008;
                TaxRegNo := '';
                TaxRegLabel := '';
                If "Tax Area Code" <> '' then begin
                    TaxArea.Get("Tax Area Code");
                    Case TaxArea."Country/Region" of
                        Taxarea."Country/Region"::US:
                            TotalTaxLabel := Text005;
                        TaxArea."Country/Region"::CA:
                            begin
                                TotalTaxLabel := Text007;
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    end;
                    SalesTaxCalc.StartSalesTaxCalculation();
                end;

                If "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                else
                    UseDate := WorkDate();

                TotalWeight := 0;

                CALaddress1 := '';
                CALaddress2 := '';
                CALaddress3 := '';
                CALaddress4 := '';
                CALaddress5 := '';

                If "Location Code" = 'CAL' then begin
                    CALaddress1 := 'Shipping Address/Ship From';
                    CALaddress2 := 'TORLYS Inc. (Calgary)';
                    CALaddress3 := '1845 - 104 Avenue NE';
                    CALaddress4 := 'Calgary, Alberta, Canada';
                    CALaddress5 := 'T3J 0R2';
                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    // field(NoCopies; NoCopies)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'No. of additional copies';
                    // }
                    // field(PrintCompany; PrintCompany)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Print Company Address';
                    // }
                    field(OrderShipped; OrderShipped)
                    {
                        ApplicationArea = basic, suite;
                        Caption = 'Is Order Shipped?';
                    }
                    field(IgnoreBackorder; IgnoreBackorder)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Exclude Backorder';
                    }
                    field(RemoveDuty; RemoveDuty)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Remove Duty Lines';
                    }
                    field(RemoveFreight; RemoveFreight)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Remove Freight Lines';
                    }
                    field(CostInsteadOfPrice; CostInsteadOfPrice)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use Cost Instead of Price';
                    }
                    field(UseListPrice; UseListPrice)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use List Price';
                    }
                    field(UsePurchasesTariff; UsePurchasesTariff)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use Purchase Tariff';
                    }
                    // field(UsePurchasesTariff; UsePurchasesTariff)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'User Purchases Tariff';
                    // }
                }
            }
        }
    }

    procedure CalcTotalPieces() ReturnValue: decimal
    var
        item2: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        Pieces: Decimal;
        PerPallet: Decimal;
        PerCase: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
        TempQuantity: Decimal;
        QtyShippedPallet: Decimal;
        QtyShippedCase: Decimal;
        QtyShippedSingles: Decimal;
        CalculatedCase: Decimal;
    begin
        If TempSalesLine."Quantity Shipped" <> 0 then begin
            Item2.Get(TempSalesLine."No.");

            PerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET');
            PerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');

            TempQuantity := ROUND(TempSalesLine."Quantity Shipped" * TempSalesLine."Qty. per Unit of Measure", 0.01, '<');
            QtyShippedPallet := 0;

            WHILE TempQuantity >= PerPallet DO BEGIN
                QtyShippedPallet := QtyShippedPallet + 1;
                TempQuantity := TempQuantity - PerPallet;
            END;

            CalculatedCase := TempQuantity / PerCase;
            QtyShippedCase := ROUND(CalculatedCase, 1.0, '<');
            QtyShippedSingles := ROUND((TempQuantity - (QtyShippedCase * PerCase)), 1.0, '>');

            Pieces := QtyShippedSingles + QtyShippedCase;
            IF QtyShippedPallet <> 0 THEN
                Pieces += PerPallet / PerCase * QtyShippedPallet;
        end else
            Pieces := 0;
        exit(Pieces);
    end;

    var
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        TempSalesLine: Record "Sales Line" temporary;
        RespCenter: Record "Responsibility Center";
        Language1: Record Language;
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
        Item: Record Item;
        Customer: Record Customer;
        Item3: Record Item;
        IFSLine: Record "Sales Line";
        SalesPrinted: Codeunit "Sales-Printed";
        FormatAddress: Codeunit "Format Address";
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        CountryOfOrigin: code[10];
        TariffNo: code[15];
        ICProgramNo: Code[10];
        HTSCode: code[20];
        TotalWeight: Decimal;
        TaxAmount: Decimal;
        TaxLiable: Decimal;
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        BreakdownAmt: array[4] of Decimal;
        Weight1Calc: Decimal;
        Weight2Calc: Decimal;
        GrandTotal: Decimal;
        AdditionalWeight: Decimal;
        IFSAmount: Decimal;
        TotalAmountExclInvDisc: Decimal;
        QtyOrderedNo: Decimal;
        PrevTaxPercent: Decimal;
        TotalPieces: Decimal;
        VATAmount: Decimal;
        TotalVATAmount: Decimal;
        CompanyAddress: array[8] of Text[100];
        CustAddress: array[8] of Text[100];
        Weight1Label: Text;
        BillToAddress: array[8] of Text[100];
        Weight2Label: Text;
        ShipToAddress: array[8] of Text[100];
        CopyTxt: Text;
        TaxRegNo: Text;
        GrandTotalLabel: Text;
        TotalLabel: Text;
        TaxRegLabel: Text;
        TotalTaxLabel: Text;
        BreakdownTitle: Text;
        BreakdownLabel: array[4] of Text;
        QtyLabel: Text;
        QtyOrderedLabel: Text;
        TariffNote: Text;
        CurrencyCode: Text;
        CALaddress1: Text;
        CALaddress2: Text;
        CALaddress3: Text;
        CALaddress4: Text;
        CALaddress5: Text;
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        TaxFlag: Boolean;
        ArchiveDocument: Boolean;
        RemoveIFS: Boolean;
        LogInteraction: Boolean;
        IgnoreBackorder: Boolean;
        CostInsteadOfPrice: Boolean;
        UseListPrice: Boolean;
        UsePurchasesTariff: Boolean;
        RemoveFreight: Boolean;
        RemoveDuty: Boolean;
        BackoutDuty: Boolean;
        OrderShipped: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        HighestLineNo: Integer;
        SpacePointer: Integer;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        UseDate: Date;
        UOM1: code[10];
        Text000: Label '<COPY>';
        Text001: Label '<Transferred from page %1>';
        Text002: Label '<Transferred to page %1>';
        Text003: Label '<Sales Tax Breakdown:>';
        Text004: Label '<Other Taxes>';
        Text005: Label '<Total Sales Tax:>';
        Text006: Label '<Tax Breakdown:>';
        Text007: Label '<Total Tax:>';
        Text008: Label '<Tax:>';
}