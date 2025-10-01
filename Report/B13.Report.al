report 50020 "B13 Purchase"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/B13.rdlc';
    Caption = 'B13 Purchase';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("Country/Region of Origin Code", "Tariff No.");
            RequestFilterFields = "Country/Region of Origin Code", "Tariff No.";
            PrintOnlyIfDetail = true;



            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = where(Type = filter(Item), Quantity = filter(<> 0));
                DataItemLinkReference = Item;
                RequestFilterFields = "Document No.", "Sell-to Customer No.", "Shipment Date";

                trigger OnAfterGetRecord()
                begin
                    item3.get("No.");
                    // TariffNote := item."Customs/Tariff Note";
                    If CostInsteadOfPrice then
                        NetPrice := "Unit Cost (LCY)"
                    else if (BackoutDuty) and (Item3."Tarrif Charge Required") then
                        NetPrice := (Round(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') / 1.25)
                    else
                        NetPrice := (Round(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '='));

                    SalesHeader.get("Document Type", "Document No.");
                    If OrderShipped then begin
                        If ("Gen. Bus. Posting Group" = 'SS Wood') and (SalesHeader."Ship-to Country/Region Code" = 'NZL') then begin
                            OrderQuantity := ("Quantity Shipped" / 10.764);
                            OrderUOM := 'M2';
                        end else if "Gen. Bus. Posting Group" In ['ACCESSORY', 'MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS', 'UNDERLAYMENT'] then begin
                            OrderQuantity := "Quantity Shipped";
                            OrderUOM := "Unit of Measure Code";
                        end else if COPYSTR("Gen. Bus. Posting Group", 1, 4) = 'MARK' then begin
                            OrderQuantity := "Quantity Shipped";
                            OrderUOM := "Unit of Measure Code";
                        end else begin
                            ItemUOM.get("No.", 'CASE');
                            OrderQuantity := ("Quantity Shipped" / ItemUOM."Qty. per Unit of Measure") * ((ItemUOM.Cubage / 1728) / 35.315);
                            OrderUOM := 'M3';
                        end;
                    end;


                end;
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Tariff No.");

                CurrReport.CreateTotals(TariffQuantity, TariffNetWeightLB, TariffNetWeightKG, TariffLineAmount);
            end;
        }
    }

    var
        SalesLine: Record "Sales Line";
        Item3: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        SalesHeader: Record "Sales Header";
        IFSline: Record "Sales Line";
        CostInsteadOfPrice: Boolean;
        UsePurchasesTariff: Boolean;
        RemoveFreight: Boolean;
        OrderShipped: Boolean;
        RemoveDuty: Boolean;
        BackoutDuty: Boolean;
        IgnoreBackorder: Boolean;
        RemoveIFS: Boolean;
        LastFieldNo: Integer;
        TariffQuantity: Decimal;
        TariffNetWeightLB: Decimal;
        TariffNetWeightKG: Decimal;
        TariffLineAmount: Decimal;
        NetPrice: Decimal;
        LineAmount: Decimal;
        OrderQuantity: Decimal;
        NetWeightLB: Decimal;
        NetWeightKG: Decimal;
        IFSAmount: Decimal;
        CaseLength: Decimal;
        CaseWidth: Decimal;
        CaseHeight: Decimal;
        FilterString: Text;
        TariffNo: Text;
        TariffNote: Text;
        OrderUOM: Code[10];
        HTSCode: Code[20];
}