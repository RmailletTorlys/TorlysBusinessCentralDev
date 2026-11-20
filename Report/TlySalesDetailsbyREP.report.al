report 50087 SalesDetailsbyREP
{
    Caption = 'Sales Details by REP';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SalesDetailsbyREP.rdlc';

    dataset
    {
        dataitem(SalespersonPurchaser; "Salesperson/Purchaser")
        {
            RequestFilterFields = "Code";

            column(CompanyName; CompanyProperty.DisplayName()) { }
            column(DateFilter; DateFilterText) { }
            column(ShowDetail; ShowDetailInt) { }
            column(ShowByCustType; ShowByCustTypeInt) { }
            column(ShowByGenProd; ShowByGenProdInt) { }
            column(SalespersonCode; Code) { }
            column(SalespersonName; Name) { }

            dataitem(Detail; Integer)
            {
                DataItemTableView = sorting(Number);

                column(DocType; DocTypeText) { }
                column(DocNo; TempBuf."Document No.") { }
                column(PostingDate; PostingDateText) { }
                column(CustomerNo; TempBuf."Customer No.") { }
                column(CustomerName; TempBuf."Customer Name") { }
                column(CustomerType; TempBuf."Customer Type") { }
                column(ItemNo; TempBuf."No.") { }
                column(LineDescription; TempBuf.Description) { }
                column(GenProdPostingGroup; TempBuf."Gen. Prod. Posting Group") { }
                column(Quantity; TempBuf.Quantity) { }
                column(CurrencyCode; TempBuf."Currency Code") { }
                column(UnitPrice; TempBuf."Unit Price") { }
                column(AmountLCY; TempBuf."Amount (LCY)") { }

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, TempBuf.Count());
                end;

                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then
                        TempBuf.FindSet()
                    else
                        TempBuf.Next();

                    PostingDateText := Format(TempBuf."Posting Date");
                    if TempBuf."Document Type" = TempBuf."Document Type"::Invoice then
                        DocTypeText := 'INV'
                    else
                        DocTypeText := 'CR';
                end;
            }

            trigger OnAfterGetRecord()
            begin
                BuildBuffer(Code);
                if TempBuf.IsEmpty() then
                    CurrReport.Skip();
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
                    field(StartDateField; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Starting Date';
                    }
                    field(EndDateField; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Ending Date';
                    }
                    field(TotalsByField; TotalsBy)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Totals By';
                        OptionCaption = 'Customer Type,Gen. Prod. Posting Group,Both';
                    }
                    field(ShowDetailField; ShowDetail)
                    {
                        ApplicationArea = All;
                        Caption = 'Print in Detail';
                        ToolTip = 'Selected: print every invoice and credit memo line. Cleared: print one summarized line per customer.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if not Initialized then begin
                TotalsBy := TotalsBy::Both;
                ShowDetail := true;
                Initialized := true;
            end;
        end;
    }

    trigger OnPreReport()
    begin
        DateFilterText := '';
        if (StartDate <> 0D) or (EndDate <> 0D) then
            DateFilterText := StrSubstNo('%1..%2', StartDate, EndDate);

        EffectiveEndDate := EndDate;
        if EffectiveEndDate = 0D then
            EffectiveEndDate := DMY2Date(31, 12, 9999);

        ShowDetailInt := 0;
        if ShowDetail then
            ShowDetailInt := 1;

        ShowByCustTypeInt := 0;
        if TotalsBy in [TotalsBy::CustomerType, TotalsBy::Both] then
            ShowByCustTypeInt := 1;

        ShowByGenProdInt := 0;
        if TotalsBy in [TotalsBy::GenProdGroup, TotalsBy::Both] then
            ShowByGenProdInt := 1;
    end;

    local procedure BuildBuffer(SalespersonCode: Code[20])
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
    begin
        TempBuf.Reset();
        TempBuf.DeleteAll();
        EntryNo := 0;

        // Posted sales invoices (positive)
        SalesInvHeader.SetRange("Salesperson Code", SalespersonCode);
        SalesInvHeader.SetRange("Posting Date", StartDate, EffectiveEndDate);
        if SalesInvHeader.FindSet() then
            repeat
                SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
                SalesInvLine.SetFilter(Type, '<>%1', SalesInvLine.Type::" ");
                if SalesInvLine.FindSet() then
                    repeat
                        EntryNo += 1;
                        TempBuf.Init();
                        TempBuf."Entry No." := EntryNo;
                        TempBuf."Document Type" := TempBuf."Document Type"::Invoice;
                        TempBuf."Document No." := SalesInvHeader."No.";
                        TempBuf."Posting Date" := SalesInvHeader."Posting Date";
                        TempBuf."Customer No." := SalesInvHeader."Sell-to Customer No.";
                        TempBuf."Customer Name" := SalesInvHeader."Sell-to Customer Name";
                        TempBuf."Customer Type" := GetCustomerType(SalesInvHeader."Sell-to Customer No.");
                        TempBuf."No." := SalesInvLine."No.";
                        TempBuf.Description := SalesInvLine.Description;
                        TempBuf."Gen. Prod. Posting Group" := SalesInvLine."Gen. Prod. Posting Group";
                        TempBuf.Quantity := SalesInvLine.Quantity;
                        TempBuf."Unit Price" := SalesInvLine."Unit Price";
                        TempBuf."Currency Code" := SalesInvHeader."Currency Code";
                        TempBuf."Amount (LCY)" := ToLCY(SalesInvLine.Amount, SalesInvHeader."Currency Factor");
                        TempBuf.Insert();
                    until SalesInvLine.Next() = 0;
            until SalesInvHeader.Next() = 0;

        // Posted credit memos (negative)
        SalesCrMemoHeader.SetRange("Salesperson Code", SalespersonCode);
        SalesCrMemoHeader.SetRange("Posting Date", StartDate, EffectiveEndDate);
        if SalesCrMemoHeader.FindSet() then
            repeat
                SalesCrMemoLine.SetRange("Document No.", SalesCrMemoHeader."No.");
                SalesCrMemoLine.SetFilter(Type, '<>%1', SalesCrMemoLine.Type::" ");
                if SalesCrMemoLine.FindSet() then
                    repeat
                        EntryNo += 1;
                        TempBuf.Init();
                        TempBuf."Entry No." := EntryNo;
                        TempBuf."Document Type" := TempBuf."Document Type"::"Credit Memo";
                        TempBuf."Document No." := SalesCrMemoHeader."No.";
                        TempBuf."Posting Date" := SalesCrMemoHeader."Posting Date";
                        TempBuf."Customer No." := SalesCrMemoHeader."Sell-to Customer No.";
                        TempBuf."Customer Name" := SalesCrMemoHeader."Sell-to Customer Name";
                        TempBuf."Customer Type" := GetCustomerType(SalesCrMemoHeader."Sell-to Customer No.");
                        TempBuf."No." := SalesCrMemoLine."No.";
                        TempBuf.Description := SalesCrMemoLine.Description;
                        TempBuf."Gen. Prod. Posting Group" := SalesCrMemoLine."Gen. Prod. Posting Group";
                        TempBuf.Quantity := -SalesCrMemoLine.Quantity;
                        TempBuf."Unit Price" := SalesCrMemoLine."Unit Price";
                        TempBuf."Currency Code" := SalesCrMemoHeader."Currency Code";
                        TempBuf."Amount (LCY)" := -ToLCY(SalesCrMemoLine.Amount, SalesCrMemoHeader."Currency Factor");
                        TempBuf.Insert();
                    until SalesCrMemoLine.Next() = 0;
            until SalesCrMemoHeader.Next() = 0;

        TempBuf.SetCurrentKey("Posting Date", "Document No.");
    end;

    local procedure ToLCY(Amount: Decimal; CurrencyFactor: Decimal): Decimal
    begin
        if CurrencyFactor = 0 then
            exit(Amount);
        exit(Round(Amount / CurrencyFactor, 0.01));
    end;

    local procedure GetCustomerType(CustomerNo: Code[20]): Code[20]
    var
        Customer: Record Customer;
    begin

        if Customer.Get(CustomerNo) then
            exit(Customer."Customer Posting Group");
        exit('');
    end;

    var
        TempBuf: Record "Sales Rep Buffer" temporary;
        StartDate: Date;
        EndDate: Date;
        EffectiveEndDate: Date;
        TotalsBy: Option CustomerType,GenProdGroup,Both;
        ShowDetail: Boolean;
        Initialized: Boolean;
        ShowDetailInt: Integer;
        ShowByCustTypeInt: Integer;
        ShowByGenProdInt: Integer;
        EntryNo: Integer;
        DateFilterText: Text;
        PostingDateText: Text;
        DocTypeText: Text;
}
