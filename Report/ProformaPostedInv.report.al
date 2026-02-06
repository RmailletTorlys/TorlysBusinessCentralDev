report 50031 "Proforma INV"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/ProformaINV.rdlc';
    Caption = 'Proforma Posted Invoices';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("Bill-to Customer No.", "Order Date");
            RequestFilterHeading = 'Sales Invoice';
            RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLinkReference = "Sales Invoice Header";
                DataItemLink = "Document No." = field("No.");


                trigger OnPreDataItem()
                begin
                    TempSalesInvoiceLine.Reset();
                    TempSalesInvoiceLine.DeleteAll();
                end;

                trigger OnAfterGetRecord()
                begin
                    TempSalesInvoiceLine := "Sales Invoice Line";
                    TempSalesInvoiceLine.Insert();
                    HighestLineNo := "Line No.";

                    // If IgnoreBackorder then begin
                    //     TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                    //     TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                    //     TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                    //     TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                    // end;
                    // TempSalesLine.Insert();

                    // If IgnoreBackorder then begin
                    //     TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                    //     TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                    //     TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                    //     TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                    // end;




                    // If "Sales Header"."Tax Area Code" <> '' then
                    //     SalesTaxCalc.AddSalesLine(TempSalesLine);
                end;

            }

            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") where("Document Type" = const("Posted Invoice"), "Print On Invoice" = const(True));
                DataItemLinkReference = "Sales Invoice Header";
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord()
                begin
                    with TempSalesInvoiceLine do begin
                        INit;
                        // "Document Type" := "Sales Header"."Document Type";
                        "Document No." := "Sales Invoice Header"."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    end;

                    If StrLen(Comment) <= MaxStrLen(TempSalesInvoiceLine.Description) then begin
                        TempSalesInvoiceLine.Description := Comment;
                        TempSalesInvoiceLine."Description 2" := '';
                        // TempSalesLine."Qty. to Ship" := 1;
                        // TempSalesLine."Quantity Shipped" := 1;
                    end else begin

                        SpacePointer := MAXSTRLEN(TempSalesInvoiceLine.Description) + 1;
                        // TempSalesLine."Qty. to Ship" := 1; //since we dont show items with 0 qty to ship, we need to fake out for comments
                        // TempSalesLine."Quantity Shipped" := 1; //since we dont show items with 0 quantity shipped, we need to fake out for comments
                        WHILE (SpacePointer > 1) AND (Comment[SpacePointer] <> ' ') DO
                            SpacePointer := SpacePointer - 1;

                        IF SpacePointer = 1 THEN
                            SpacePointer := MAXSTRLEN(TempSalesInvoiceLine.Description) + 1;
                        // TempSalesLine."Qty. to Ship" := 1; //since we dont show items with 0 qty to ship, we need to fake out for comments
                        // TempSalesLine."Quantity Shipped" := 1; //since we dont show items with 0 quantity shipped, we need to fake out for comments
                        TempSalesInvoiceLine.Description := COPYSTR(Comment, 1, SpacePointer - 1);
                        TempSalesInvoiceLine."Description 2" := COPYSTR(COPYSTR(Comment, SpacePointer + 1), 1, MAXSTRLEN(TempSalesInvoiceLine."Description 2"));
                    end;
                    TempSalesInvoiceLine.Insert();
                end;
            }

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                DataItemLinkReference = "Sales Invoice Header";

                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    DataItemLinkReference = CopyLoop;

                    column(CALaddress1; CALaddress1)
                    {

                    }
                    column(Location; "Sales Invoice Header"."Location Code")
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
                    column(ORNo; "Sales Invoice Header"."No.")
                    {

                    }
                    column(ORDate; "Sales invoice header"."Order Date")
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
                    column(Yourreference; "Sales Invoice Header"."Your Reference")
                    {

                    }
                    column(shipvia; "sales Invoice header"."Shipping Agent Code")
                    {

                    }
                    column(Shipdate; "Sales Invoice Header"."Shipment Date")
                    {

                    }
                    column(Payterms; Paymentterms.Description)
                    {

                    }
                    column(TaxNo; Customer."VAT Registration No.")
                    {

                    }
                    column(tagname; "Sales Invoice Header"."Tag Name")
                    {

                    }
                    column(customerID; "Sales Invoice Header"."Bill-to Customer No.")
                    {

                    }
                    column(PONumber; "Sales Invoice Header"."External Document No.")
                    {

                    }
                    column(PODate; "Sales Invoice Header"."Order Date")
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
                        column(quantity; tempsalesinvoiceline.Quantity)
                        {

                        }
                        column(TotalAmountExclInvDisc; TotalAmountExclInvDisc)
                        {

                        }
                        column(ItemNo; tempsalesinvoiceline."No.")
                        {

                        }
                        column(Itemtype; tempsalesinvoiceline.Type)
                        {

                        }
                        column(Desc; tempsalesinvoiceline.Description)
                        {

                        }
                        column(Desc2; tempsalesinvoiceline."Description 2")
                        {

                        }
                        column(UOM; tempsalesinvoiceline."Unit of Measure Code")
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
                            CurrReport.CREATETOTALS(TaxLiable, TaxAmount, AmountExclInvDisc, TempSalesinvoiceLine."Line Amount", TempSalesinvoiceLine."Inv. Discount Amount", TotalPieces);
                            NumberOfLines := TempSalesinvoiceLine.COUNT;
                            SETRANGE(Number, 1, NumberOfLines);
                            OnLineNumber := 0;
                            PrintFooter := FALSE;

                            GrandTotalLabel := 'Total:';
                            TotalLabel := 'Subtotal';
                            GrandTotal := 1;

                            // IF IgnoreBackorder THEN BEGIN
                            //     QtyLabel := '';
                            //     QtyOrderedLabel := '';
                            //     TotalLabel := 'Total:';
                            //     GrandTotalLabel := '';
                            //     GrandTotal := 0;
                            // END
                            // ELSE BEGIN
                            //     QtyLabel := '';
                            //     QtyOrderedLabel := 'Quantity';
                            //     TotalLabel := 'Subtotal:';
                            //     GrandTotal := 1;
                            // END;
                        end;

                        trigger OnAfterGetRecord()
                        begin
                            OnLineNumber := OnLineNumber + 1;
                            // TempSalesLine.SetFilter("Document No.", "Sales Header"."No.");

                            with TempSalesinvoiceLine do begin
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
                                IF "Sales Invoice Header"."Currency Code" = '' THEN BEGIN
                                    CurrencyCode := 'CDN';
                                END ELSE BEGIN
                                    CurrencyCode := "Sales invoice Header"."Currency Code"
                                END;


                                // Message('tempsalesline %1', TempSalesLine);
                                If NOT (Type = Type::" ") and NOt (Type = Type::"G/L Account") then begin
                                    // Item3.GET("No.");
                                    // IF (OrderShipped) THEN 
                                    IF (CostInsteadOfPrice) THEN
                                        AmountExclInvDisc := "Unit Cost (LCY)" * "Quantity"
                                    ELSE IF (UseListPrice) THEN
                                        AmountExclInvDisc := "Unit Price" * "Quantity"
                                    ELSE IF (BackoutDuty) AND (Item3."Tariff Charge Required") THEN
                                        AmountExclInvDisc := (((ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=')) / 1.25)
                                                            * "Quantity")
                                    ELSE begin
                                        AmountExclInvDisc := ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') * "Quantity";
                                        // Message('%1', AmountExclInvDisc);
                                    end;
                                    // AmountExclInvDisc := ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') * "Quantity Shipped";


                                    // QtyOrderedNo := "Quantity";
                                    IF "Quantity" = 0 THEN
                                        UnitPriceToPrint := 0  // so it won't print
                                    ELSE
                                        UnitPriceToPrint := ROUND(AmountExclInvDisc / "Quantity", 0.00001);

                                    IF Type = Type::Item THEN BEGIN
                                        IF Item.GET("No.") THEN BEGIN
                                            CountryOfOrigin := Item."Country/Region of Origin Code";
                                            // ICProgramNo := Item.;
                                            TariffNote := Item."Customs/Tariff Note"; //TLY-SD - 04/09/2025
                                                                                      // IF UsePurchasesTariff THEN
                                                                                      //     TariffNo := Item."Tariff No."
                                                                                      // ELSE
                                            TariffNo := Item."Tariff No. (Sales)";
                                            Netweight := Item."Net Weight";
                                        END ELSE BEGIN
                                            CountryOfOrigin := '';
                                            TariffNo := '';
                                        END;
                                    END ELSE BEGIN
                                        CountryOfOrigin := '';
                                        TariffNo := '';
                                    END;

                                    IF AdditionalWeight = 0 THEN BEGIN
                                        Weight1Label := 'Net Weight (LB)';
                                        Weight1Calc := (TempSalesinvoiceLine."Net Weight" * TempSalesinvoiceLine."Quantity");
                                        Weight2Label := 'Net Weight (KG)';
                                        Weight2Calc := (TempSalesinvoiceLine."Net Weight" * TempSalesinvoiceLine."Quantity") * 0.453592;
                                    END ELSE BEGIN
                                        Weight1Label := 'Net Weight (KG)';
                                        Weight1Calc := (TempSalesinvoiceLine."Net Weight" * TempSalesinvoiceLine."Quantity") * 0.453592;
                                        Weight2Label := 'Gross Weight (KG)';
                                        Weight2Calc := (TempSalesinvoiceLine."Net Weight" * TempSalesinvoiceLine."Quantity") * 0.453592;
                                    END;

                                    TotalWeight := TotalWeight + "Net Weight" * "Quantity";
                                    TotalAmountExclInvDisc += AmountExclInvDisc;
                                    // if (CostInsteadOfPrice) then
                                    //     VATAmount := Round(("Unit Cost (LCY)" * "Qty. to Invoice" * "VAT %") / 100)
                                    // else
                                    //     VATAmount := Round(Amount * "VAT %" / 100 * ("Qty. to Invoice" / "Quantity Shipped"));

                                    TotalVATAmount += VATAmount;
                                    TotalPieces := CalcTotalPieces;
                                end;

                                // If NOT (Type = Type::" ") and NOt (Type = Type::"G/L Account") then begin
                                //     Item3.GET("No.");
                                //     IF (NOT OrderShipped) THEN BEGIN
                                //         IF (CostInsteadOfPrice) THEN
                                //             AmountExclInvDisc := "Unit Cost (LCY)" * "Qty. to Ship"
                                //         ELSE IF (UseListPrice) THEN
                                //             AmountExclInvDisc := "Unit Price" * "Qty. to Ship"
                                //         ELSE IF (BackoutDuty) AND (Item3."Tariff Charge Required") THEN
                                //             AmountExclInvDisc := (((ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=')) / 1.25)
                                //                                 * "Qty. to Ship")
                                //         ELSE
                                //             AmountExclInvDisc := (ROUND(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') * "Qty. to Ship");

                                //         QtyOrderedNo := "Qty. to Ship";
                                //         IF "Qty. to Ship" = 0 THEN
                                //             UnitPriceToPrint := 0  // so it won't print
                                //         ELSE
                                //             UnitPriceToPrint := ROUND(AmountExclInvDisc / "Qty. to Ship", 0.00001);

                                //         IF AdditionalWeight = 0 THEN BEGIN
                                //             Weight1Label := 'Net Weight (LB)';
                                //             Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship");
                                //             Weight2Label := 'Net Weight (KG)';
                                //             Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                //         END ELSE BEGIN
                                //             Weight1Label := 'Net Weight (KG)';
                                //             Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                //             Weight2Label := 'Gross Weight (KG)';
                                //             Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                //         END;

                                //         TotalWeight := TotalWeight + "Net Weight" * "Qty. to Ship";
                                //         // TotalAmountExclInvDisc += AmountExclInvDisc;
                                //         // if (CostInsteadOfPrice) then
                                //         //     VATAmount := Round(("Unit Cost (LCY)" * "Qty. to Invoice" * "VAT %") / 100)
                                //         // else
                                //         //     VATAmount := Round(Amount * "VAT %" / 100 * ("Qty. to Invoice" / "Qty. to Ship"));

                                //         // TotalVATAmount += VATAmount;
                                //         // TotalVATAmount += VATAmount;
                                //     END;
                                //     // end;

                                //     IF Type = Type::Item THEN BEGIN
                                //         IF Item.GET("No.") THEN BEGIN
                                //             CountryOfOrigin := Item."Country/Region of Origin Code";
                                //             // ICProgramNo := Item.;
                                //             TariffNote := Item."Customs/Tariff Note"; //TLY-SD - 04/09/2025
                                //             IF UsePurchasesTariff THEN
                                //                 TariffNo := Item."Tariff No."
                                //             ELSE
                                //                 TariffNo := Item."Tariff No. (Sales)";
                                //         END ELSE BEGIN
                                //             CountryOfOrigin := '';
                                //             TariffNo := '';
                                //         END;
                                //     END ELSE BEGIN
                                //         CountryOfOrigin := '';
                                //         TariffNo := '';
                                //     END;
                                //     TotalPieces := CalcTotalPieces;
                                // end;
                            end;

                            IF RemoveFreight THEN BEGIN
                                // IF TempSalesinvoiceLine."Gen. Prod. Posting Group" = 'FREIGHT' THEN BEGIN
                                IF TempSalesinvoiceLine."No." = '60700' THEN BEGIN
                                    TempSalesinvoiceLine."No." := '';
                                    TempSalesinvoiceLine.Description := '';
                                    TempSalesinvoiceLine."Description 2" := '';
                                    TempSalesinvoiceLine."Unit of Measure Code" := '';
                                    Weight1Calc := 0;
                                    Weight2Calc := 0;
                                    QtyOrderedNo := 0;
                                    UnitPriceToPrint := 0;
                                    AmountExclInvDisc := 0;
                                END;
                            END;

                            IF RemoveDuty THEN BEGIN
                                // IF TempSalesLine."Gen. Prod. Posting Group" = 'DUTY' THEN BEGIN
                                IF TempSalesinvoiceLine."No." = '51400' THEN BEGIN
                                    TempSalesinvoiceLine."No." := '';
                                    TempSalesinvoiceLine.Description := '';
                                    TempSalesinvoiceLine."Description 2" := '';
                                    TempSalesinvoiceLine."Unit of Measure Code" := '';
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
                            SalesInvPrinted.RUN("Sales invoice Header");
                        CurrReport.BREAK;
                    END ELSE
                        CopyNo := CopyNo + 1;
                    IF CopyNo = 1 THEN // Original
                        CLEAR(CopyTxt)
                    ELSE
                        CopyTxt := Text000;

                    // TotalWeight := 0;
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

                FormatAddress.SalesInvBillTo(BillToAddress, "Sales Invoice Header");
                FormatAddress.SalesInvShipTo(ShipToAddress, CustAddress, "Sales Invoice Header");


                If LogInteraction then
                    if Not CurrReport.Preview then begin
                        // CalcFields("No. of Archived Versions");
                        If "Bill-to Contact No." <> '' then
                            SegManagement.LogDocument(4, "No.", 0, 0, Database::Customer, "Bill-to Contact No.", "Salesperson Code", "Campaign No.", "Posting Description", '')
                        else
                            SegManagement.LogDocument(4, "No.", 0, 0, Database::Customer, "Bill-to Customer No.", "Salesperson Code", "Campaign No.", "Posting Description", '');
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
                    SalesTaxCalc.AddSalesInvoiceLines("Sales Invoice Header"."No.");
                    SalesTaxCalc.EndSalesTaxCalculation("Sales Invoice Header"."Posting Date");
                    SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                    BrkIdx := 0;
                    PrevPrintOrder := 0;
                    PrevTaxPercent := 0;
                    with TempSalesTaxAmtLine do begin
                        RESET;
                        SETCURRENTKEY("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
                        IF FIND('-') THEN
                            repeat
                                IF ("Print Order" = 0) OR
                                   ("Print Order" <> PrevPrintOrder) OR
                                   ("Tax %" <> PrevTaxPercent)
                                   then begin
                                    BrkIdx := BrkIdx + 1;
                                    if BrkIdx > 1 then begin
                                        IF TaxArea."Country/Region" = TaxArea."Country/Region"::CA THEN
                                            BreakdownTitle := Text006
                                        ELSE
                                            BreakdownTitle := Text003;
                                    end;
                                    If BrkIdx > ArrayLen(BreakdownAmt) then begin
                                        BrkIdx := BrkIdx - 1;
                                        BreakdownLabel[BrkIdx] := Text004;
                                    end else
                                        BreakdownLabel[BrkIdx] := STRSUBSTNO("Print Description", "Tax %");
                                end;
                                BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
                            until Next() = 0;
                    end;
                end;

                // If "Posting Date" <> 0D then
                //     UseDate := "Posting Date"
                // else
                //     UseDate := WorkDate();

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
        If TempSalesInvoiceLine."Quantity" <> 0 then begin
            Item2.Get(TempSalesInvoiceLine."No.");

            PerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET');
            PerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');

            TempQuantity := ROUND(TempSalesInvoiceLine."Quantity" * TempSalesInvoiceLine."Qty. per Unit of Measure", 0.01, '<');
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
        TempSalesInvoiceLine: Record "Sales Invoice Line" temporary;
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
        SalesInvPrinted: Codeunit "Sales Inv.-Printed";
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
        Netweight: Decimal;
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