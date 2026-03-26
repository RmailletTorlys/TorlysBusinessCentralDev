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
            group(SalesMonth)
            {
                Caption = 'Sales by Month';
                grid(Months)
                {
                    group(SalesCurrentMTD1)
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
                    group(SalesPreviousMTD1)
                    {
                        Caption = 'Previous MTD';
                        field(DatePrevMTD1; PrevMTD)
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
                    group(SalesEOMPreviousYear1)
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
                Caption = 'Sales by Year';
                grid(Years)
                {
                    group(SalesCurrentYTD1)
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
                    group(SalesPreviousYTD1)
                    {
                        Caption = 'Previous YTD';
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
                    group(SalesEOMPreviousYear2)
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
                    group(SalesEOYPreviousYear1)
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
                grid(FreightMonths)
                {
                    group(CurrentMTD2)
                    {
                        Caption = 'Current MTD';
                        field(CurrMTD1; CurrMTD)
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
                    group(FreightPrevMTD1)
                    {
                        Caption = 'Previous MTD';
                        field(DatePrevMTD; PrevMTD)
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
            // group(SalesMonth1)
            //     {
            //         Caption = 'Sales by Month11';
            //         grid(Months1)
            //         {
            //             group(SalesCurrentMTD11)
            //             {
            //                 Caption = 'Current MTD';
            //                 field(DateCurrMTD1; CurrMTD)
            //                 {
            //                     ApplicationArea = All;
            //                     Caption = 'Current MTD';
            //                     ToolTip = 'Current MTD';
            //                     Editable = false;
            //                     ShowCaption = false;
            //                 }

            //             }
            //         }
            //     }
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
}