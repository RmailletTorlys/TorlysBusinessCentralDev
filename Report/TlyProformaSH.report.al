report 50085 TlyProformaShipment
{
    // Proforma built entirely from Posted Sales Shipments (Sales Shipment Header / Sales Shipment Line).
    // Full replacement for the earlier TlyProformaShipment file: same object ID/name, so replace that file, don't add this one next to it.
    // Dataset column names match TlyProformaSH, so ProformaSH.rdlc can be copied as ProformaShipment.rdlc.
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/ProformaShipment.rdlc';
    Caption = 'Proforma Shipment';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterHeading = 'Sales Shipment';
            RequestFilterFields = "No.", "Sell-to Customer No.", "Ship-to Code", "Shipment Date";

            // 1) Buffer the shipment lines
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Document No." = field("No.");

                trigger OnPreDataItem()
                begin
                    TempSalesLine.Reset();
                    TempSalesLine.DeleteAll();
                    HighestLineNo := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    // Everything on a shipment line has shipped: Quantity = Quantity Shipped = Qty. to Ship
                    TempSalesLine.Init();
                    TempSalesLine."Document Type" := TempSalesLine."Document Type"::Order;
                    TempSalesLine."Document No." := "Document No.";
                    TempSalesLine."Line No." := "Line No.";
                    TempSalesLine.Type := Type;
                    TempSalesLine."No." := "No.";
                    TempSalesLine.Description := Description;
                    TempSalesLine."Description 2" := "Description 2";
                    TempSalesLine."Unit of Measure Code" := "Unit of Measure Code";
                    TempSalesLine."Qty. per Unit of Measure" := "Qty. per Unit of Measure";
                    TempSalesLine.Quantity := Quantity;
                    TempSalesLine."Quantity (Base)" := "Quantity (Base)";
                    TempSalesLine."Quantity Shipped" := Quantity;
                    TempSalesLine."Qty. to Ship" := Quantity;
                    TempSalesLine."Unit Price" := "Unit Price";
                    TempSalesLine."Unit Cost (LCY)" := "Unit Cost (LCY)";
                    TempSalesLine."Line Discount %" := "Line Discount %";
                    TempSalesLine."VAT %" := "VAT %";
                    TempSalesLine."Net Weight" := "Net Weight";
                    TempSalesLine."Gen. Prod. Posting Group" := "Gen. Prod. Posting Group";
                    TempSalesLine."Tax Area Code" := "Tax Area Code";
                    TempSalesLine."Tax Group Code" := "Tax Group Code";
                    TempSalesLine."Tax Liable" := "Tax Liable";

                    // Shipment lines don't store Amount / Amount Including VAT, so rebuild them
                    TempSalesLine.Amount := Round(Quantity * "Unit Price" * (1 - "Line Discount %" / 100), 0.01);
                    TempSalesLine."Amount Including VAT" := Round(TempSalesLine.Amount * (1 + "VAT %" / 100), 0.01);
                    TempSalesLine."Line Amount" := TempSalesLine.Amount;
                    TempSalesLine."Inv. Discount Amount" := 0;
                    TempSalesLine.Insert();

                    HighestLineNo := "Line No.";
                end;
            }

            // 2) Buffer the shipment comments (copied from the order when the shipment was posted)
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") where("Document Type" = const(Shipment), "Print On Shipment" = const(true));
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "No." = field("No.");

                trigger OnAfterGetRecord()
                begin
                    TempSalesLine.Init();
                    TempSalesLine."Document Type" := TempSalesLine."Document Type"::Order;
                    TempSalesLine."Document No." := "Sales Shipment Header"."No.";
                    TempSalesLine."Line No." := HighestLineNo + 1000;
                    HighestLineNo := TempSalesLine."Line No.";

                    // Comment lines are faked as shipped so they aren't suppressed
                    TempSalesLine."Qty. to Ship" := 1;
                    TempSalesLine."Quantity Shipped" := 1;

                    if StrLen(Comment) <= MaxStrLen(TempSalesLine.Description) then begin
                        TempSalesLine.Description := Comment;
                        TempSalesLine."Description 2" := '';
                    end else begin
                        SpacePointer := MaxStrLen(TempSalesLine.Description) + 1;
                        while (SpacePointer > 1) and (Comment[SpacePointer] <> ' ') do
                            SpacePointer := SpacePointer - 1;
                        if SpacePointer = 1 then
                            SpacePointer := MaxStrLen(TempSalesLine.Description) + 1;
                        TempSalesLine.Description := CopyStr(Comment, 1, SpacePointer - 1);
                        TempSalesLine."Description 2" := CopyStr(CopyStr(Comment, SpacePointer + 1), 1, MaxStrLen(TempSalesLine."Description 2"));
                    end;
                    TempSalesLine.Insert();
                end;
            }

            // 3) One page block per shipment (the old copy loop is gone, it only ever ran once)
            dataitem(PageLoop; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                DataItemLinkReference = "Sales Shipment Header";

                column(CALaddress1; CALaddress1) { }
                column(Location; "Sales Shipment Header"."Location Code") { }
                column(CALaddress2; CALaddress2) { }
                column(CALaddress3; CALaddress3) { }
                column(CALaddress4; CALaddress4) { }
                column(CALaddress5; CALaddress5) { }
                column(ORNo; "Sales Shipment Header"."No.") { }  // shipment number
                column(OrderNo; "Sales Shipment Header"."Order No.") { }  // optional for the layout
                column(ORDate; "Sales Shipment Header"."Order Date") { }
                column(PageNo; CurrReport.PageNo) { }
                column(ShipToAddress1; ShipToAddress[1]) { }
                column(ShipToAddress2; ShipToAddress[2]) { }
                column(ShipToAddress3; ShipToAddress[3]) { }
                column(ShipToAddress4; ShipToAddress[4]) { }
                column(ShipToAddress5; ShipToAddress[5]) { }
                column(ShipToAddress6; ShipToAddress[6]) { }
                column(BillToAddress1; BillToAddress[1]) { }
                column(BillToAddress2; BillToAddress[2]) { }
                column(BillToAddress3; BillToAddress[3]) { }
                column(BillToAddress4; BillToAddress[4]) { }
                column(BillToAddress5; BillToAddress[5]) { }
                column(BillToAddress6; BillToAddress[6]) { }
                column(Yourreference; "Sales Shipment Header"."Your Reference") { }
                column(shipvia; "Sales Shipment Header"."Shipping Agent Code") { }
                column(Shipdate; "Sales Shipment Header"."Shipment Date") { }
                column(Payterms; PaymentTerms.Description) { }
                column(TaxNo; Customer."VAT Registration No.") { }
                // Custom fields: must also exist on Sales Shipment Header and be copied when the shipment is posted
                column(Shippingcomment; "Sales Shipment Header"."Shipping Comment") { }
                column(tagname; "Sales Shipment Header"."Tag Name") { }
                column(customerID; "Sales Shipment Header"."Bill-to Customer No.") { }
                column(PONumber; "Sales Shipment Header"."External Document No.") { }
                column(PODate; "Sales Shipment Header"."Order Date") { }
                column(Salesperson; SalesPurchPerson.Name) { }

                dataitem(SalesLine; Integer)
                {
                    DataItemTableView = sorting(Number);
                    DataItemLinkReference = PageLoop;

                    column(AmountExclInvDisc; AmountExclInvDisc) { }
                    column(TotalAmountExclInvDisc; TotalAmountExclInvDisc) { }
                    column(ItemNo; TempSalesLine."No.") { }
                    column(Itemtype; TempSalesLine.Type) { }
                    column(Desc; TempSalesLine.Description) { }
                    column(Desc2; TempSalesLine."Description 2") { }
                    column(UOM; TempSalesLine."Unit of Measure Code") { }
                    column(Weight1Calc; Weight1Calc) { }
                    column(Weight2Calc; Weight2Calc) { }
                    column(Weight1Label; Weight1Label) { }
                    column(Weight2Label; Weight2Label) { }
                    column(QtyOrderedLabel; QtyOrderedLabel) { }
                    column(QtyOrderedNo; QtyOrderedNo) { }
                    column(UnitPriceToPrint; UnitPriceToPrint) { }
                    column(CountryOfOrigin; CountryOfOrigin) { }
                    column(TariffNo; TariffNo) { }
                    column(TariffNote; TariffNote) { }
                    column(TotalWeight; TotalWeight) { }
                    column(TotalPieces; TotalPieces) { }  // running total, so the last row holds the full total
                    column(LinePieces; LinePieces) { }    // pieces for this line only
                    column(TotalLabel; TotalLabel) { }
                    column(BreakdownLabel1; BreakdownLabel[1]) { }
                    column(BreakdownLabel2; BreakdownLabel[2]) { }
                    column(BreakdownLabel3; BreakdownLabel[3]) { }
                    column(BreakdownLabel4; BreakdownLabel[4]) { }
                    column(TotalVATAmount; TotalVATAmount) { }
                    column(VATAmount; VATAmount) { }
                    column(BreakdownAmt1; BreakdownAmt[1]) { }
                    column(BreakdownAmt2; BreakdownAmt[2]) { }
                    column(BreakdownAmt3; BreakdownAmt[3]) { }
                    column(BreakdownAmt4; BreakdownAmt[4]) { }
                    column(CurrencyCode; CurrencyCode) { }
                    column(GrandTotalLabel; GrandTotalLabel) { }
                    trigger OnPreDataItem()
                    begin
                        // FIXED: TotalPieces removed from CreateTotals entirely to stop background calculation conflicts
                        CurrReport.CreateTotals(TaxLiable, TaxAmount, AmountExclInvDisc, TempSalesLine."Line Amount", TempSalesLine."Inv. Discount Amount");
                        NumberOfLines := TempSalesLine.Count();
                        SetRange(Number, 1, NumberOfLines);
                        OnLineNumber := 0;
                        // Shipments have no backorder: single "Total:" row
                        QtyOrderedLabel := 'Quantity';
                        TotalLabel := 'Total:';
                        GrandTotalLabel := '';
                    end;

                    trigger OnAfterGetRecord()
                    begin
                        OnLineNumber := OnLineNumber + 1;
                        // Reset per-line outputs so values never leak from the previous line
                        Weight1Calc := 0;
                        Weight2Calc := 0;
                        QtyOrderedNo := 0;
                        UnitPriceToPrint := 0;
                        AmountExclInvDisc := 0;
                        VATAmount := 0;
                        LinePieces := 0;
                        CountryOfOrigin := '';
                        TariffNo := '';
                        TariffNote := '';
                        if OnLineNumber = 1 then
                            TempSalesLine.FindFirst()
                        else
                            TempSalesLine.Next();
                        if (TempSalesLine.Type = TempSalesLine.Type::" ") or (TempSalesLine.Type = TempSalesLine.Type::"G/L Account") then begin
                            // Text and G/L lines print as description only
                            TempSalesLine."No." := '';
                            TempSalesLine."Unit of Measure Code" := '';
                            TempSalesLine."Line Amount" := 0;
                            TempSalesLine."Inv. Discount Amount" := 0;
                            TempSalesLine.Quantity := 0;
                        end;
                        TaxAmount := TempSalesLine."Amount Including VAT" - TempSalesLine.Amount;
                        if TaxAmount <> 0 then
                            TaxLiable := TempSalesLine.Amount
                        else
                            TaxLiable := 0;
                        if "Sales Shipment Header"."Currency Code" = '' then
                            CurrencyCode := 'CDN'
                        else
                            CurrencyCode := "Sales Shipment Header"."Currency Code";
                        if (TempSalesLine.Type <> TempSalesLine.Type::" ") and (TempSalesLine.Type <> TempSalesLine.Type::"G/L Account") then begin
                            if TempSalesLine.Type = TempSalesLine.Type::Item then begin
                                Item3.Get(TempSalesLine."No.");
                                Item3.CalcFields("Outbound Duty % to US"); //TLY-SD - 04/01/2025
                            end else
                                Clear(Item3);
                            if CostInsteadOfPrice then
                                AmountExclInvDisc := TempSalesLine."Unit Cost (LCY)" * TempSalesLine.Quantity
                            else
                                if BackoutDuty then
                                    AmountExclInvDisc := (TempSalesLine."Unit Price" / (1 + (Item3."Outbound Duty % to US" * 0.01))) * TempSalesLine.Quantity
                                else
                                    AmountExclInvDisc := TempSalesLine."Unit Price" * TempSalesLine.Quantity;
                            QtyOrderedNo := TempSalesLine.Quantity;
                            if TempSalesLine.Quantity = 0 then
                                UnitPriceToPrint := 0  // so it won't print
                            else
                                UnitPriceToPrint := Round(AmountExclInvDisc / TempSalesLine.Quantity, 0.00001);
                            Weight1Label := 'Net Weight (LB)';
                            Weight1Calc := TempSalesLine."Net Weight" * TempSalesLine.Quantity;
                            Weight2Label := 'Net Weight (KG)';
                            Weight2Calc := (TempSalesLine."Net Weight" * TempSalesLine.Quantity) * 0.453592;
                            TotalWeight := TotalWeight + TempSalesLine."Net Weight" * TempSalesLine.Quantity;
                            TotalAmountExclInvDisc += AmountExclInvDisc;
                            if CostInsteadOfPrice then
                                VATAmount := Round((TempSalesLine."Unit Cost (LCY)" * TempSalesLine.Quantity * TempSalesLine."VAT %") / 100)
                            else
                                VATAmount := Round(TempSalesLine.Amount * TempSalesLine."VAT %" / 100);
                            TotalVATAmount += VATAmount;
                            if TempSalesLine.Type = TempSalesLine.Type::Item then
                                if Item.Get(TempSalesLine."No.") then begin
                                    CountryOfOrigin := Item."Country/Region of Origin Code";
                                    TariffNote := Item."Customs/Tariff Note"; //TLY-SD - 04/09/2025
                                    if UsePurchasesTariff then
                                        TariffNo := Item."Tariff No."
                                    else
                                        TariffNo := Item."Tariff No. (Sales)";
                                end;
                            LinePieces := CalcTotalPieces();
                            // FIXED: Re-added the manual accumulation here to safely handle the running total for RDLC dataset mapping
                            TotalPieces += LinePieces;
                        end;
                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    CurrReport.PageNo := 1;
                end;
            }
            trigger OnPreDataItem()
            begin
                CompanyInformation.Get();
                if PrintCompany then
                    FormatAddress.Company(CompanyAddress, CompanyInformation)
                else
                    Clear(CompanyAddress);
            end;

            trigger OnAfterGetRecord()
            begin
                if PrintCompany then
                    if RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                if "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.Get("Salesperson Code");
                if "Payment Terms Code" = '' then
                    Clear(PaymentTerms)
                else
                    PaymentTerms.Get("Payment Terms Code");
                if not Customer.Get("Sell-to Customer No.") then
                    Clear(Customer);
                // Verify these two signatures against your Format Address codeunit version
                FormatAddress.SalesShptSellTo(BillToAddress, "Sales Shipment Header");
                FormatAddress.SalesShptShipTo(ShipToAddress, "Sales Shipment Header");
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                // Reset per shipment (these used to accumulate across documents)
                TotalWeight := 0;
                TotalAmountExclInvDisc := 0;
                TotalVATAmount := 0;
                TotalPieces := 0;
                CALaddress1 := '';
                CALaddress2 := '';
                CALaddress3 := '';
                CALaddress4 := '';
                CALaddress5 := '';
                if "Location Code" = 'CAL' then begin
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
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(BackoutDuty; BackoutDuty)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Backout Duty';
                    }
                    field(CostInsteadOfPrice; CostInsteadOfPrice)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use Cost Instead of Price';
                    }
                    field(UsePurchasesTariff; UsePurchasesTariff)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use Purchase Tariff';
                    }
                }
            }
        }
    }
    trigger OnInitReport()
    begin
        BackoutDuty := true;
    end;

    procedure CalcTotalPieces() ReturnValue: Decimal
    var
        Item2: Record Item;
        UOMMgt: Codeunit "Unit of Measure Management";
        Pieces: Decimal;
        PerPallet: Decimal;
        PerCase: Decimal;
        TempQuantity: Decimal;
        QtyShippedPallet: Decimal;
        QtyShippedCase: Decimal;
        QtyShippedSingles: Decimal;
    begin
        if TempSalesLine.Type <> TempSalesLine.Type::Item then
            exit(0);
        Item2.Get(TempSalesLine."No.");
        if Item2."Compare Unit of Measure" <> '' then begin
            PerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item2, 'PALLET');
            PerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item2, 'CASE');
            TempQuantity := Round(TempSalesLine.Quantity * TempSalesLine."Qty. per Unit of Measure", 0.01, '<');
            QtyShippedPallet := 0;
            if PerPallet > 0 then
                while TempQuantity >= PerPallet do begin
                    QtyShippedPallet := QtyShippedPallet + 1;
                    TempQuantity := TempQuantity - PerPallet;
                end;
            if PerCase > 0 then begin
                QtyShippedCase := Round(TempQuantity / PerCase, 1.0, '<');
                QtyShippedSingles := Round((TempQuantity - (QtyShippedCase * PerCase)), 1.0, '>');
                Pieces := QtyShippedSingles + QtyShippedCase;
                if QtyShippedPallet <> 0 then
                    Pieces += PerPallet / PerCase * QtyShippedPallet;
            end else
                Pieces := TempQuantity;
            exit(Pieces);
        end else begin
            Pieces += TempSalesLine.Quantity;
            exit(Pieces);
        end;
    end;

    var
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        TempSalesLine: Record "Sales Line" temporary;
        RespCenter: Record "Responsibility Center";
        Item: Record Item;
        Customer: Record Customer;
        Item3: Record Item;
        FormatAddress: Codeunit "Format Address";
        CountryOfOrigin: Code[10];
        TariffNo: Code[15];
        TotalWeight: Decimal;
        TaxAmount: Decimal;
        TaxLiable: Decimal;
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        BreakdownAmt: array[4] of Decimal;
        Weight1Calc: Decimal;
        Weight2Calc: Decimal;
        TotalAmountExclInvDisc: Decimal;
        QtyOrderedNo: Decimal;
        TotalPieces: Decimal;
        LinePieces: Decimal;
        VATAmount: Decimal;
        TotalVATAmount: Decimal;
        CompanyAddress: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        Weight1Label: Text;
        Weight2Label: Text;
        GrandTotalLabel: Text;
        TotalLabel: Text;
        BreakdownLabel: array[4] of Text;
        QtyOrderedLabel: Text;
        TariffNote: Text;
        CurrencyCode: Text;
        CALaddress1: Text;
        CALaddress2: Text;
        CALaddress3: Text;
        CALaddress4: Text;
        CALaddress5: Text;
        PrintCompany: Boolean;
        CostInsteadOfPrice: Boolean;
        UsePurchasesTariff: Boolean;
        BackoutDuty: Boolean;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        HighestLineNo: Integer;
        SpacePointer: Integer;
}
