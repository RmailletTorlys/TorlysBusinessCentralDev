report 50084 TlyB13PurchasesSH
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/B13PurchaseSH.rdlc';
    Caption = 'B13 Purchase SH';
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
            column(user; user)
            {

            }

            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemTableView = where(Type = filter(Item));
                DataItemLinkReference = Item;
                DataItemLink = "No." = field("No.");
                RequestFilterFields = "Document No.", "Sell-to Customer No.", "Shipment Date";
                RequestFilterHeading = 'Sales Shipment Line';

                column(No_; "No.")
                {

                }
                column(FilterString1; SalesShipmentLineFilter)
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

                    Item3.Get("No.");
                    Item3.CalcFields("Outbound Duty % to US"); //TLY-SD - 04/01/2025
                    // TariffNote := item."Customs/Tariff Note";
                    If CostInsteadOfPrice then
                        NetPrice := "Unit Cost (LCY)"
                    else if (BackoutDuty) then //and (Item3."Tariff Charge Required") then
                        // NetPrice := (Round(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '=') / (1 + (Item3."Outbound Duty % to US" * 0.01))) //1.25)
                        NetPrice := ("Unit Price" / (1 + (Item3."Outbound Duty % to US" * 0.01)))
                    else
                        // NetPrice := (Round(("Unit Price" * (1 - "Line Discount %" / 100)), 0.01, '='));
                        NetPrice := "Unit Price";

                    SalesShipmentHeader.get("Document No.");

                    // Use the shipment header (SalesHeader was never loaded, so the NZ test could never be true)
                    If ("Gen. Prod. Posting Group" = 'SS HardWood') and (SalesShipmentHeader."Ship-to Country/Region Code" = 'NZ') then begin
                        OrderQuantity := ("Quantity" / 10.764);
                        OrderUOM := 'M2';
                    end else if "Gen. Prod. Posting Group" In ['ACCESSORY', 'MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS', 'UNDERLAYMENT'] then begin
                        OrderQuantity := "Quantity";
                        OrderUOM := "Unit of Measure Code";
                    end else if COPYSTR("Gen. Prod. Posting Group", 1, 2) = 'MK' then begin
                        OrderQuantity := "Quantity";
                        OrderUOM := "Unit of Measure Code";
                    end else begin
                        OrderQuantity := CalcVolumeM3("No.", "Quantity (Base)", Item3."Base Unit of Measure");
                        OrderUOM := 'M3';
                    end;

                    NetWeightLB := "Quantity" * "Net Weight";
                    NetWeightKG := "Quantity" * "Net Weight" * 0.453592;
                    LineAmount := "Quantity" * NetPrice;
                    TariffQuantity := TariffQuantity + OrderQuantity;
                    TariffNetWeightLB := TariffNetWeightLB + ("Sales Shipment Line"."Quantity" * "Sales Shipment Line"."Net Weight");
                    TariffNetWeightKG := TariffNetWeightKG + ("Sales Shipment Line"."Quantity" * "Sales Shipment Line"."Net Weight" * 0.453592);
                    TariffLineAmount += LineAmount;


                    If RemoveFreight then begin
                        If "No." = '60700' then begin
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
                        If "No." = '51400' then begin
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
                SalesShipmentLineFilter := "Sales Shipment Line".GetFilters;

                User := Format(UserId());

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

                    field(BackoutDuty; BackoutDuty)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Backout Duty';
                    }
                    // field(DutyPercentage; DutyPercentage)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Duty Percentage';
                    // }
                    // field(RemoveFreight; RemoveFreight)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Remove Freight Lines';
                    // }
                    // field(RemoveDuty; RemoveDuty)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Remove Duty Lines';
                    // }
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

    /// Returns the volume in M3 for a quantity expressed in base units.
    /// 1) If the item has a CASE unit of measure, volume = cases * CASE cubage.
    /// 2) Otherwise falls back to the cubage of the item's base unit (e.g. EACH), per piece.
    /// 3) If no cubage can be found, returns 0 instead of raising an error.
    local procedure CalcVolumeM3(ItemNo: Code[20]; QtyBase: Decimal; BaseUOMCode: Code[10]): Decimal
    var
        CaseUOM: Record "Item Unit of Measure";
        BaseUOM: Record "Item Unit of Measure";
        CubicInchesPerM3: Decimal;
    begin
        CubicInchesPerM3 := 1728 * 35.315; // 1728 in3 per ft3, 35.315 ft3 per m3 (same factors as the original report)

        if CaseUOM.Get(ItemNo, 'CASE') and (CaseUOM."Qty. per Unit of Measure" <> 0) then
            exit((QtyBase / CaseUOM."Qty. per Unit of Measure") * (CaseUOM.Cubage / CubicInchesPerM3));

        if BaseUOM.Get(ItemNo, BaseUOMCode) then
            exit(QtyBase * (BaseUOM.Cubage / CubicInchesPerM3));

        exit(0);
    end;

    trigger OnInitReport()
    begin
        BackoutDuty := true;
    end;

    var
        SalesLine: Record "Sales Line";
        salesshipmentline: Record "Sales Shipment Line";
        salesshipmentheader: Record "Sales Shipment Header";
        Item3: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        SalesHeader: Record "Sales Header";
        CostInsteadOfPrice: Boolean;
        UsePurchasesTariff: Boolean;
        RemoveFreight: Boolean;
        OrderShipped: Boolean;
        RemoveDuty: Boolean;
        BackoutDuty: Boolean;
        DutyPercentage: Decimal;
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
        SalesShipmentLineFilter: Text;
        OrderUOM: Code[10];
        HTSCode: Code[20];
        user: code[50];
}
