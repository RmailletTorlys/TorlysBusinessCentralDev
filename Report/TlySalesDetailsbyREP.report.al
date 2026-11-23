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

            RequestFilterFields = "Code", "Global Dimension 2 Code";


            dataitem(SalesInvHeader; "Sales Invoice Header")
            {
                DataItemLink = "Salesperson Code" = field(Code);
                RequestFilterFields = "Posting Date", "Sell-to Customer No.";

                dataitem(SalesInvLine; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = field("No.");

                    RequestFilterFields = "Gen. Prod. Posting Group", "No.", "Item Category Code";

                    trigger OnAfterGetRecord()
                    begin
                        if Type = Type::" " then
                            CurrReport.Skip();
                        AddInvoiceLineToBuffer();
                    end;
                }
            }


            dataitem(SalesCrMemoHeader; "Sales Cr.Memo Header")
            {
                DataItemLink = "Salesperson Code" = field(Code);
                RequestFilterFields = "Posting Date", "Sell-to Customer No.";

                dataitem(SalesCrMemoLine; "Sales Cr.Memo Line")
                {
                    DataItemLink = "Document No." = field("No.");
                    RequestFilterFields = "Gen. Prod. Posting Group", "No.", "Item Category Code";

                    trigger OnAfterGetRecord()
                    begin
                        if Type = Type::" " then
                            CurrReport.Skip();
                        AddCrMemoLineToBuffer();
                    end;
                }
            }


            dataitem(Detail; Integer)
            {
                DataItemTableView = sorting(Number);

                column(CompanyName; CompanyProperty.DisplayName()) { }
                column(DateFilter; DateFilterText) { }
                column(ShowDetail; ShowDetailInt) { }
                column(SalespersonCode; SalespersonPurchaser.Code) { }
                column(SalespersonName; SalespersonPurchaser.Name) { }
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
                    TempBuf.SetCurrentKey("Posting Date", "Document No.");
                    if CustomerTypeFilter <> '' then
                        TempBuf.SetFilter("Customer Type", CustomerTypeFilter);
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
                // start each salesperson with an empty buffer
                TempBuf.Reset();
                TempBuf.DeleteAll();
                EntryNo := 0;
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
                    field(ShowDetailField; ShowDetail)
                    {
                        ApplicationArea = All;
                        Caption = 'Print in Detail';
                        ToolTip = 'Selected: print every invoice and credit memo line. Cleared: print one summarized line per customer.';
                    }
                    field(CustomerTypeFilterField; CustomerTypeFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Customer Type Filter';
                        ToolTip = 'Optional. Only include customers of this type (filter syntax allowed, e.g. A|B).';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if not Initialized then begin
                ShowDetail := true;
                Initialized := true;
            end;
        end;
    }

    trigger OnPreReport()
    var
        InvDateFilter: Text;
        CrDateFilter: Text;
    begin
        InvDateFilter := SalesInvHeader.GetFilter("Posting Date");
        CrDateFilter := SalesCrMemoHeader.GetFilter("Posting Date");
        if InvDateFilter = CrDateFilter then
            DateFilterText := InvDateFilter
        else
            DateFilterText := StrSubstNo('Invoices: %1  Credit Memos: %2', InvDateFilter, CrDateFilter);

        ShowDetailInt := 0;
        if ShowDetail then
            ShowDetailInt := 1;

    end;

    local procedure AddInvoiceLineToBuffer()
    begin
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
    end;

    local procedure AddCrMemoLineToBuffer()
    begin
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
        ShowDetail: Boolean;
        Initialized: Boolean;
        CustomerTypeFilter: Text;
        ShowDetailInt: Integer;
        EntryNo: Integer;
        DateFilterText: Text;
        PostingDateText: Text;
        DocTypeText: Text;
}
