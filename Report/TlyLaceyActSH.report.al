report 50086 TlyLaceyActSH
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/LaceyActSH.rdlc';
    Caption = 'TORLYS Lacey Act Declaration (Sales Shipment)';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Posting Date", "Shipment Date", "Sell-to Customer No.", "Ship-to Country/Region Code";
            RequestFilterHeading = 'Sales Shipment';

            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Type = const(Item), Quantity = filter(<> 0));

                column(ShipmentNo; "Sales Shipment Header"."No.")
                {
                }
                column(EstArrival; EstArrivalText)
                {
                }
                column(EntryNo; EntryNoText)
                {
                }
                column(ContainerNo; ContainerNoInput)
                {
                }
                column(BillOfLading; BillOfLadingText)
                {
                }
                column(MID; MIDInput)
                {
                }
                column(DescMerchandise; DescMerchandiseInput)
                {
                }
                column(ImporterName; ImporterName)
                {
                }
                column(ImporterAddr; ImporterAddr)
                {
                }
                column(ImporterAddr2; ImporterAddr2)
                {
                }
                column(ImporterCityLine; ImporterCityLine)
                {
                }
                column(ImporterCountry; ImporterCountry)
                {
                }
                column(ConsigneeName; ConsigneeName)
                {
                }
                column(ConsigneeAddr; ConsigneeAddr)
                {
                }
                column(ConsigneeAddr2; ConsigneeAddr2)
                {
                }
                column(ConsigneeCityLine; ConsigneeCityLine)
                {
                }
                column(ConsigneeCountry; ConsigneeCountry)
                {
                }
                column(PreparerPhone; PreparerPhone)
                {
                }
                column(PreparerName; PreparerName)
                {
                }
                column(HTSUS; HTSUS)
                {
                }
                column(EnteredValue; EnteredValue)
                {
                }
                column(Article; Description)
                {
                }
                column(Genus; Genus)
                {
                }
                column(Species; Species)
                {
                }
                column(HarvestCountry; HarvestCountry)
                {
                }
                column(PlantQty; PlantQty)
                {
                }
                column(PlantUnit; PlantUnit)
                {
                }
                column(PercentRecycled; PercentRecycled)
                {
                }
                column(MissingData; MissingData)
                {
                }

                trigger OnAfterGetRecord()
                var
                    NetPrice: Decimal;
                    VolumeM3: Decimal;
                begin
                    if not ItemRec.Get("No.") then
                        CurrReport.Skip();

                    Genus := GetItemAttributeValue("No.", GenusAttrName);
                    Species := GetItemAttributeValue("No.", SpeciesAttrName);
                    HarvestCountry := GetItemAttributeValue("No.", HarvestAttrName);
                    PercentRecycled := GetItemAttributeValue("No.", RecycledAttrName);
                    if PercentRecycled = '' then
                        PercentRecycled := '0';

                    if OnlyLinesWithLaceyData and (Genus = '') and (Species = '') and (HarvestCountry = '') then
                        CurrReport.Skip();

                    HTSUS := DelChr(ItemRec."Tariff No. (Sales)", '=', '.- ');

                    ItemRec.CalcFields("Outbound Duty % to US");
                    if UseCostInsteadOfPrice then
                        NetPrice := "Unit Cost (LCY)"
                    else
                        if BackoutDuty then
                            NetPrice := "Unit Price" / (1 + (ItemRec."Outbound Duty % to US" * 0.01))
                        else
                            NetPrice := "Unit Price";
                    EnteredValue := Round(Quantity * NetPrice, 0.01);

                    VolumeM3 := CalcVolumeM3("No.", "Quantity (Base)", ItemRec."Base Unit of Measure");
                    if VolumeM3 <> 0 then begin
                        PlantQty := Round(VolumeM3, 0.0001);
                        PlantUnit := 'm3';
                    end else begin
                        PlantQty := Round(Quantity * "Net Weight" * 0.453592, 0.01);
                        PlantUnit := 'kg';
                    end;

                    MissingData := '';
                    if HTSUS = '' then
                        MissingData += 'HTSUS; ';
                    if Genus = '' then
                        MissingData += 'Genus; ';
                    if Species = '' then
                        MissingData += 'Species; ';
                    if HarvestCountry = '' then
                        MissingData += 'Country of Harvest; ';
                    if PlantQty = 0 then
                        MissingData += 'Quantity; ';
                end;
            }

            trigger OnAfterGetRecord()
            var
                ArrivalDate: Date;
            begin
                ArrivalDate := EstArrivalInput;
                if ArrivalDate = 0D then
                    ArrivalDate := "Promised Delivery Date";
                if ArrivalDate = 0D then
                    ArrivalDate := "Requested Delivery Date";
                if ArrivalDate <> 0D then
                    EstArrivalText := Format(ArrivalDate, 0, '<Month,2>/<Day,2>/<Year4>')
                else
                    EstArrivalText := '';

                EntryNoText := "Order No.";

                BillOfLadingText := "BOL No.";

                ConsigneeName := "Ship-to Name";
                ConsigneeAddr := "Ship-to Address";
                ConsigneeAddr2 := "Ship-to Address 2";
                ConsigneeCityLine := BuildCityLine("Ship-to City", "Ship-to County", "Ship-to Post Code");
                ConsigneeCountry := "Ship-to Country/Region Code";

                PreparerName := "Sales Shipment Header"."Entered By";
            end;
        }
    }

    requestpage
    {
        SaveValues = false;

        layout
        {
            area(Content)
            {
                group(ShipmentInfo)
                {
                    Caption = 'Shipment Information (Section 1)';

                    field(EstArrivalInput; EstArrivalInput)
                    {
                        ApplicationArea = All;
                        Caption = '1. Estimated date of arrival';
                        ToolTip = 'Leave blank to use the shipment''s Promised Delivery Date, then Requested Delivery Date.';
                    }
                    field(ContainerNoInput; ContainerNoInput)
                    {
                        ApplicationArea = All;
                        Caption = '3. Container number';
                    }
                    field(MIDInput; MIDInput)
                    {
                        ApplicationArea = All;
                        Caption = '5. MID';
                    }
                    field(DescMerchandiseInput; DescMerchandiseInput)
                    {
                        ApplicationArea = All;
                        Caption = '10. Description of merchandise';
                    }
                }
                group(Options)
                {
                    Caption = 'Options';

                    field(BackoutDuty; BackoutDuty)
                    {
                        ApplicationArea = All;
                        Caption = 'Back out duty from entered value';
                    }
                    field(UseCostInsteadOfPrice; UseCostInsteadOfPrice)
                    {
                        ApplicationArea = All;
                        Caption = 'Use cost instead of price';
                    }
                    field(OnlyLinesWithLaceyData; OnlyLinesWithLaceyData)
                    {
                        ApplicationArea = All;
                        Caption = 'Only items with Lacey attributes';
                        ToolTip = 'Skip lines where genus, species and country of harvest are all blank (freight, non-wood items). Leave off to see every line with a MISSING flag.';
                    }
                }
                group(AttributeNames)
                {
                    Caption = 'Item Attribute Names';

                    field(GenusAttrName; GenusAttrName)
                    {
                        ApplicationArea = All;
                        Caption = 'Genus attribute';
                    }
                    field(SpeciesAttrName; SpeciesAttrName)
                    {
                        ApplicationArea = All;
                        Caption = 'Species attribute';
                    }
                    field(HarvestAttrName; HarvestAttrName)
                    {
                        ApplicationArea = All;
                        Caption = 'Country of harvest attribute';
                    }
                    field(RecycledAttrName; RecycledAttrName)
                    {
                        ApplicationArea = All;
                        Caption = '% recycled attribute';
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        GenusAttrName := 'Genus';
        SpeciesAttrName := 'Species';
        HarvestAttrName := 'Country of Harvest';
        RecycledAttrName := 'Percent Recycled';
        DescMerchandiseInput := 'Hardwood Flooring';
        BackoutDuty := true;
    end;

    trigger OnPreReport()
    var
        CompanyInfo: Record "Company Information";
        UserRec: Record User;
    begin
        CompanyInfo.Get();
        ImporterName := CompanyInfo.Name;
        ImporterAddr := CompanyInfo.Address;
        ImporterAddr2 := CompanyInfo."Address 2";
        ImporterCityLine := BuildCityLine(CompanyInfo.City, CompanyInfo.County, CompanyInfo."Post Code");
        ImporterCountry := '';
        PreparerPhone := CompanyInfo."Phone No.";

        // PreparerName := UserId();
        // UserRec.SetRange("User Name", UserId());
        // if UserRec.FindFirst() then
        //     if UserRec."Full Name" <> '' then
        //         PreparerName := UserRec."Full Name";
    end;

    local procedure BuildCityLine(City: Text; County: Text; PostCode: Text): Text
    var
        Result: Text;
    begin
        Result := City;
        if County <> '' then
            Result := DelChr(Result + ' ' + County, '<>', ' ');
        if PostCode <> '' then
            Result := DelChr(Result + ' ' + PostCode, '<>', ' ');
        exit(Result);
    end;

    local procedure GetItemAttributeValue(ItemNo: Code[20]; AttributeName: Text): Text
    var
        ItemAttribute: Record "Item Attribute";
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        ItemAttributeValue: Record "Item Attribute Value";
    begin
        if AttributeName = '' then
            exit('');

        ItemAttribute.SetRange(Name, CopyStr(AttributeName, 1, MaxStrLen(ItemAttribute.Name)));
        if not ItemAttribute.FindFirst() then
            exit('');

        ItemAttributeValueMapping.SetRange("Table ID", Database::Item);
        ItemAttributeValueMapping.SetRange("No.", ItemNo);
        ItemAttributeValueMapping.SetRange("Item Attribute ID", ItemAttribute.ID);
        if not ItemAttributeValueMapping.FindFirst() then
            exit('');

        if ItemAttributeValue.Get(ItemAttributeValueMapping."Item Attribute ID", ItemAttributeValueMapping."Item Attribute Value ID") then
            exit(ItemAttributeValue.Value);

        exit('');
    end;

    local procedure CalcVolumeM3(ItemNo: Code[20]; QtyBase: Decimal; BaseUOMCode: Code[10]): Decimal
    var
        CaseUOM: Record "Item Unit of Measure";
        BaseUOM: Record "Item Unit of Measure";
        CubicInchesPerM3: Decimal;
    begin
        CubicInchesPerM3 := 1728 * 35.315;

        if CaseUOM.Get(ItemNo, 'CASE') and (CaseUOM."Qty. per Unit of Measure" <> 0) then
            exit((QtyBase / CaseUOM."Qty. per Unit of Measure") * (CaseUOM.Cubage / CubicInchesPerM3));

        if BaseUOM.Get(ItemNo, BaseUOMCode) then
            exit(QtyBase * (BaseUOM.Cubage / CubicInchesPerM3));

        exit(0);
    end;

    var
        ItemRec: Record Item;
        EstArrivalInput: Date;
        ContainerNoInput: Text[50];
        MIDInput: Text[50];
        DescMerchandiseInput: Text[250];
        BackoutDuty: Boolean;
        UseCostInsteadOfPrice: Boolean;
        OnlyLinesWithLaceyData: Boolean;
        GenusAttrName: Text[250];
        SpeciesAttrName: Text[250];
        HarvestAttrName: Text[250];
        RecycledAttrName: Text[250];
        EstArrivalText: Text;
        EntryNoText: Text;
        BillOfLadingText: Text;
        ImporterName: Text;
        ImporterAddr: Text;
        ImporterAddr2: Text;
        ImporterCityLine: Text;
        ImporterCountry: Text;
        ConsigneeName: Text;
        ConsigneeAddr: Text;
        ConsigneeAddr2: Text;
        ConsigneeCityLine: Text;
        ConsigneeCountry: Text;
        PreparerPhone: Text;
        PreparerName: Code[50];
        HTSUS: Text;
        Genus: Text;
        Species: Text;
        HarvestCountry: Text;
        PercentRecycled: Text;
        MissingData: Text;
        EnteredValue: Decimal;
        PlantQty: Decimal;
        PlantUnit: Text;
}
