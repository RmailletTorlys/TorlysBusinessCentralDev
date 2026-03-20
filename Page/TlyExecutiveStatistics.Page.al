page 51029 TlyExecutiveStatistics
{
    Caption = 'Executive Statistics';
    // QueryCategory = 'Executive Statistics';
    // AdditionalSearchTerms = 'Executive Statistics';
    PageType = Card;
    UsageCategory = Documents;
    ApplicationArea = All, Basic, Suite;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(Month)
            {
                Caption = 'Month';
                grid(Months)
                {
                    group("Current MTD")
                    {
                        field(CurrMTD; CurrMTD)
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
                        field(MarginPerCurrMTD; (GetSalesCurrMTD - GetCOGSCurrMTD) / GetSalesCurrMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group("Previous MTD")
                    {
                        field(PrevMTD; PrevMTD)
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
                        field(MarginPerPrevMTD; (GetSalesPrevMTD - GetCOGSPrevMTD) / GetSalesPrevMTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group("EOM Previous Year")
                    {
                        field(PrevMTDEOM; PrevMTDEOM)
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
                        field(MarginPerPrevMTDEOM; (GetSalesPrevMTDEOM - GetCOGSPrevMTDEOM) / GetSalesPrevMTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                }
            }
            group(Year)
            {
                Caption = 'Year';
                grid(Years)
                {
                    group("Current YTD")
                    {
                        field(CurrYTD; CurrYTD)
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
                        field(MarginPerCurrYTD; (GetSalesCurrYTD - GetCOGSCurrYTD) / GetSalesCurrYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group("Previous YTD")
                    {
                        field(PrevYTD; PrevYTD)
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
                        field(MarginPerPrevYTD; (GetSalesPrevYTD - GetCOGSPrevYTD) / GetSalesPrevYTD)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group("EOM Previous Year1")
                    {
                        field(PrevYTDEOM; PrevYTDEOM)
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
                        field(MarginPerPrevYTDEOM; (GetSalesPrevYTDEOM - GetCOGSPrevYTDEOM) / GetSalesPrevYTDEOM)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                    group("EOY Previous Year")
                    {
                        field(PrevYTDEOY; PrevYTDEOY)
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
                        field(MarginPerPrevYTDEOY; (GetSalesPrevYTDEOY - GetCOGSPrevYTDEOY) / GetSalesPrevYTDEOY)
                        {
                            ApplicationArea = All;
                            Caption = 'Margin %';
                            ToolTip = 'Margin %';
                            Editable = false;
                        }
                    }
                }
            }
        }
    }
    var
        SalesGLAcct: Code[20];
        COGSGLAcct: Code[20];
        FreightChargeGLAcct: Code[20];
        FreightCostGLAcct: Code[20];
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

    trigger OnOpenPage()
    begin
        // GL accounts for each calc
        SalesGLAcct := '40100';
        COGSGLAcct := '51100';
        FreightChargeGLAcct := '60700';
        FreightCostGLAcct := '60200';

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
        exit(GLEntry.Amount * -1);
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
        exit(GLEntry.Amount * -1);
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
        exit(GLEntry.Amount * -1);
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
        exit(GLEntry.Amount * -1);
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
        exit(GLEntry.Amount * -1);
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
        exit(GLEntry.Amount * -1);
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
        exit(GLEntry.Amount * -1);
    end;
}