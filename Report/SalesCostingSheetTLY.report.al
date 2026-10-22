report 50049 "Sales Costing Sheet"
{
    Caption = 'Sales Costing Sheet';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Sales/Reports/SalesCostingSheet.rdl';
    ApplicationArea = All;
    DefaultLayout = RDLC;   // or RDLC/Word; see notes below

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Item Category Code", "Vendor No.";

            column(ItemCategoryCode; "Item Category Code") { }
            column(SKU; "No.") { }
            column(Description; Description) { }
            column(VendorNo; "Vendor No.") { }
            column(CurrencyCode; CurrencyCodeTxt) { }
            column(CurrencySym; Currency."Symbol") { }
            column(ExchangeRate; ExchRate) { DecimalPlaces = 0 : 5; }
            column(UnitCostFCY; UnitCostFCY) { DecimalPlaces = 2 : 5; }
            column(UnitCostLCY; UnitCostLCY) { DecimalPlaces = 2 : 5; }
            column(UnitsPerCase; UnitsPerCase) { }
            column(UnitsPerPallet; UnitsPerPallet) { }
            column(CasesPerPallet; CasesPerPallet) { }
            column(UnitsPerContainer; UnitsPerContainer) { }
            column(CasesPerContainer; CasesPerContainer) { }
            column(PalletsPerContainer; PalletsPerContainer) { }
            column(DutyPerUnit; DutyPerUnit) { DecimalPlaces = 2 : 5; }
            column(FreightPerUnit; FreightPerUnit) { DecimalPlaces = 2 : 5; }
            column(OtherPerUnit; OtherPerUnit) { DecimalPlaces = 2 : 5; }
            column(LandedCostPerUnit; LandedCostPerUnit) { DecimalPlaces = 2 : 5; }
            column(LandedCostPerCase; LandedCostPerCase) { DecimalPlaces = 2 : 5; }
            column(LandedCostPerPallet; LandedCostPerPallet) { DecimalPlaces = 2 : 5; }
            column(LandedCostPerContainer; LandedCostPerContainer) { DecimalPlaces = 2 : 5; }

            trigger OnAfterGetRecord()
            begin
                ClearValues();

                // Vendor currency
                if Vendor.Get("Vendor No.") then
                    CurrencyCodeTxt := Vendor."Currency Code";
                if CurrencyCodeTxt = '' then begin
                    GLSetup.Get();
                    CurrencyCodeTxt := GLSetup."LCY Code";
                end;

                // Vendor purchase price (in vendor currency)
                UnitCostFCY := GetVendorPrice(Item);
                if UnitCostFCY = 0 then
                    UnitCostFCY := "Last Direct Cost"; // fallback (LCY)

                // Exchange rate (1 FCY = x LCY) and conversion
                if Vendor."Currency Code" <> '' then begin
                    UnitCostLCY := CurrExchRate.ExchangeAmtFCYToLCY(
                        PricingDate, Vendor."Currency Code", UnitCostFCY,
                        CurrExchRate.ExchangeRate(PricingDate, Vendor."Currency Code"));
                    if UnitCostFCY <> 0 then
                        ExchRate := UnitCostLCY / UnitCostFCY;
                end else begin
                    UnitCostLCY := UnitCostFCY;
                    ExchRate := 1;
                end;

                // Packaging from Item SQFT of Measure
                UnitsPerCase := GetQtyPerUoM("No.", 'CASE');
                UnitsPerPallet := GetQtyPerUoM("No.", 'PALLET');
                UnitsPerContainer := GetQtyPerUoM("No.", 'CONT-20FT');
                // CasesPerPallet := UnitsPerPallet / UnitsPerCase;
                // CasesPerContainer := UnitsPerContainer / UnitsPerCase;
                // PalletsPerContainer := UnitsPerContainer / UnitsPerPallet;

                if UnitsPerCase <> 0 then begin
                    CasesPerPallet := UnitsPerPallet / UnitsPerCase;
                    CasesPerContainer := UnitsPerContainer / UnitsPerCase;
                end;
                if UnitsPerPallet <> 0 then
                    PalletsPerContainer := UnitsPerContainer / UnitsPerPallet;

                // Freight cost 
                FreightPerUnit := gettotalfreightcost('FOB SHA', '20*') / getfreightcostcount('FOB SHA', '20*');



                LandedCostPerUnit := UnitCostLCY + DutyPerUnit + FreightPerUnit + OtherPerUnit;
                LandedCostPerCase := LandedCostPerUnit * UnitsPerCase;
                LandedCostPerPallet := LandedCostPerUnit * UnitsPerPallet;
                LandedCostPerContainer := LandedCostPerUnit * UnitsPerContainer;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                    field(PricingDate; PricingDate) { Caption = 'Pricing / Exchange Rate Date'; ApplicationArea = All; }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if PricingDate = 0D then PricingDate := WorkDate();
        end;
    }

    var
        Vendor: Record Vendor;
        GLSetup: Record "General Ledger Setup";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        ItemAdditionalCost: Record "TlyItemAdditionalCosts";
        TlyFreightForwarderCosts: Record "TlyFreightForwarderCosts";
        PricingDate: Date;
        CaseUoMCode: Code[10];
        PalletUoMCode: Code[10];
        ContainerUoMCode: Code[10];
        FreightPerContainer: Decimal;
        DutyPct: Decimal;
        OtherCostPerContainer: Decimal;
        CurrencyCodeTxt: Code[10];
        ExchRate: Decimal;
        UnitCostFCY: Decimal;
        UnitCostLCY: Decimal;
        UnitsPerCase: Decimal;
        UnitsPerPallet: Decimal;
        UnitsPerContainer: Decimal;
        CasesPerPallet: Decimal;
        CasesPerContainer: Decimal;
        PalletsPerContainer: Decimal;
        DutyPerUnit: Decimal;
        FreightPerUnit: Decimal;
        OtherPerUnit: Decimal;
        LandedCostPerUnit: Decimal;
        LandedCostPerCase: Decimal;
        LandedCostPerPallet: Decimal;
        LandedCostPerContainer: Decimal;

    local procedure ClearValues()
    begin
        Clear(Vendor);
        CurrencyCodeTxt := '';
        ExchRate := 0;
        UnitCostFCY := 0;
        UnitCostLCY := 0;
        UnitsPerCase := 0;
        UnitsPerPallet := 0;
        UnitsPerContainer := 0;
        CasesPerPallet := 0;
        CasesPerContainer := 0;
        PalletsPerContainer := 0;
        DutyPerUnit := 0;
        FreightPerUnit := 0;
        OtherPerUnit := 0;
        LandedCostPerUnit := 0;
        LandedCostPerCase := 0;
        LandedCostPerPallet := 0;
        LandedCostPerContainer := 0;
    end;

    local procedure GetQtyPerUoM(ItemNo: Code[20]; UoMCode: Code[10]): Decimal
    var
        ItemUoM: Record "Item Unit of Measure";
    begin
        if ItemUoM.Get(ItemNo, UoMCode) then
            exit(ItemUoM."Qty. per Unit of Measure");
        exit(0);
    end;

    local procedure GetVendorPrice(Itm: Record Item): Decimal
    var
        PriceLine: Record "Price List Line";
        vendor: Record Vendor;
    begin
        vendor.Get(Itm."Vendor No.");
        PriceLine.SetRange("Price Type", PriceLine."Price Type"::Purchase);
        PriceLine.SetRange("Source Type", PriceLine."Source Type"::Vendor);
        PriceLine.SetRange("Currency Code", vendor."Currency Code");
        PriceLine.SetRange("Source No.", Itm."Vendor No.");
        PriceLine.SetRange("Asset Type", PriceLine."Asset Type"::Item);
        PriceLine.SetRange("Asset No.", Itm."No.");
        PriceLine.SetRange(Status, PriceLine.Status::Active);
        PriceLine.SetFilter("Starting Date", '%1|<=%2', 0D, PricingDate);
        PriceLine.SetFilter("Ending Date", '');
        if PriceLine.FindLast() then
            exit(PriceLine."Direct Unit Cost");
        exit(0);
    end;

    local procedure GetTotalFreightCost(ShipmentMethodCode: Code[10]; ContainerType: Code[20]): Decimal
    var
        FreightForwarderCosts: Record "tlyFreightForwarderCosts";
    begin
        // Clear any previous filters on the record
        FreightForwarderCosts.Reset();

        FreightForwarderCosts.SetRange("Location Code", 'TOR');
        FreightForwarderCosts.SetRange("Shipment Method Code", 'FOB SHA');
        FreightForwarderCosts.SetRange("Container Type", '20*');

        FreightForwarderCosts.SetRange("Sales Costing Sheet Rate", FreightForwarderCosts."Sales Costing Sheet Rate" = true);

        // Calculate the sum of the Rate field
        FreightForwarderCosts.CalcSums(Rate);

        // Return the calculated total
        exit(FreightForwarderCosts.Rate);
    end;

    local procedure GetFreightCostCount(ShipmentMethodCode: Code[10]; ContainerType: Code[20]): Integer
    var
        FreightForwarderCosts: Record "tlyFreightForwarderCosts";
    begin
        // Clear any previous filters on the record
        FreightForwarderCosts.Reset();

        FreightForwarderCosts.SetRange("Location Code", 'TOR');
        FreightForwarderCosts.SetRange("Shipment Method Code", 'FOB SHA');
        FreightForwarderCosts.SetRange("Container Type", '20*');

        FreightForwarderCosts.SetRange("Sales Costing Sheet Rate", FreightForwarderCosts."Sales Costing Sheet Rate" = true);

        // Return the total number of records matching the filters
        exit(FreightForwarderCosts.Count());
    end;


}