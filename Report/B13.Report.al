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
            RequestFilterHeading = 'Item';

            column(FilterString; FilterString)
            {

            }
            column(TariffQuantity; TariffQuantity)
            {

            }
            column(TariffNetWeightKG; TariffNetWeightKG)
            {

            }
            column(TariffNetWeightLB; TariffNetWeightLB)
            {

            }
            column(TariffLineAmount; TariffLineAmount)
            {

            }
            // column(SystemId; LookupUserIdWithGuid(SystemId))
            // {

            // }
            column(Country_Region_of_Origin_Code; "Country/Region of Origin Code")
            {

            }
            column(Tariff_No_; "Tariff No.")
            {

            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = where(Type = filter(Item), Quantity = filter(<> 0));
                DataItemLinkReference = Item;
                DataItemLink = "No." = field("No.");
                RequestFilterFields = "Document No.", "Sell-to Customer No.", "Shipment Date";
                RequestFilterHeading = 'Sales Line';

                column(No_; "No.")
                {

                }
                column(FilterString1; FilterString)
                {

                }
                column(Description; Description)
                {

                }
                column(OrderQuantity; OrderQuantity)
                {

                }
                column(OrderUOM; OrderUOM)
                {

                }
                column(NetWeightLB; NetWeightLB)
                {

                }
                column(NetWeightKG; NetWeightKG)
                {

                }
                column(NetPrice; NetPrice)
                {

                }
                column(LineAmount; LineAmount)
                {

                }

                trigger OnAfterGetRecord()
                begin
                    TariffQuantity := 0;
                    TariffNetWeightLB := 0;
                    TariffNetWeightKG := 0;
                    TariffLineAmount := 0;

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



                        NetWeightLB := "Quantity Shipped" * "Net Weight";
                        NetWeightKG := "Quantity Shipped" * "Net Weight" * 0.453592;
                        LineAmount := "Quantity Shipped" * NetPrice;
                        TariffQuantity := TariffQuantity + OrderQuantity;
                        TariffNetWeightLB := TariffNetWeightLB + ("Sales Line"."Quantity Shipped" * "Sales Line"."Net Weight");
                        TariffNetWeightKG := TariffNetWeightKG + ("Sales Line"."Quantity Shipped" * "Sales Line"."Net Weight" * 0.453592);
                        TariffLineAmount += LineAmount;
                    end else begin
                        If ("Gen. Bus. Posting Group" = 'SS Wood') and (SalesHeader."Ship-to Country/Region Code" = 'NZL') then begin
                            OrderQuantity := ("Qty. to Ship" / 10.764);
                            OrderUOM := 'M2';
                        end else if "Gen. Bus. Posting Group" In ['ACCESSORY', 'MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS', 'UNDERLAYMENT'] then begin
                            OrderQuantity := "Qty. to Ship";
                            OrderUOM := "Unit of Measure Code";
                        end else if COPYSTR("Gen. Bus. Posting Group", 1, 4) = 'MARK' then begin
                            OrderQuantity := "Qty. to Ship";
                            OrderUOM := "Unit of Measure Code";
                        end else begin
                            ItemUOM.get("No.", 'CASE');
                            OrderQuantity := ("Qty. to Ship" / ItemUOM."Qty. per Unit of Measure") * ((ItemUOM.Cubage / 1728) / 35.315);
                            OrderUOM := 'M3';
                        end;

                        NetWeightLB := "Qty. to Ship" * "Net Weight";
                        NetWeightKG := "Qty. to Ship" * "Net Weight" * 0.453592;
                        LineAmount := "Qty. to Ship" * NetPrice;
                        TariffQuantity := TariffQuantity + OrderQuantity;
                        TariffNetWeightLB := TariffNetWeightLB + ("Sales Line"."Qty. to Ship" * "Sales Line"."Net Weight");
                        TariffNetWeightKG := TariffNetWeightKG + ("Sales Line"."Qty. to Ship" * "Sales Line"."Net Weight" * 0.453592);
                        TariffLineAmount += LineAmount;
                    end;

                    If "Document Type" = "Document Type"::"Return Order" then begin
                        If ("Gen. Bus. Posting Group" = 'SS Wood') and (SalesHeader."Ship-to Country/Region Code" = 'NZL') then begin
                            OrderQuantity := ("Quantity" / 10.764);
                            OrderUOM := 'M2';
                        end else if "Gen. Bus. Posting Group" In ['ACCESSORY', 'MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS', 'UNDERLAYMENT'] then begin
                            OrderQuantity := "Quantity";
                            OrderUOM := "Unit of Measure Code";
                        end else if COPYSTR("Gen. Bus. Posting Group", 1, 4) = 'MARK' then begin
                            OrderQuantity := "Quantity";
                            OrderUOM := "Unit of Measure Code";
                        end else begin
                            ItemUOM.get("No.", 'CASE');
                            OrderQuantity := ("Quantity" / ItemUOM."Qty. per Unit of Measure") * ((ItemUOM.Cubage / 1728) / 35.315);
                            OrderUOM := 'M3';
                        end;

                        NetWeightLB := "Quantity" * "Net Weight";
                        NetWeightKG := "Quantity" * "Net Weight" * 0.453592;
                        LineAmount := "Quantity" * NetPrice;
                        TariffQuantity := TariffQuantity + OrderQuantity;
                        TariffNetWeightLB := TariffNetWeightLB + ("Sales Line"."Quantity" * "Sales Line"."Net Weight");
                        TariffNetWeightKG := TariffNetWeightKG + ("Sales Line"."Quantity" * "Sales Line"."Net Weight" * 0.453592);
                        TariffLineAmount += LineAmount;
                    end;

                    If RemoveFreight then begin
                        If "Gen. Bus. Posting Group" = 'FREIGHT' then begin
                            "No." := '';
                            Description := '';
                            OrderQuantity := 0;
                            NetWeightLB := 0;
                            NetWeightKG := 0;
                            NetPrice := 0;
                            LineAmount := 0;
                            TariffQuantity := 0;
                            TariffNetWeightLB := 0;
                            TariffNetWeightKG := 0;
                            TariffLineAmount := 0;
                        end;
                    end;

                    If RemoveDuty then begin
                        If "Gen. Bus. Posting Group" = 'DUTY' then begin
                            "No." := '';
                            Description := '';
                            OrderQuantity := 0;
                            NetWeightLB := 0;
                            NetWeightKG := 0;
                            NetPrice := 0;
                            LineAmount := 0;
                            TariffQuantity := 0;
                            TariffNetWeightLB := 0;
                            TariffNetWeightKG := 0;
                            TariffLineAmount := 0;
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

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(OrderShipped; OrderShipped)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Is Order Shipped?';
                    }
                    field(IgnoreBackorder; IgnoreBackorder)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Exclude Backorder';
                    }
                    field(RemoveFreight; RemoveFreight)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Remove Freight Lines';
                    }
                    field(RemoveDuty; RemoveDuty)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Remove Duty Lines';
                    }
                    field(CostInsteadOfPrice; CostInsteadOfPrice)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use Cost Instead of Price';
                    }
                }
            }
        }
    }

    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;

    var
        SalesLine: Record "Sales Line";
        Item3: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        SalesHeader: Record "Sales Header";
        CostInsteadOfPrice: Boolean;
        UsePurchasesTariff: Boolean;
        RemoveFreight: Boolean;
        OrderShipped: Boolean;
        RemoveDuty: Boolean;
        BackoutDuty: Boolean;
        IgnoreBackorder: Boolean;
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
        CaseLength: Decimal;
        CaseWidth: Decimal;
        CaseHeight: Decimal;
        FilterString: Text;
        TariffNo: Text;
        TariffNote: Text;
        OrderUOM: Code[10];
        HTSCode: Code[20];
}