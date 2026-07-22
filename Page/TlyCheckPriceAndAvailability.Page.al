page 50566 TlyCheckPriceAndAvailability
{
    Caption = 'Check Price and Availability';
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
            group(General)
            {
                Caption = 'General';
                field(CustomerNo; CustomerNo)
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                    ToolTip = 'Customer No.';
                    Editable = true;
                    QuickEntry = true;
                    TableRelation = Customer;
                    trigger OnValidate()
                    begin
                        if Customer.Get(CustomerNo) then begin
                            CustomerName := Customer.Name;
                            CustomerPriceList := Customer."Default Price List Code";
                            CustomerPriceGroup := Customer."Customer Price Group";
                        end;
                    end;
                }
                field(CustomerName; CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    ToolTip = 'Customer Name';
                    Editable = false;
                    QuickEntry = false;
                }
                field(CustomerPriceGroup; CustomerPriceGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Price Group';
                    ToolTip = 'Customer Price Group';
                    Editable = false;
                    QuickEntry = false;
                }
                field(CustomerPriceList; CustomerPriceList)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Price List';
                    ToolTip = 'Customer Price List';
                    Editable = false;
                    QuickEntry = false;
                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    ToolTip = 'Item No.';
                    Editable = true;
                    TableRelation = Item;
                    QuickEntry = true;
                    trigger OnValidate()
                    begin
                        if Item.Get(ItemNo) then begin
                            ItemDescription := Item.Description;
                            ItemCategory := Item."Item Category Code";
                            ItemPriceCode := Item."Sales Price Code";
                            CurrPage.TorlysItemAvailabilitySubform.Page.SetItemNo(Item);
                        end;
                    end;
                }
                field(ItemDescription; ItemDescription)
                {
                    ApplicationArea = All;
                    Caption = 'Item Description';
                    ToolTip = 'Item Description';
                    Editable = false;
                    QuickEntry = false;
                }
                field(ItemCategory; ItemCategory)
                {
                    ApplicationArea = All;
                    Caption = 'Item Category Code';
                    ToolTip = 'Item Category Code';
                    Editable = false;
                    QuickEntry = false;
                }
                field(ItemPriceCode; ItemPriceCode)
                {
                    ApplicationArea = All;
                    Caption = 'Item Price Code';
                    ToolTip = 'Item Price Code';
                    Editable = false;
                    QuickEntry = false;
                }
                field(CustomerCutPrice; GetCustomerCutPrice)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Cut Price';
                    ToolTip = 'Customer Cut Price';
                    Editable = false;
                    QuickEntry = false;
                }
                field(CustomerCutPriceTier; GetCustomerCutPriceTier)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Cut Price Tier';
                    ToolTip = 'Customer Cut Price Tier';
                    Editable = false;
                    QuickEntry = false;
                }
                field(CustomerPalletPrice; GetCustomerPalletPrice)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Full Pallet Price';
                    ToolTip = 'Customer Full Pallet Price';
                    Editable = false;
                    QuickEntry = false;
                }
                field(CustomerPalletPriceTier; GetCustomerPalletPriceTier)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Full Pallet Price Tier';
                    ToolTip = 'Customer Full Pallet Price Tier';
                    Editable = false;
                    QuickEntry = false;
                }
                field(InsurancePrice; GetInsurancePrice)
                {
                    ApplicationArea = All;
                    Caption = 'Insurance Price';
                    ToolTip = 'Insurance Price';
                    Editable = false;
                    QuickEntry = false;
                }
                field(InsurancePriceTier; GetInsurancePriceTier)
                {
                    ApplicationArea = All;
                    Caption = 'Insurance Price Tier';
                    ToolTip = 'Insurance Price Tier';
                    Editable = false;
                    QuickEntry = false;
                }
                field(ClearancePrice; GetClearancePrice)
                {
                    ApplicationArea = All;
                    Caption = 'Clearance Price';
                    ToolTip = 'Clearance Price';
                    Editable = false;
                    QuickEntry = false;
                }
            }
            part(TorlysItemAvailabilitySubform; TlyItemAvailabilitySubform)
            {
                ApplicationArea = All;
                Editable = false;
            }
            //             group(TSSAvailability)
            // {
            //     Caption = 'TSS Availability';
            //     part(NTNItemAvailabilitySubform; "NTN Item Availability")
            //     {
            //         ApplicationArea = All;
            //         Enabled = true;
            //         SubPageLink = "No." = field(Item."No.");
            //         // UpdatePropagation = Both;
            //         Editable = false;
            //     }
            // }
            group(PricingAll)
            {
                Caption = 'Pricing - CA';
                grid(PricingCA1)
                {
                    group(MGR1CA1)
                    {
                        Caption = 'MGR1 - CA';
                        field(MGR1CA2; GetMGR1CA)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR1 - CA';
                            ToolTip = 'MGR1 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR2CA1)
                    {
                        Caption = 'MGR2 - CA';
                        field(MGR2CA2; GetMGR2CA)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR2 - CA';
                            ToolTip = 'MGR2 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR3CA1)
                    {
                        Caption = 'MGR3 - CA';
                        field(MGR3CA2; GetMGR3CA)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR3 - CA';
                            ToolTip = 'MGR3 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM1CA1)
                    {
                        Caption = 'TM1 - CA';
                        field(TM1CA2; GetTM1CA)
                        {
                            ApplicationArea = All;
                            Caption = 'TM1 - CA';
                            ToolTip = 'TM1 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM2CA1)
                    {
                        Caption = 'TM2 - CA';
                        field(TM2CA2; GetTM2CA)
                        {
                            ApplicationArea = All;
                            Caption = 'TM2 - CA';
                            ToolTip = 'TM2 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM3CA1)
                    {
                        Caption = 'TM3 - CA';
                        field(TM3CA2; GetTM3CA)
                        {
                            ApplicationArea = All;
                            Caption = 'TM3 - CA';
                            ToolTip = 'TM3 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM4CA1)
                    {
                        Caption = 'TM4 - CA';
                        field(TM4CA2; GetTM4CA)
                        {
                            ApplicationArea = All;
                            Caption = 'TM4 - CA';
                            ToolTip = 'TM4 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM5CA1)
                    {
                        Caption = 'TM5 - CA';
                        field(TM5CA2; GetTM5CA)
                        {
                            ApplicationArea = All;
                            Caption = 'TM5 - CA';
                            ToolTip = 'TM5 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM6CA1)
                    {
                        Caption = 'TM6 - CA';
                        field(TM6CA2; GetTM6CA)
                        {
                            ApplicationArea = All;
                            Caption = 'TM6 - CA';
                            ToolTip = 'TM6 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                }
            }
            group(PricingQC)
            {
                Caption = 'Pricing - QC';
                grid(PricingQC1)
                {
                    group(MGR1QC1)
                    {
                        Caption = 'MGR1 - QC';
                        field(MGR1QC2; GetMGR1QC)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR1 - QC';
                            ToolTip = 'MGR1 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR2QC1)
                    {
                        Caption = 'MGR2 - QC';
                        field(MGR2QC2; GetMGR2QC)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR2 - QC';
                            ToolTip = 'MGR2 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR3QC1)
                    {
                        Caption = 'MGR3';
                        field(MGR3QC2; GetMGR3QC)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR3 - QC';
                            ToolTip = 'MGR3 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM1QC1)
                    {
                        Caption = 'TM1 - QC';
                        field(TM1QC2; GetTM1QC)
                        {
                            ApplicationArea = All;
                            Caption = 'TM1 - QC';
                            ToolTip = 'TM1 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM2QC1)
                    {
                        Caption = 'TM2 - QC';
                        field(TM2QC2; GetTM2QC)
                        {
                            ApplicationArea = All;
                            Caption = 'TM2 - QC';
                            ToolTip = 'TM2 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM3QC1)
                    {
                        Caption = 'TM3 - QC';
                        field(TM3QC2; GetTM3QC)
                        {
                            ApplicationArea = All;
                            Caption = 'TM3 - QC';
                            ToolTip = 'TM3 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM4QC1)
                    {
                        Caption = 'TM4 - QC';
                        field(TM4QC2; GetTM4QC)
                        {
                            ApplicationArea = All;
                            Caption = 'TM4 - QC';
                            ToolTip = 'TM4 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM5QC1)
                    {
                        Caption = 'TM5 - QC';
                        field(TM5QC2; GetTM5QC)
                        {
                            ApplicationArea = All;
                            Caption = 'TM5 - QC';
                            ToolTip = 'TM5 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM6QC1)
                    {
                        Caption = 'TM6 - QC';
                        field(TM6QC2; GetTM6QC)
                        {
                            ApplicationArea = All;
                            Caption = 'TM6 - QC';
                            ToolTip = 'TM6 - QC';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                }
            }
            group(PricingUS)
            {
                Caption = 'Pricing - US';
                grid(PricingUS1)
                {

                    group(MGR1US1)
                    {
                        Caption = 'MGR1 - US';
                        field(MGR1US2; GetMGR1US)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR1 - US';
                            ToolTip = 'MGR1 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR2US1)
                    {
                        Caption = 'MGR2 - US';
                        field(MGR2US2; GetMGR2US)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR2 - US';
                            ToolTip = 'MGR2 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR3US1)
                    {
                        Caption = 'MGR3 - US';
                        field(MGR3US2; GetMGR3US)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR3 - US';
                            ToolTip = 'MGR3 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM1US1)
                    {
                        Caption = 'TM1 - US';
                        field(TM1US2; GetTM1US)
                        {
                            ApplicationArea = All;
                            Caption = 'TM1 - US';
                            ToolTip = 'TM1 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM2US1)
                    {
                        Caption = 'TM2 - US';
                        field(TM2US2; GetTM2US)
                        {
                            ApplicationArea = All;
                            Caption = 'TM2 - US';
                            ToolTip = 'TM2 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM3US1)
                    {
                        Caption = 'TM3 - US';
                        field(TM3US2; GetTM3US)
                        {
                            ApplicationArea = All;
                            Caption = 'TM3 - US';
                            ToolTip = 'TM3 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM4US1)
                    {
                        Caption = 'TM4 - US';
                        field(TM4US2; GetTM4US)
                        {
                            ApplicationArea = All;
                            Caption = 'TM4 - US';
                            ToolTip = 'TM4 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM5US1)
                    {
                        Caption = 'TM5 - US';
                        field(TM5US2; GetTM5US)
                        {
                            ApplicationArea = All;
                            Caption = 'TM5 - US';
                            ToolTip = 'TM5 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM6US1)
                    {
                        Caption = 'TM6 - US';
                        field(TM6US2; GetTM6US)
                        {
                            ApplicationArea = All;
                            Caption = 'TM6 - US';
                            ToolTip = 'TM6 - US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                }
            }
        }
    }

    var
        CustomerNo: Code[20];
        Customer: Record Customer;
        CustomerName: Text[100];
        CustomerPriceGroup: Code[20];
        CustomerPriceList: Code[20];
        ItemNo: Code[20];
        Item: Record Item;
        ItemDescription: Text[100];
        ItemCategory: Code[20];
        ItemPriceCode: Code[20];
        CustomerPrice: Decimal;

    procedure GetCustomerCutPrice(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        if CustomerPriceList <> '' then begin
            PriceListLine.SetFilter("Price List Code", CustomerPriceList);
            PriceListLine.SetRange("Asset No.", ItemPriceCode);
            PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
            PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
            if PriceListLine.Find('-') then
                exit(PriceListLine."Unit Price");
        end;
    end;

    procedure GetCustomerCutPriceTier(): Code[20]
    var
        PriceListLine: Record "Price List Line";
    begin
        if CustomerNo = '' then exit;
        if CustomerPriceGroup = '' then exit;

        PriceListLine.Reset();
        PriceListLine.SetFilter("Price List Code", 'TIER*');
        PriceListLine.SetFilter("Assign-to No.", CustomerPriceGroup);
        PriceListLine.SetFilter("Product No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate());
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate());
        PriceListLine.SetRange("Unit Price", GetCustomerCutPrice);
        if PriceListLine.Find('-') then
            exit(PriceListLine."Price List Code");
    end;

    procedure GetCustomerPalletPrice(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        if CustomerPriceList <> '' then begin
            PriceListLine.SetFilter("Price List Code", CustomerPriceList);
            PriceListLine.SetRange("Asset No.", ItemPriceCode);
            PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
            PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
            if PriceListLine.Find('-') then
                exit(PriceListLine."Stocking Pallet Price");
        end;
    end;

    procedure GetCustomerPalletPriceTier(): Code[20]
    var
        PriceListLine: Record "Price List Line";
    begin
        // if CustomerPriceList <> '' then begin
        //     PriceListLine.SetFilter("Price List Code", CustomerPriceList);
        //     PriceListLine.SetRange("Asset No.", ItemPriceCode);
        //     PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        //     PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        //     if PriceListLine.Find('-') then
        //         exit(PriceListLine."Full Pallet Price Tier");
        // end;
    end;

    procedure GetInsurancePrice(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'INSURANCE');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetInsurancePriceTier(): Code[20]
    var
        PriceListLine: Record "Price List Line";
    begin
        // PriceListLine.SetFilter("Price List Code", 'INSURANCE');
        // PriceListLine.SetRange("Asset No.", ItemPriceCode);
        // PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        // PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        // if PriceListLine.Find('-') then
        //     exit(PriceListLine."Unit Price Tier");
    end;

    procedure GetClearancePrice(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'CLEARANCE');
        PriceListLine.SetRange("Asset No.", ItemNo);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR1CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR1-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR2CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR2-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR3CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR3-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM1CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM1-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM2CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM2-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM3CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM3-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM4CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM4-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM5CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM5-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM6CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM6-CA');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR1QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR1-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR2QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR2-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR3QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR3-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM1QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM1-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM2QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM2-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM3QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM3-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM4QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM4-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM5QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM5-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM6QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM6-QC');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR1US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR1-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR2US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR2-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR3US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR3-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM1US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM1-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM2US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM2-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM3US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM3-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM4US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM4-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM5US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM5-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM6US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM6-US');
        PriceListLine.SetRange("Asset No.", ItemPriceCode);
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;
}