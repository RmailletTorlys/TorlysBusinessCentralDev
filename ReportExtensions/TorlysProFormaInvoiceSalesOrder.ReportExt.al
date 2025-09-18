reportextension 50020 "ProFormaInvoiceSalesOrder" extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        add(Header)
        {
            column(CALaddress1; CALaddress1)
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
            column(Your_Reference; "Your Reference")
            {

            }
            column(ShipmentMethodDescription1; ShipmentMethod.Description)
            {

            }
            column(PaymentTermsDesc; PaymentTerms.Description)
            {

            }
            column(CustVatRegNo; Cust."VAT Registration No.")
            {

            }
            column(Tag_Name; "Tag Name")
            {

            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(SalesPurchPerson; SalesPurchPerson.Name)
            {

            }
            column(Order_Date; "Order Date")
            {

            }
        }

        addlast(Header)
        {
            dataitem(SalesCommentLine; "Sales Comment Line")
            {
                DataItemLinkReference = Header;
                DataItemLink = "No." = field("No.");
                DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") where("document type" = const(Order));

                trigger OnAfterGetRecord()
                begin
                    with TempSalesLine do begin
                        Init;
                        "Document Type" := Header."Document Type";
                        "Document No." := Header."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    end;
                    If StrLen(Comment) <= MaxStrLen(TempSalesLine.Description) then begin
                        TempSalesLine.Description := Comment;
                        TempSalesLine."Description 2" := '';
                        TempSalesLine."Qty. to Ship" := 1;
                        TempSalesLine."Quantity Shipped" := 1;
                    end else begin
                        SpacePointer := MaxStrLen(TempSalesLine.Description) + 1;
                        TempSalesLine."Qty. to Ship" := 1;
                        TempSalesLine."Quantity Shipped" := 1;
                        while (SpacePointer > 1) and (Comment[SpacePointer] <> ' ') do
                            SpacePointer := SpacePointer - 1;
                        If SpacePointer = 1 then
                            SpacePointer := MaxStrLen(TempSalesLine.Description) + 1;
                        TempSalesLine."Qty. to Ship" := 1;
                        TempSalesLine."Quantity Shipped" := 1;
                        TempSalesLine.Description := CopyStr(Comment, 1, SpacePointer - 1);
                        TempSalesLine."Description 2" := CopyStr(CopyStr(Comment, SpacePointer + 1), 1, MaxStrLen(TempSalesLine."Description 2"));
                    end;
                    TempSalesLine.Insert();
                end;
            }

            dataitem(copyloop; Integer)
            {
                DataItemTableView = sorting(Number);
                DataItemLinkReference = Header;

                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    DataItemLinkReference = copyloop;

                    dataitem(SalesLine; Integer)
                    {
                        DataItemTableView = sorting(Number);
                        DataItemLinkReference = PageLoop;

                        column(TempSalesLineNo; TempSalesLine."No.")
                        {

                        }
                        column(TempSalesLineDesc; TempSalesLine.Description + ' ' + TempSalesLine."Description 2")
                        {

                        }
                        column(TempSalesLineUOM; TempSalesLine."Unit of Measure Code")
                        {

                        }
                        column(weightlb; weight1calc)
                        {

                        }
                        column(Weight2Calc; Weight2Calc)
                        {

                        }
                        column(QtyOrderedNo; QtyOrderedNo)
                        {

                        }
                        column(UnitPriceToPrint; UnitPriceToPrint)
                        {

                        }
                        column(AmountExclInvDisc; AmountExclInvDisc)
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
                        column(TotalWeight1; TotalWeight)
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
                        column(grandT; AmountExclInvDisc + (BreakdownAmt[1] + BreakdownAmt[2] + BreakdownAmt[3] + BreakdownAmt[4]))
                        {

                        }

                        trigger OnPreDataItem()
                        begin
                            CurrReport.CreateTotals(taxliable, TaxAmount, AmountExclInvDisc, TempSalesLine."Line Amount", TempSalesLine."Inv. Discount Amount", TotalPieces);
                            NumberOfLines := TempSalesLine.Count;
                            SetRange(Number, 1, NumberOfLines);
                            OnlineNumber := 0;
                            PrintFooter := False;

                            GrandTotalLabel := 'Total:';

                            If IgnoreBackorder then begin
                                QtyLabel := '';
                                QtyOrderedLabel := '';
                                TotalLabel := 'Total:';
                                GrandTotalLabel := '';
                                GrandTotal := 0
                            end else begin
                                QtyLabel := '';
                                QtyOrderedLabel := 'Quantity';
                                TotalLabel := 'Subtotal';
                                GrandTotal := 1;
                            end;
                        end;

                        trigger OnAfterGetRecord()
                        begin
                            OnlineNumber := OnlineNumber + 1;

                            with TempSalesLine do begin
                                If OnlineNumber = 1 then
                                    find('-') else
                                    next;

                                If Type = Type::" " then begin
                                    "No." := '';
                                    "Unit of Measure" := '';
                                    "Line Amount" := 0;
                                    "Inv. Discount Amount" := 0;
                                    Quantity := 0;
                                end else if Type = Type::"G/L Account" then
                                        "No." := '';

                                TaxAmount := "Amount Including VAT" - Amount;
                                If TaxAmount <> 0 then begin
                                    TaxFlag := true;
                                    TaxLiable := Amount;
                                end else begin
                                    TaxFlag := false;
                                    TaxLiable := 0;
                                end;
                                If Header."Currency Code" = '' then begin
                                    CurrencyCode := 'CDN';
                                end else
                                    CurrencyCode := Header."Currency Code";

                                Item3.Get(Line."No.");
                                If (OrderShipped) then begin
                                    If (CostInsteadOfPrice) then
                                        AmountExclInvDisc := Line."Unit Cost (LCY)" * line."Quantity Shipped"
                                    else if (UseListPrice) then
                                        AmountExclInvDisc := Line."Unit Cost" * Line."Quantity Shipped"
                                    else if (BackoutDuty) and (Item3."Tarrif Charge Required") then
                                        AmountExclInvDisc := ((Round((Line."Unit Price" * (1 - Line."Line Discount %" / 100)), 0.01, '=')) / 1.25) * (Line."Quantity Shipped")
                                    else
                                        AmountExclInvDisc := Round((Line."Unit Price" * (1 - Line."Line Discount %" / 100)), 0.01, '=') * Line."Quantity Shipped";

                                    QtyOrderedNo := Line."Quantity Shipped";
                                    If Line."Quantity Shipped" = 0 then
                                        UnitPriceToPrint := 0
                                    Else
                                        UnitPriceToPrint := Round(AmountExclInvDisc / Line."Quantity Shipped", 0.00001);

                                    If AdditionalWeight = 0 then begin
                                        Weight1Label := 'Net Weight (LB)';
                                        Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped");
                                        Weight2Label := 'Net Weight (KG)';
                                        Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped") * 0.453592;
                                    end else begin
                                        Weight1Label := 'Net Weight (KG)';
                                        Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped") * 0.453592;
                                        Weight2Label := 'Gross Weight (KG)';
                                        Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Quantity Shipped") * 0.453592;
                                    end;

                                    TotalWeight := TotalWeight + line."Net Weight" * line."Quantity Shipped";
                                end;

                                Item3.Get(Line."No.");
                                If (Not OrderShipped) then begin
                                    If (CostInsteadOfPrice) then
                                        AmountExclInvDisc := Line."Unit Cost (LCY)" * line."Qty. to Ship"
                                    else if (UseListPrice) then
                                        AmountExclInvDisc := Line."Unit Cost" * Line."Qty. to Ship"
                                    else if (BackoutDuty) and (Item3."Tarrif Charge Required") then
                                        AmountExclInvDisc := ((Round((Line."Unit Price" * (1 - Line."Line Discount %" / 100)), 0.01, '=')) / 1.25) * (Line."Qty. to Ship")
                                    else
                                        AmountExclInvDisc := Round((Line."Unit Price" * (1 - Line."Line Discount %" / 100)), 0.01, '=') * Line."Qty. to Ship";

                                    QtyOrderedNo := Line."Qty. to Ship";
                                    If Line."Qty. to Ship" = 0 then
                                        UnitPriceToPrint := 0
                                    Else
                                        UnitPriceToPrint := Round(AmountExclInvDisc / Line."Qty. to Ship", 0.00001);

                                    If AdditionalWeight = 0 then begin
                                        Weight1Label := 'Net Weight (LB)';
                                        Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship");
                                        Weight2Label := 'Net Weight (KG)';
                                        Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                    end else begin
                                        Weight1Label := 'Net Weight (KG)';
                                        Weight1Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                        Weight2Label := 'Gross Weight (KG)';
                                        Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine."Qty. to Ship") * 0.453592;
                                    end;

                                    TotalWeight := TotalWeight + line."Net Weight" * line."Qty. to Ship";
                                end;

                                If Line.Type = Line.Type::Item then begin
                                    If Item.Get(Line."No.") then begin
                                        CountryOfOrigin := Item."Country/Region of Origin Code";
                                        // ICProgramNo := Item."Program No.";
                                        // TariffNote := Item.tarrifnote;
                                        If UsePurchasesTariff then
                                            TariffNo := Item."Tariff No."
                                        else
                                            TariffNo := item."Tariff No. (Sales)";
                                    end else begin
                                        CountryOfOrigin := '';
                                        TariffNo := '';
                                    end;
                                end else begin
                                    CountryOfOrigin := '';
                                    TariffNo := '';
                                end;

                                TotalPieces := CalcTotalPieces;
                            end;

                            If RemoveFreight then begin
                                If TempSalesLine."Gen. Prod. Posting Group" = 'FREIGHT' then begin
                                    TempSalesLine."No." := '';
                                    TempSalesLine.Description := '';
                                    TempSalesLine."Description 2" := '';
                                    TempSalesLine."Unit of Measure Code" := '';
                                    Weight1Calc := 0;
                                    Weight2Calc := 0;
                                    QtyOrderedNo := 0;
                                    UnitPriceToPrint := 0;
                                    AmountExclInvDisc := 0;
                                end;
                            end;

                            If RemoveDuty then begin
                                If TempSalesLine."Gen. Prod. Posting Group" = 'DUTY' then begin
                                    TempSalesLine."No." := '';
                                    TempSalesLine.Description := '';
                                    TempSalesLine."Description 2" := '';
                                    TempSalesLine."Unit of Measure Code" := '';
                                    Weight1Calc := 0;
                                    Weight2Calc := 0;
                                    QtyOrderedNo := 0;
                                    UnitPriceToPrint := 0;
                                    AmountExclInvDisc := 0;
                                end;
                            end;

                            // If RemoveIFS then begin
                            //     If TempSalesLine."Gen. Prod. Posting Group" = 'IFS' then begin
                            //         TempSalesLine."No." := '';
                            //         TempSalesLine.Description := '';
                            //         TempSalesLine."Description 2" := '';
                            //         TempSalesLine."Unit of Measure Code" := '';
                            //         Weight1Calc := 0;
                            //         Weight2Calc := 0;
                            //         QtyOrderedNo := 0;
                            //         UnitPriceToPrint := 0;
                            //         AmountExclInvDisc := 0;
                            //     end;
                            // end;
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        NoLoops := 1 + ABS(NoCopies);
                        If NoLoops <= 0 then
                            NoLoops := 1;
                        CopyNo := 0;
                    end;

                    trigger OnAfterGetRecord()
                    begin
                        CurrReport.PageNo := 1;

                        If CopyNo = NoLoops then begin
                            If not CurrReport.Preview then
                                SalesPrinted.Run(Header);
                            CurrReport.Break();
                        end else
                            CopyNo := CopyNo + 1;
                        if CopyNo = 1 then
                            Clear(CopyTxt)
                        else
                            CopyTxt := Text000;

                        TotalWeight := 0;
                    end;
                }
            }
        }

        modify("Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                If "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.get("Salesperson Code");

                If "Payment Terms Code" = '' then
                    Clear(PaymentTerms)
                else
                    PaymentTerms.get("Payment Terms Code");

                If "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                Else
                    ShipmentMethod.get("Shipment Method Code");
                If not Cust.get("Sell-to Customer No.") then
                    Clear(Cust);

                Fmtaddr.SalesHeaderSellTo(BillToAddress, Header);
                Fmtaddr.SalesHeaderShipTo(ShipToAddress, CustomerAddress, Header);

                If not CurrReport.Preview then begin
                    if ArchieveDocument then
                        Archieve.StoreSalesDocument(Header, loginteractions);

                    If loginteractions then begin
                        CalcFields("No. of Archived Versions");
                        If "Bill-to Contact No." <> '' then
                            SegManagement.LogDocument(3, "No.", "Doc. No. Occurrence", "No. of Archived Versions", Database::Contact, "Bill-to Customer No.",
                            "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.")
                        else
                            SegManagement.LogDocument(3, "No.", "Doc. No. Occurrence", "No. of Archived Versions", Database::Customer, "Bill-to Customer No.",
                            "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.");
                    end;
                end;

                Clear(BreakdownTitle);
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                TotalTaxLabel := Text008;
                TaxRegNo := '';
                TaxRegLabel := '';
                if "Tax Area Code" <> '' then begin
                    TaxArea.get("Tax Area Code");
                    Case
                        TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            TotalTaxLabel := Text005;
                        TaxArea."Country/Region"::CA:
                            begin
                                TotalTaxLabel := Text007;
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    End;
                    SalesTaxCalc.StartSalesTaxCalculation();
                end;
                If "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                else
                    UseDate := WorkDate;

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

        modify(Line)
        {
            trigger OnAfterPreDataItem()
            begin
                TempSalesLine.Reset();
                TempSalesLine.DeleteAll();
            end;

            trigger OnAfterAfterGetRecord()
            begin
                TempSalesLine := Line;

                If IgnoreBackorder then begin
                    TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                    TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                    TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                    TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                end;

                TempSalesLine.Insert;

                If IgnoreBackorder then begin
                    TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                    TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                    TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                    TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                end;

                TempSalesLine.Modify;

                HighestLineNo := "Line No.";
                If Header."Tax Area Code" <> '' then
                    SalesTaxCalc.AddSalesLine(TempSalesLine);
            end;

            trigger OnAfterPostDataItem()
            begin
                If Header."Tax Area Code" <> '' then begin
                    SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                    SalesTaxCalc.DistTaxOverSalesLines(TempSalesLine);
                    SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                    BrkIdx := 0;
                    PrevPrintOrder := 0;
                    PrevTaxPercent := 0;
                    with TempSalesTaxAmtLine do begin
                        Reset();
                        SetCurrentKey("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
                        If Find('-') then
                            repeat
                                If (("Print Order" = 0) or ("Print Order" <> PrevPrintOrder) or ("Tax %" <> PrevTaxPercent))
                                then begin
                                    BrkIdx := BrkIdx + 1;
                                    If BrkIdx > 1 then begin
                                        If TaxArea."Country/Region" = TaxArea."Country/Region"::CA then
                                            BreakdownTitle := Text006
                                        else
                                            BreakdownTitle := Text003;
                                    end;

                                    // If BrkIdx > ArrayLen(BreakdownAmt) then begin
                                    //     BrkIdx := BrkIdx - 1;
                                    //     BreakdownLabel[BrkIdx] := Text004;
                                    // end else
                                    //     BreakdownLabel[BrkIdx] := StrSubstNo("Print Description","Tax %");
                                end;
                                BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
                            until Next = 0;
                    end;
                end;
            end;
        }
    }
    Procedure CalcTotalPieces(): Integer;
    var
        Item2: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        UOMMgt: Codeunit "Unit of Measure Management";
        Pieces: Decimal;
        PerPallet: Decimal;
        PerCase: Decimal;
        TempQuantity: Decimal;
        QtyShippedPallet: Decimal;
        QtyShippedCase: Decimal;
        QtyShippedSingles: Decimal;
        CalculatedCases: Decimal;
    begin
        If TempSalesLine."Quantity Shipped" <> 0 then begin
            Item2.get(TempSalesLine."No.");

            PerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET');
            PerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');

            TempQuantity := Round(TempSalesLine."Quantity Shipped" * TempSalesLine."Qty. per Unit of Measure", 0.01, '<');
            QtyShippedPallet := 0;

            while TempQuantity >= PerPallet do begin
                QtyShippedPallet := QtyShippedPallet + 1;
                TempQuantity := TempQuantity - PerPallet;
            end;

            CalculatedCases := TempQuantity / PerCase;
            QtyShippedCase := Round(CalculatedCases, 1.0, '<');
            QtyShippedSingles := Round((TempQuantity - (QtyShippedCase * PerCase)), 1.0, '>');

            Pieces := QtyShippedSingles + QtyShippedCase;

            If QtyShippedPallet <> 0 then
                Pieces += PerPallet / PerCase * QtyShippedPallet;
        end else
            Pieces := 0;
        Exit(Pieces);
    end;

    var
        SalesPurchPerson: Record "Salesperson/Purchaser";
        PaymentTerms: Record "Payment Terms";
        TempSalesLine: Record "Sales Line" temporary;
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        ShipmentMethod: Record "Shipment Method";
        TaxArea: Record "Tax Area";
        Item3: Record Item;
        Cust: Record Customer;
        UseDate: Date;
        Fmtaddr: Codeunit "Format Address";
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        Archieve: Codeunit ArchiveManagement;
        SegManagement: Codeunit SegManagement;
        SalesPrinted: Codeunit "Sales-Printed";
        ArchieveDocument: Boolean;
        TaxFlag: Boolean;
        loginteractions: Boolean;
        IgnoreBackorder: Boolean;
        OrderShipped: Boolean;
        UseListPrice: Boolean;
        UsePurchasesTariff: Boolean;
        RemoveFreight: Boolean;
        PrintFooter: Boolean;
        RemoveDuty: Boolean;
        CostInsteadOfPrice: Boolean;
        BackoutDuty: Boolean;
        ICProgramNo: Code[20];
        CountryOfOrigin: Code[10];
        TariffNo: Code[15];
        BillToAddress: array[6] of Text;
        ShipToAddress: array[6] of Text;
        BreakdownAmt: array[8] of Decimal;
        TotalWeight1: Decimal;
        TaxAmount: Decimal;
        AmountExclInvDisc: Decimal;
        AdditionalWeight: Decimal;
        TaxLiable: Decimal;
        PrevTaxPercent: Decimal;
        GrandTotal: Decimal;
        QtyOrderedNo: Decimal;
        UnitPriceToPrint: Decimal;
        TotalPieces: Decimal;
        Weight1Calc: Decimal;
        Weight2Calc: Decimal;
        BrkIdx: Integer;
        HighestLineNo: Integer;
        NoLoops: Integer;
        NoCopies: Integer;
        CopyNo: Integer;
        PrevPrintOrder: Integer;
        NumberOfLines: Integer;
        OnlineNumber: Integer;
        SpacePointer: Integer;
        BreakdownTitle: Text;
        TaxRegNo: Text;
        GrandTotalLabel: Text;
        TariffNote: Text;
        Weight1Label: Text;
        Weight2Label: Text;
        QtyLabel: Text;
        TaxRegLabel: Text;
        QtyOrderedLabel: Text;
        BreakdownLabel: Text;
        TotalLabel: Text;
        TotalTaxLabel: Text;
        CALaddress1: Text;
        CALaddress2: Text;
        CALaddress3: Text;
        CALaddress4: Text;
        CALaddress5: Text;
        CopyTxt: Text;
        Text000: Label 'COPY';
        Text001: Label 'Transferred from page %1';
        Text002: Label 'Transferred to page %1';
        Text003: Label 'Sales Tax Breakdown:';
        Text004: Label 'Other Taxes';
        Text005: Label 'Total Sales Tax:';
        Text006: Label 'Tax Breakdown:';
        Text007: Label 'Total Tax:';
        Text008: Label 'Tax:';
}