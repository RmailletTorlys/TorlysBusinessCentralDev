report 50026 "Proforma"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/Proforma.rdlc';
    Caption = 'Proforma';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            RequestFilterHeading = 'Sales Order';
            RequestFilterFields = "No.", "Sell-to Customer No.", "Ship-to Code", "Shipment Date";

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where("Document Type" = const(Order));
                DataItemLinkReference = "Sales Header";


                trigger OnPreDataItem()
                begin
                    TempSalesLine.Reset();
                    TempSalesLine.DeleteAll();
                end;

                trigger OnAfterGetRecord()
                begin
                    TempSalesLine := "Sales Line";

                    If IgnoreBackorder then begin
                        TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                        TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                    end;
                    TempSalesLine.Insert();

                    If IgnoreBackorder then begin
                        TempSalesLine.Quantity := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Quantity" := TempSalesLine."Qty. to Ship";

                        TempSalesLine."Quantity (Base)" := TempSalesLine."Qty. to Ship";
                        TempSalesLine."Outstanding Qty. (Base)" := TempSalesLine."Qty. to Ship";
                    end;

                    TempSalesLine.Modify();

                    HighestLineNo := "Line No.";
                    If "Sales Header"."Tax Area Code" <> '' then
                        SalesTaxCalc.AddSalesLine(TempSalesLine);
                end;

                // trigger OnPostDataItem()
                // begin
                //     If "Sales Header"."Tax Area Code" <> '' then begin
                //         SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                //         SalesTaxCalc.DistTaxOverSalesLines(TempSalesLine);
                //         SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                //         BrkIdx := 0;
                //         PrevPrintOrder := 0;
                //         PrevTaxPercent := 0;
                //         with TempSalesTaxAmtLine do begin
                //             Reset();
                //             SetCurrentKey("Print Order","Tax Area Code for Key","Tax Jurisdiction Code");
                //             If find('-') then
                //             repeat
                //             If (("Print Order" = 0) or
                //             ("Print Order" <> PrevPrintOrder) or
                //             ("Tax %" <> PrevTaxPercent))
                //             then begin
                //                 BrkIdx := BrkIdx + 1;

                //                 if BrkIdx > 1 then begin
                //                     If TaxArea."Country/Region" = TaxArea."Country/Region"::CA then
                //                     BreakdownTitle := Text006
                //                     else
                //                     BreakdownTitle := Text003;
                //                 end;

                //                 if BrkIdx > ArrayLen(BreakdownAmt) then begin

                //                 end;
                //             end;
                //         end;
                //     end;    
                // end;

            }

            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") where("Document Type" = const(Order), "Print On Order Confirmation" = const(true));
                DataItemLinkReference = "Sales Header";
                DataItemLink = "No." = field("No.");
            }

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                DataItemLinkReference = "Sales Header";

                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    DataItemLinkReference = CopyLoop;

                    dataitem(SalesLine; Integer)
                    {
                        DataItemTableView = sorting(Number);
                        DataItemLinkReference = PageLoop;

                    }
                }
            }
            trigger OnPreDataItem()
            begin
                CompanyInformation.Get('');
                If PrintCompany then
                    FormatAddress.Company(CompanyAddress, CompanyInformation)
                else
                    Clear(CompanyAddress);
            end;

            trigger OnAfterGetRecord()
            begin
                If PrintCompany then begin
                    If RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                end;
                // CurrReport.Language := Language.getLanguageID("Language Code");

                If "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.get("Salesperson Code");

                If "Payment Terms Code" = '' then
                    clear(PaymentTerms)
                else
                    PaymentTerms.get("Payment Terms Code");

                If "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                If not Customer.get("Sell-to Customer No.") then
                    Clear(Customer);

                FormatAddress.SalesHeaderSellTo(BillToAddress, "Sales Header");
                FormatAddress.SalesHeaderShipTo(ShipToAddress, CustAddress, "Sales Header");


                If LogInteraction then begin
                    CalcFields("No. of Archived Versions");
                    If "Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(3, "No.", "Doc. No. Occurrence", "No. of Archived Versions", Database::Customer, "Bill-to Contact No.",
                        "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.")
                    else
                        SegManagement.LogDocument(3, "No.", "Doc. No. Occurrence", "No. of Archived Versions", Database::Customer, "Bill-to Customer No.",
                        "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.");
                end;

                Clear(BreakdownTitle);
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                TotalTaxLabel := Text008;
                TaxRegNo := '';
                TaxRegLabel := '';
                If "Tax Area Code" <> '' then begin
                    TaxArea.Get("Tax Area Code");
                    Case TaxArea."Country/Region" of
                        Taxarea."Country/Region"::US:
                            TotalTaxLabel := Text005;
                        TaxArea."Country/Region"::CA:
                            begin
                                TotalTaxLabel := Text007;
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    end;
                    SalesTaxCalc.StartSalesTaxCalculation();
                end;

                If "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                else
                    UseDate := WorkDate();

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
    }

    var
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        TempSalesLine: Record "Sales Line" temporary;
        RespCenter: Record "Responsibility Center";
        Language1: Record Language;
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
        Item: Record Item;
        Customer: Record Customer;
        Item3: Record Item;
        IFSLine: Record "Sales Line";
        SalesPrinted: Codeunit "Sales-Printed";
        FormatAddress: Codeunit "Format Address";
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        CountryOfOrigin: code[10];
        TariffNo: code[15];
        ICProgramNo: Code[10];
        HTSCode: code[20];
        TotalWeight: Decimal;
        TaxAmount: Decimal;
        TaxLiable: Decimal;
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        BreakdownAmt: Decimal;
        Weight1Calc: Decimal;
        Weight2Calc: Decimal;
        GrandTotal: Decimal;
        AdditionalWeight: Decimal;
        IFSAmount: Decimal;
        QtyOrderedNo: Decimal;
        PrevTaxPercent: Decimal;
        TotalPieces: Decimal;
        CompanyAddress: array[8] of Text[100];
        CustAddress: array[8] of Text[100];
        Weight1Label: Text;
        BillToAddress: array[8] of Text[100];
        Weight2Label: Text;
        ShipToAddress: array[8] of Text[100];
        CopyTxt: Text;
        TaxRegNo: Text;
        GrandTotalLabel: Text;
        TotalLabel: Text;
        TaxRegLabel: Text;
        TotalTaxLabel: Text;
        BreakdownTitle: Text;
        BreakdownLabel: Text;
        QtyLabel: Text;
        QtyOrderedLabel: Text;
        TariffNote: Text;
        CurrencyCode: Text;
        CALaddress1: Text;
        CALaddress2: Text;
        CALaddress3: Text;
        CALaddress4: Text;
        CALaddress5: Text;
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        TaxFlag: Boolean;
        ArchiveDocument: Boolean;
        RemoveIFS: Boolean;
        LogInteraction: Boolean;
        IgnoreBackorder: Boolean;
        CostInsteadOfPrice: Boolean;
        UseListPrice: Boolean;
        UsePurchasesTariff: Boolean;
        RemoveFreight: Boolean;
        RemoveDuty: Boolean;
        BackoutDuty: Boolean;
        OrderShipped: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        HighestLineNo: Integer;
        SpacePointer: Integer;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        UseDate: Date;
        Text000: Label '<COPY>';
        Text001: Label '<Transferred from page %1>';
        Text002: Label '<Transferred to page %1>';
        Text003: Label '<Sales Tax Breakdown:>';
        Text004: Label '<Other Taxes>';
        Text005: Label '<Total Sales Tax:>';
        Text006: Label '<Tax Breakdown:>';
        Text007: Label '<Total Tax:>';
        Text008: Label '<Tax:>';
}