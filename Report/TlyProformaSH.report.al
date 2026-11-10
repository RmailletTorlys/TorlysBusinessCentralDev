report 50085 TlyProformaShipment
{
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

            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.") where(Type = const(Item));
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Document No." = field("No.");

                trigger OnPreDataItem()
                begin
                    TempShptLine.Reset();
                    TempShptLine.DeleteAll();
                end;

                trigger OnAfterGetRecord()
                begin
                    TempShptLine := "Sales Shipment Line";
                    TempShptLine.Insert();
                end;
            }

            // 2) One page block per shipment
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
                column(ORNo; "Sales Shipment Header"."No.") { }
                column(OrderNo; "Sales Shipment Header"."Order No.") { }
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
                    column(ItemNo; TempShptLine."No.") { }
                    column(Itemtype; TempShptLine.Type) { }
                    column(Desc; TempShptLine.Description) { }
                    column(Desc2; TempShptLine."Description 2") { }
                    column(UOM; TempShptLine."Unit of Measure Code") { }
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
                    column(TotalPieces; TotalPieces) { }
                    column(LinePieces; LinePieces) { }
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
                        NumberOfLines := TempShptLine.Count();
                        SetRange(Number, 1, NumberOfLines);
                        OnLineNumber := 0;
                        QtyOrderedLabel := 'Quantity';
                        TotalLabel := 'Total:';
                        GrandTotalLabel := '';


                        TotalPieces := 0;
                        TempShptLine.Reset();
                        if TempShptLine.FindSet() then
                            repeat
                                TotalPieces += CalcLinePieces(TempShptLine."No.", TempShptLine.Quantity, TempShptLine."Qty. per Unit of Measure");
                            until TempShptLine.Next() = 0;
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
                        LineAmount := 0;
                        if OnLineNumber = 1 then
                            TempShptLine.FindFirst()
                        else
                            TempShptLine.Next();
                        if "Sales Shipment Header"."Currency Code" = '' then
                            CurrencyCode := 'CDN'
                        else
                            CurrencyCode := "Sales Shipment Header"."Currency Code";
                        // Only Item lines are buffered, so every line here is an Item
                        begin
                            Item3.Get(TempShptLine."No.");
                            Item3.CalcFields("Outbound Duty % to US"); //TLY-SD - 04/01/2025
                            // Shipment lines don't store Amount, so rebuild it
                            LineAmount := Round(TempShptLine.Quantity * TempShptLine."Unit Price" * (1 - TempShptLine."Line Discount %" / 100), 0.01);
                            if CostInsteadOfPrice then
                                AmountExclInvDisc := TempShptLine."Unit Cost (LCY)" * TempShptLine.Quantity
                            else
                                if BackoutDuty then
                                    AmountExclInvDisc := (TempShptLine."Unit Price" / (1 + (Item3."Outbound Duty % to US" * 0.01))) * TempShptLine.Quantity
                                else
                                    AmountExclInvDisc := TempShptLine."Unit Price" * TempShptLine.Quantity;
                            QtyOrderedNo := TempShptLine.Quantity;
                            if TempShptLine.Quantity = 0 then
                                UnitPriceToPrint := 0  // so it won't print
                            else
                                UnitPriceToPrint := Round(AmountExclInvDisc / TempShptLine.Quantity, 0.00001);
                            Weight1Label := 'Net Weight (LB)';
                            Weight1Calc := TempShptLine."Net Weight" * TempShptLine.Quantity;
                            Weight2Label := 'Net Weight (KG)';
                            Weight2Calc := (TempShptLine."Net Weight" * TempShptLine.Quantity) * 0.453592;
                            TotalWeight := TotalWeight + TempShptLine."Net Weight" * TempShptLine.Quantity;
                            TotalAmountExclInvDisc += AmountExclInvDisc;
                            if CostInsteadOfPrice then
                                VATAmount := Round((TempShptLine."Unit Cost (LCY)" * TempShptLine.Quantity * TempShptLine."VAT %") / 100)
                            else
                                VATAmount := Round(LineAmount * TempShptLine."VAT %" / 100);
                            TotalVATAmount += VATAmount;
                            if Item.Get(TempShptLine."No.") then begin
                                CountryOfOrigin := Item."Country/Region of Origin Code";
                                TariffNote := Item."Customs/Tariff Note"; //TLY-SD - 04/09/2025
                                if UsePurchasesTariff then
                                    TariffNo := Item."Tariff No."
                                else
                                    TariffNo := Item."Tariff No. (Sales)";
                            end;
                            LinePieces := CalcLinePieces(TempShptLine."No.", TempShptLine.Quantity, TempShptLine."Qty. per Unit of Measure");
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

    procedure CalcLinePieces(ItemNo: Code[20]; Qty: Decimal; QtyPerUOM: Decimal) ReturnValue: Decimal
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
        if not Item2.Get(ItemNo) then
            exit(Qty);
        if Item2."Compare Unit of Measure" = '' then
            exit(Qty);

        PerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item2, 'PALLET');
        PerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item2, 'CASE');
        TempQuantity := Round(Qty * QtyPerUOM, 0.01, '<');
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
    end;

    var
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        TempShptLine: Record "Sales Shipment Line" temporary;
        RespCenter: Record "Responsibility Center";
        Item: Record Item;
        Customer: Record Customer;
        Item3: Record Item;
        FormatAddress: Codeunit "Format Address";
        CountryOfOrigin: Code[10];
        TariffNo: Code[15];
        TotalWeight: Decimal;
        LineAmount: Decimal;
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
}
