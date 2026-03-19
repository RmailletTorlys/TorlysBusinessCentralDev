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
            group(SalesMTD)
            {
                Caption = 'Sales - MTD';
                field(CurrMTD; CurrMTD)
                {
                    ApplicationArea = All;
                    Caption = 'Current MTD';
                    ToolTip = 'Current MTD';
                    Editable = false;
                }
                field(SalesCurrMTD; GetSalesCurrMTD)
                {
                    ApplicationArea = All;
                    Caption = 'Sales - Current MTD';
                    ToolTip = 'Sales - Current MTD';
                    Editable = false;
                }
                field(PrevMTD; PrevMTD)
                {
                    ApplicationArea = All;
                    Caption = 'Previous MTD';
                    ToolTip = 'Previous MTD';
                    Editable = false;
                }
                field(SalesPrevMTD; GetSalesPrevMTD)
                {
                    ApplicationArea = All;
                    Caption = 'Sales - Previous MTD';
                    ToolTip = 'Sales - Previous MTD';
                    Editable = false;
                }
            }
            group(SalesYTD)
            {
                Caption = 'Sales - YTD';
                field(CurrYTD; CurrYTD)
                {
                    ApplicationArea = All;
                    Caption = 'Current YTD';
                    ToolTip = 'Current YTD';
                    Editable = false;
                }
                field(SalesCurrYTD; GetSalesCurrYTD)
                {
                    ApplicationArea = All;
                    Caption = 'Sales - Current YTD';
                    ToolTip = 'Sales - Current YTD';
                    Editable = false;
                }
                field(PrevYTD; PrevYTD)
                {
                    ApplicationArea = All;
                    Caption = 'Previous YTD';
                    ToolTip = 'Previous YTD';
                    Editable = false;
                }
                field(SalesPrevYTD; GetSalesPrevYTD)
                {
                    ApplicationArea = All;
                    Caption = 'Sales - Previous YTD';
                    ToolTip = 'Sales - Previous YTD';
                    Editable = false;
                }
            }
        }
    }

    var
        CurrMTD: Text[22];
        PrevMTD: Text[22];
        CurrYTD: Text[22];
        PrevYTD: Text[22];

    trigger OnOpenPage()
    var
        CurrMTDStart: Text[10];
        CurrMTDEnd: Text[10];
        PrevMTDStart: Text[10];
        PrevMTDEnd: Text[10];
        CurrYTDStart: Text[10];
        CurrYTDEnd: Text[10];
        PrevYTDStart: Text[10];
        PrevYTDEnd: Text[10];
    begin
        CurrMTDStart := Format(CalcDate('<-CM>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        CurrMTDEnd := Format(CalcDate('<+CM>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        CurrMTD := StrSubstNo('%1..%2', CurrMTDStart, CurrMTDEnd);
        PrevMTDStart := Format(CalcDate('<-CM-1Y>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        PrevMTDEnd := Format(CalcDate('<+CM-1Y>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        PrevMTD := StrSubstNo('%1..%2', PrevMTDStart, PrevMTDEnd);
        CurrYTDStart := Format(CalcDate('<-CY>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        CurrYTDEnd := Format(CalcDate('<+CY>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        CurrYTD := StrSubstNo('%1..%2', CurrYTDStart, CurrYTDEnd);
        PrevYTDStart := Format(CalcDate('<-CY-1Y>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        PrevYTDEnd := Format(CalcDate('<+CY-1Y>', Today()), 0, '<Month,2>/<Day,2>/<Year4>');
        PrevYTD := StrSubstNo('%1..%2', PrevYTDStart, PrevYTDEnd);
    end;

    procedure GetSalesCurrMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", '40100');
        GLEntry.SetRange("Posting Date", CalcDate('<-CM>', Today()), CalcDate('<+CM>', Today()));
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetSalesPrevMTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", '40100');
        GLEntry.SetRange("Posting Date", CalcDate('<-CM-1Y>', Today()), CalcDate('<+CM-1Y>', Today()));
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetSalesCurrYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", '40100');
        GLEntry.SetRange("Posting Date", CalcDate('<-CY>', Today()), CalcDate('<+CY>', Today()));
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;

    procedure GetSalesPrevYTD(): Decimal
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.SetRange("G/L Account No.", '40100');
        GLEntry.SetRange("Posting Date", CalcDate('<-CY-1Y>', Today()), CalcDate('<+CY-1Y>', Today()));
        GLEntry.CalcSums(Amount);
        exit(GLEntry.Amount * -1);
    end;
}