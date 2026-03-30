page 51029 TlyExecutiveStatistics
{
    Caption = 'Executive Statistics';
    PageType = Card;
    UsageCategory = Documents;
    ApplicationArea = All, Basic, Suite;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;

    // still to add:
    // freight charge and cost and margin - GL
    // inventory on hand - GL
    // inventory in transit - GL
    // inventory by tick box???
    // AR - this vs last
    // AP - this vs last
    // payment received
    // payment sent
    // shipped not invoiced

    layout
    {
        area(Content)
        {
            group(RevenueMonth)
            {
                Caption = 'Total Revenue by Month';
                grid(RevenueMonth2)
                {
                    group(RevenueMonthCurrentMTD)
                    {
                        Caption = 'Current MTD';
                        field(DateCurrMTD2; CurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Current MTD';
                            ToolTip = 'Current MTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(RevenueCurrMTD; GetRevenueCurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Revenue $';
                            ToolTip = 'Revenue $';
                            Editable = false;
                        }
                    }
                    group(RevenueMonthPreviousMTD)
                    {
                        Caption = 'Previous MTD';
                        Visible = false;
                        field(DatePrevMTD2; PrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous MTD';
                            ToolTip = 'Previous MTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(RevenuePrevMTD; GetRevenuePrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Revenue $';
                            ToolTip = 'Revenue $';
                            Editable = false;
                        }
                    }
                    group(RevenueMonthEOMPreviousYear)
                    {
                        Caption = 'EOM Previous Year';
                        field(DatePrevMTDEOM2; PrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous MTD EOM';
                            ToolTip = 'Previous MTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(RevenuePrevMTDEOM; GetRevenuePrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Revenue $';
                            ToolTip = 'Revenue $';
                            Editable = false;
                        }
                    }
                }
            }
            group(RevenueYear)
            {
                Caption = 'Total Revenue by Year';
                grid(RevenueYear2)
                {
                    group(RevenueYearCurrentYTD)
                    {
                        Caption = 'Current YTD';
                        field(DateCurrYTD2; CurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Current YTD';
                            ToolTip = 'Current YTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(RevenueCurrYTD; GetRevenueCurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Revenue $';
                            ToolTip = 'Revenue $';
                            Editable = false;
                        }
                    }
                    group(RevenueYearPreviousYTD)
                    {
                        Caption = 'Previous YTD';
                        Visible = false;
                        field(DatePrevYTD2; PrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD';
                            ToolTip = 'Previous YTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(RevenuePrevYTD; GetRevenuePrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Revenue $';
                            ToolTip = 'Revenue $';
                            Editable = false;
                        }
                    }
                    group(RevenueYearEOMPreviousYear)
                    {
                        Caption = 'EOM Previous Year';
                        field(DatePrevYTDEOM2; PrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD EOM';
                            ToolTip = 'Previous YTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(RevenuePrevYTDEOM; GetRevenuePrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Revenue $';
                            ToolTip = 'Revenue $';
                            Editable = false;
                        }
                    }
                    group(RevenueYearEOYPreviousYear)
                    {
                        Caption = 'EOY Previous Year';
                        field(DatePrevYTDEOY2; PrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD EOM';
                            ToolTip = 'Previous YTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(RevenuePrevYTDEOY; GetRevenuePrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Revenue $';
                            ToolTip = 'Revenue $';
                            Editable = false;
                        }
                    }
                }
            }
            group(SalesMonth)
            {
                Caption = 'Product Sales by Month';
                grid(SalesMonth1)
                {
                    group(SalesMonthCurrentMTD)
                    {
                        Caption = 'Current MTD';
                        field(DateCurrMTD; CurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Current MTD';
                            ToolTip = 'Current MTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(SalesCurrMTD; GetSalesCurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(MarginCurrMTD; GetSalesCurrMTD - GetCOGSCurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                        field(MarginPerCurrMTD; GetMarginCurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group(SalesMonthPreviousMTD)
                    {
                        Caption = 'Previous MTD';
                        Visible = false;
                        field(DatePrevMTD; PrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous MTD';
                            ToolTip = 'Previous MTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(SalesPrevMTD; GetSalesPrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(MarginPrevMTD; GetSalesPrevMTD - GetCOGSPrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                        field(MarginPerPrevMTD; GetMarginPrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group(SalesMonthEOMPreviousYear)
                    {
                        Caption = 'EOM Previous Year';
                        field(DatePrevMTDEOM; PrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous MTD EOM';
                            ToolTip = 'Previous MTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(SalesPrevMTDEOM; GetSalesPrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(MarginPrevMTDEOM; GetSalesPrevMTDEOM - GetCOGSPrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                        field(MarginPerPrevMTDEOM; GetMarginPrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                }
            }
            group(SalesYear)
            {
                Caption = 'Product Sales by Year';
                grid(SalesYear1)
                {
                    group(SalesYearCurrentYTD)
                    {
                        Caption = 'Current YTD';
                        field(DateCurrYTD; CurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Current YTD';
                            ToolTip = 'Current YTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(SalesCurrYTD; GetSalesCurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(MarginCurrYTD; GetSalesCurrYTD - GetCOGSCurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                        field(MarginPerCurrYTD; GetMarginCurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group(SalesYearPreviousYTD)
                    {
                        Caption = 'Previous YTD';
                        Visible = false;
                        field(DatePrevYTD; PrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD';
                            ToolTip = 'Previous YTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(SalesPrevYTD; GetSalesPrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(MarginPrevYTD; GetSalesPrevYTD - GetCOGSPrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                        field(MarginPerPrevYTD; GetMarginPrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group(SalesYearEOMPreviousYear)
                    {
                        Caption = 'EOM Previous Year';
                        field(DatePrevYTDEOM; PrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD EOM';
                            ToolTip = 'Previous YTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(SalesPrevYTDEOM; GetSalesPrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(MarginPrevYTDEOM; GetSalesPrevYTDEOM - GetCOGSPrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                        field(MarginPerPrevYTDEOM; GetMarginPrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group(SalesYearEOYPreviousYear)
                    {
                        Caption = 'EOY Previous Year';
                        field(DatePrevYTDEOY; PrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD EOM';
                            ToolTip = 'Previous YTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(SalesPrevYTDEOY; GetSalesPrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(MarginPrevYTDEOY; GetSalesPrevYTDEOY - GetCOGSPrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                        field(MarginPerPrevYTDEOY; GetMarginPrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                }
            }
            group(FreightMonth)
            {
                Caption = 'Freight by Month';
                grid(FreightMonth1)
                {
                    group(FreightMonthCurrentMTD)
                    {
                        Caption = 'Current MTD';
                        field(DateCurrMTD1; CurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Current MTD';
                            ToolTip = 'Current MTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(FreightChargeCurrMTD; GetFreightChargeCurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Charge $';
                            ToolTip = 'Charge $';
                            Editable = false;
                        }
                        field(FreightCostCurrMTD; GetFreightCostCurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Cost $';
                            ToolTip = 'Cost $';
                            Editable = false;
                        }
                    }
                    group(FreightMonthPreviousMTD)
                    {
                        Caption = 'Previous MTD';
                        Visible = false;
                        field(DatePrevMTD1; PrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous MTD';
                            ToolTip = 'Previous MTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(FreightChargePrevMTD; GetFreightChargePrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales $';
                            ToolTip = 'Sales $';
                            Editable = false;
                        }
                        field(FreightCostPrevMTD; GetFreightCostPrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin $';
                            ToolTip = 'Margin $';
                            Editable = false;
                        }
                    }
                    group(FreightMonthEOMPreviousYear)
                    {
                        Caption = 'EOM Previous Year';
                        field(DatePrevMTDEOM1; PrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous MTD EOM';
                            ToolTip = 'Previous MTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(FreightChargePrevMTDEOM; GetFreightChargePrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Charge $';
                            ToolTip = 'Charge $';
                            Editable = false;
                        }
                        field(FreightCostPrevMTDEOM; GetFreightCostPrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Cost $';
                            ToolTip = 'Cost $';
                            Editable = false;
                        }
                    }
                }
            }
            group(FreightYear)
            {
                Caption = 'Freight by Year';
                grid(FreightYear1)
                {
                    group(FreightYearCurrentYTD)
                    {
                        Caption = 'Current YTD';
                        field(DateCurrYTD1; CurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Current YTD';
                            ToolTip = 'Current YTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(FreightChargeCurrYTD; GetFreightChargeCurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Charge $';
                            ToolTip = 'Charge $';
                            Editable = false;
                        }
                        field(FreightCostCurrYTD; GetFreightCostCurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Cost $';
                            ToolTip = 'Cost $';
                            Editable = false;
                        }
                    }
                    group(FreightYearPreviousYTD)
                    {
                        Caption = 'Previous YTD';
                        Visible = false;
                        field(DatePrevYTD1; PrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD';
                            ToolTip = 'Previous YTD';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(FreightChargePrevYTD; GetFreightChargePrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Charge $';
                            ToolTip = 'Charge $';
                            Editable = false;
                        }
                        field(FreightCostPrevYTD; GetFreightCostPrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Cost $';
                            ToolTip = 'Cost $';
                            Editable = false;
                        }
                    }
                    group(FreightYearEOMPreviousYear)
                    {
                        Caption = 'EOM Previous Year';
                        field(DatePrevYTDEOM1; PrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD EOM';
                            ToolTip = 'Previous YTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(FreightChargePrevYTDEOM; GetFreightChargePrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Charge $';
                            ToolTip = 'Charge $';
                            Editable = false;
                        }
                        field(FreightCostPrevYTDEOM; GetFreightCostPrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Cost $';
                            ToolTip = 'Cost $';
                            Editable = false;
                        }
                    }
                    group(FreightYearEOYPreviousYear)
                    {
                        Caption = 'EOY Previous Year';
                        field(DatePrevYTDEOY1; PrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Previous YTD EOM';
                            ToolTip = 'Previous YTD EOM';
                            Editable = false;
                            ShowCaption = false;
                            RowSpan = 2;
                        }
                        field(FreightChargePrevYTDEOY; GetFreightChargePrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Charge $';
                            ToolTip = 'Charge $';
                            Editable = false;
                        }
                        field(FreightCostPrevYTDEOY; GetFreightCostPrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Cost $';
                            ToolTip = 'Cost $';
                            Editable = false;
                        }
                    }
                }
            }
            group(Inventory)
            {
                Caption = 'Inventory Value';
                field(InventOnHandNow; GetInventOnHandNow())
                {
                    ApplicationArea = All;
                    Caption = 'On Hand (Now)';
                    ToolTip = 'On Hand (Now)';
                    Editable = false;
                }
                field(InventOnHandYearAgo; GetInventOnHandYearAgo())
                {
                    ApplicationArea = All;
                    Caption = 'On Hand (Year Ago)';
                    ToolTip = 'On Hand (Year Ago)';
                    Editable = false;
                }
                field(InventInTransNow; GetInventInTransNow())
                {
                    ApplicationArea = All;
                    Caption = 'In Transit (Now)';
                    ToolTip = 'In Transit (Now)';
                    Editable = false;
                }
                field(InventInTransYearAgo; GetInventInTransYearAgo())
                {
                    ApplicationArea = All;
                    Caption = 'In Transit (Year Ago)';
                    ToolTip = 'In Transit (Year Ago)';
                    Editable = false;
                }
            }
        }
    }
    var
        SalesGLAcct: Code[20];
        COGSGLAcct: Code[20];
        FreightChargeGLAcct: Code[20];
        FreightCostGLAcct: Code[20];
        InventOnHandGLAcct: Code[20];
        InventInTransGLAcct: Code[20];
        CurrMTDStart: Date;
        CurrMTDEnd: Date;
        CurrMTD: Text[22];
        PrevMTDStart: Date;
        PrevMTDEnd: Date;
        PrevMTD: Text[22];
        PrevMTDEOMStart: Date;
        PrevMTDEOMEnd: Date;
        PrevMTDEOM: Text[22];
        CurrYTDStart: Date;
        CurrYTDEnd: Date;
        CurrYTD: Text[22];
        PrevYTDStart: Date;
        PrevYTDEnd: Date;
        PrevYTD: Text[22];
        PrevYTDEOMStart: Date;
        PrevYTDEOMEnd: Date;
        PrevYTDEOM: Text[22];
        PrevYTDEOYStart: Date;
        PrevYTDEOYEnd: Date;
        PrevYTDEOY: Text[22];
        GetMarginCurrMTD: Decimal;
        GetMarginPrevMTD: Decimal;
        GetMarginPrevMTDEOM: Decimal;
        GetMarginCurrYTD: Decimal;
        GetMarginPrevYTD: Decimal;
        GetMarginPrevYTDEOM: Decimal;
        GetMarginPrevYTDEOY: Decimal;

    trigger OnOpenPage()
    begin
        // GL accounts for each calc
        SalesGLAcct := '40100';
        COGSGLAcct := '51100';
        FreightChargeGLAcct := '60700';
        FreightCostGLAcct := '60200';
        InventOnHandGLAcct := '13100';
        InventInTransGLAcct := '13500';

        // start of month to today - this year
        CurrMTDStart := CalcDate('<-CM>', WorkDate());
        CurrMTDEnd := WorkDate();
        CurrMTD := StrSubstNo('%1..%2', Format(CurrMTDStart, 0, '<Month,2>/<Day,2>/<Year4>'), Format(CurrMTDEnd, 0, '<Month,2>/<Day,2>/<Year4>'));

        // start of  month to today - last year
        PrevMTDStart := CalcDate('<-CM-1Y>', WorkDate());
        PrevMTDEnd := CalcDate('<-1Y>', WorkDate());
        PrevMTD := StrSubstNo('%1..%2', Format(PrevMTDStart, 0, '<Month,2>/<Day,2>/<Year4>'), Format(PrevMTDEnd, 0, '<Month,2>/<Day,2>/<Year4>'));

        // start of month to end of month - last year
        PrevMTDEOMStart := CalcDate('<-CM-1Y>', WorkDate());
        PrevMTDEOMEnd := CalcDate('<+CM-1Y>', WorkDate());
        PrevMTDEOM := StrSubstNo('%1..%2', Format(PrevMTDEOMStart, 0, '<Month,2>/<Day,2>/<Year4>'), Format(PrevMTDEOMEnd, 0, '<Month,2>/<Day,2>/<Year4>'));

        // start of year to today - this year
        CurrYTDStart := CalcDate('<-CY>', WorkDate());
        CurrYTDEnd := WorkDate();
        CurrYTD := StrSubstNo('%1..%2', Format(CurrYTDStart, 0, '<Month,2>/<Day,2>/<Year4>'), Format(CurrYTDEnd, 0, '<Month,2>/<Day,2>/<Year4>'));

        // start of year to today - last year
        PrevYTDStart := CalcDate('<-CY-1Y>', WorkDate());
        PrevYTDEnd := CalcDate('<-1Y>', WorkDate());
        PrevYTD := StrSubstNo('%1..%2', Format(PrevYTDStart, 0, '<Month,2>/<Day,2>/<Year4>'), Format(PrevYTDEnd, 0, '<Month,2>/<Day,2>/<Year4>'));

        // start of year to end of month - last year
        PrevYTDEOMStart := CalcDate('<-CY-1Y>', WorkDate());
        PrevYTDEOMEnd := CalcDate('<+CM-1Y>', WorkDate());
        PrevYTDEOM := StrSubstNo('%1..%2', Format(PrevYTDEOMStart, 0, '<Month,2>/<Day,2>/<Year4>'), Format(PrevYTDEOMEnd, 0, '<Month,2>/<Day,2>/<Year4>'));

        // start of year to end of year - last year
        PrevYTDEOYStart := CalcDate('<-CY-1Y>', WorkDate());
        PrevYTDEOYEnd := CalcDate('<+CY-1Y>', WorkDate());
        PrevYTDEOY := StrSubstNo('%1..%2', Format(PrevYTDEOYStart, 0, '<Month,2>/<Day,2>/<Year4>'), Format(PrevYTDEOYEnd, 0, '<Month,2>/<Day,2>/<Year4>'));

        // calculate margin - start
        if GetSalesCurrMTD <> 0 then
            GetMarginCurrMTD := ((GetSalesCurrMTD - GetCOGSCurrMTD) / GetSalesCurrMTD) * 100
        else
            GetMarginCurrMTD := 0;

        if GetSalesPrevMTD <> 0 then
            GetMarginPrevMTD := ((GetSalesPrevMTD - GetCOGSPrevMTD) / GetSalesPrevMTD) * 100
        else
            GetMarginPrevMTD := 0;

        if GetSalesPrevMTDEOM <> 0 then
            GetMarginPrevMTDEOM := ((GetSalesPrevMTDEOM - GetCOGSPrevMTDEOM) / GetSalesPrevMTDEOM) * 100
        else
            GetMarginPrevMTDEOM := 0;

        if GetSalesCurrYTD <> 0 then
            GetMarginCurrYTD := ((GetSalesCurrYTD - GetCOGSCurrYTD) / GetSalesCurrYTD) * 100
        else
            GetMarginCurrYTD := 0;

        if GetSalesPrevYTD <> 0 then
            GetMarginPrevYTD := ((GetSalesPrevYTD - GetCOGSPrevYTD) / GetSalesPrevYTD) * 100
        else
            GetMarginPrevYTD := 0;

        if GetSalesPrevYTDEOM <> 0 then
            GetMarginPrevYTDEOM := ((GetSalesPrevYTDEOM - GetCOGSPrevYTDEOM) / GetSalesPrevYTDEOM) * 100
        else
            GetMarginPrevYTDEOM := 0;

        if GetSalesPrevYTDEOY <> 0 then
            GetMarginPrevYTDEOY := ((GetSalesPrevYTDEOY - GetCOGSPrevYTDEOY) / GetSalesPrevYTDEOY) * 100
        else
            GetMarginPrevYTDEOM := 0;
        // calculate margin - end
    end;

    //////////////////////// Revenue - start ////////////////////////

    procedure GetRevenueCurrMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SetFilter("G/L Account No.", '*');
        GLEntry.SetRange("Posting Date", CurrMTDStart, CurrMTDEnd);
        GLEntry.SetFilter("Gen. Posting Type", 'Sale');
        GLEntry.SetFilter("Document Type", 'Invoice|Credit Memo');
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    // procedure GetCOGSCurrMTD(): Decimal
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.SetRange("G/L Account No.", COGSGLAcct);
    //     GLEntry.SetRange("Posting Date", CurrMTDStart, CurrMTDEnd);
    //     GLEntry.CalcSums(Amount);
    //     exit(GLEntry.Amount);
    // end;

    procedure GetRevenuePrevMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDStart, PrevMTDEnd);
        GLEntry.SetFilter("Gen. Posting Type", 'Sale');
        GLEntry.SetFilter("Document Type", 'Invoice|Credit Memo');
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    // procedure GetCOGSPrevMTD(): Decimal
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.SetRange("G/L Account No.", COGSGLAcct);
    //     GLEntry.SetRange("Posting Date", PrevMTDStart, PrevMTDEnd);
    //     GLEntry.CalcSums(Amount);
    //     exit(GLEntry.Amount);
    // end;

    procedure GetRevenuePrevMTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDEOMStart, PrevMTDEOMEnd);
        GLEntry.SetFilter("Gen. Posting Type", 'Sale');
        GLEntry.SetFilter("Document Type", 'Invoice|Credit Memo');
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    // procedure GetCOGSPrevMTDEOM(): Decimal
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.SetRange("G/L Account No.", COGSGLAcct);
    //     GLEntry.SetRange("Posting Date", PrevMTDEOMStart, PrevMTDEOMEnd);
    //     GLEntry.CalcSums(Amount);
    //     exit(GLEntry.Amount);
    // end;

    procedure GetRevenueCurrYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", CurrYTDStart, CurrYTDEnd);
        GLEntry.SetFilter("Gen. Posting Type", 'Sale');
        GLEntry.SetFilter("Document Type", 'Invoice|Credit Memo');
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    // procedure GetCOGSCurrYTD(): Decimal
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.SetRange("G/L Account No.", COGSGLAcct);
    //     GLEntry.SetRange("Posting Date", CurrYTDStart, CurrYTDEnd);
    //     GLEntry.CalcSums(Amount);
    //     exit(GLEntry.Amount);
    // end;

    procedure GetRevenuePrevYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDStart, PrevYTDEnd);
        GLEntry.SetFilter("Gen. Posting Type", 'Sale');
        GLEntry.SetFilter("Document Type", 'Invoice|Credit Memo');
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    // procedure GetCOGSPrevYTD(): Decimal
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.SetRange("G/L Account No.", COGSGLAcct);
    //     GLEntry.SetRange("Posting Date", PrevYTDStart, PrevYTDEnd);
    //     GLEntry.CalcSums(Amount);
    //     exit(GLEntry.Amount);
    // end;

    procedure GetRevenuePrevYTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOMStart, PrevYTDEOMEnd);
        GLEntry.SetFilter("Gen. Posting Type", 'Sale');
        GLEntry.SetFilter("Document Type", 'Invoice|Credit Memo');
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    // procedure GetCOGSPrevYTDEOM(): Decimal
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.SetRange("G/L Account No.", COGSGLAcct);
    //     GLEntry.SetRange("Posting Date", PrevYTDEOMStart, PrevYTDEOMEnd);
    //     GLEntry.CalcSums(Amount);
    //     exit(GLEntry.Amount);
    // end;

    procedure GetRevenuePrevYTDEOY(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOYStart, PrevYTDEOYEnd);
        GLEntry.SetFilter("Gen. Posting Type", 'Sale');
        GLEntry.SetFilter("Document Type", 'Invoice|Credit Memo');
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    // procedure GetCOGSPrevYTDEOY(): Decimal
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.SetRange("G/L Account No.", COGSGLAcct);
    //     GLEntry.SetRange("Posting Date", PrevYTDEOYStart, PrevYTDEOYEnd);
    //     GLEntry.CalcSums(Amount);
    //     exit(GLEntry.Amount);
    // end;

    //////////////////////// Revenue - end ////////////////////////


    //////////////////////// Sales/COGS - start ////////////////////////

    procedure GetSalesCurrMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", CurrMTDStart, CurrMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetCOGSCurrMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", COGSGLAcct);
        GLEntry.SetRange("Posting Date", CurrMTDStart, CurrMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetSalesPrevMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDStart, PrevMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetCOGSPrevMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", COGSGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDStart, PrevMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetSalesPrevMTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDEOMStart, PrevMTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetCOGSPrevMTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", COGSGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDEOMStart, PrevMTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetSalesCurrYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", CurrYTDStart, CurrYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetCOGSCurrYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", COGSGLAcct);
        GLEntry.SetRange("Posting Date", CurrYTDStart, CurrYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetSalesPrevYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDStart, PrevYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetCOGSPrevYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", COGSGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDStart, PrevYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetSalesPrevYTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOMStart, PrevYTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetCOGSPrevYTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", COGSGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOMStart, PrevYTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetSalesPrevYTDEOY(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", SalesGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOYStart, PrevYTDEOYEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetCOGSPrevYTDEOY(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", COGSGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOYStart, PrevYTDEOYEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    //////////////////////// Sales/COGS - end ////////////////////////


    //////////////////////// Freight - start ////////////////////////

    procedure GetFreightChargeCurrMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightChargeGLAcct);
        GLEntry.SetRange("Posting Date", CurrMTDStart, CurrMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetFreightCostCurrMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightCostGLAcct);
        GLEntry.SetRange("Posting Date", CurrMTDStart, CurrMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetFreightChargePrevMTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightChargeGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDEOMStart, PrevMTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetFreightCostPrevMTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightCostGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDEOMStart, PrevMTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetFreightChargePrevMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightChargeGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDStart, PrevMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetFreightCostPrevMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightCostGLAcct);
        GLEntry.SetRange("Posting Date", PrevMTDStart, PrevMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetFreightChargeCurrYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightChargeGLAcct);
        GLEntry.SetRange("Posting Date", CurrYTDStart, CurrYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetFreightCostCurrYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightCostGLAcct);
        GLEntry.SetRange("Posting Date", CurrYTDStart, CurrYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetFreightChargePrevYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightChargeGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDStart, PrevYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetFreightCostPrevYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightCostGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDStart, PrevYTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetFreightChargePrevYTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightChargeGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOMStart, PrevYTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetFreightCostPrevYTDEOM(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightCostGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOMStart, PrevYTDEOMEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetFreightChargePrevYTDEOY(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightChargeGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOYStart, PrevYTDEOYEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetFreightCostPrevYTDEOY(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", FreightCostGLAcct);
        GLEntry.SetRange("Posting Date", PrevYTDEOYStart, PrevYTDEOYEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    //////////////////////// Freight - end ////////////////////////


    //////////////////////// Inventory - start ////////////////////////

    procedure GetInventOnHandNow(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", InventOnHandGLAcct);
        GLEntry.SetRange("Posting Date", 0D, CurrMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetInventInTransNow(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", InventInTransGLAcct);
        GLEntry.SetRange("Posting Date", 0D, CurrMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetInventOnHandYearAgo(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", InventOnHandGLAcct);
        GLEntry.SetRange("Posting Date", 0D, PrevMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    procedure GetInventInTransYearAgo(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", InventInTransGLAcct);
        GLEntry.SetRange("Posting Date", 0D, PrevMTDEnd);
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount);
    end;

    //////////////////////// Inventory - end ////////////////////////
}