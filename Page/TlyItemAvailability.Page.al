page 50560 TlyItemAvailability
{
    ApplicationArea = Basic, Suite;
    UsageCategory = Lists;
    Caption = 'Item Availability';
    DataCaptionFields = "No.";
    Editable = false;
    PageType = Document;
    SourceTable = Item;
    ModifyAllowed = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'No.';
                ToolTip = 'No.';
                Editable = false;
                // trigger OnValidate()
                // begin
                //     CurrPage.Update();
                // end;
            }
            field("Description"; Rec."Description")
            {
                ApplicationArea = All;
                Caption = 'Description';
                ToolTip = 'Description';
                Editable = false;
            }
            field("Item Category Code"; Rec."Item Category Code")
            {
                ApplicationArea = All;
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                Editable = false;
            }
            field("Sales Price Code"; Rec."Sales Price Code")
            {
                ApplicationArea = All;
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                Editable = false;
            }

            part(TorlysItemAvailabilitySubform; TlyItemAvailabilitySubform)
            {
                ApplicationArea = All;
                Editable = false;
            }

            group(TSSAvailability)
            {
                Caption = 'TSS Availability';
                part(NTNItemAvailabilitySubform; "NTN Item Availability")
                {
                    ApplicationArea = All;
                    Enabled = true;
                    SubPageLink = "No." = field("No.");
                    // UpdatePropagation = Both;
                    Editable = false;
                }
            }

            group(PricingCA)
            {
                Caption = 'Pricing - CA';
                grid(PricingCA1)
                {
                    // group(InsuranceAll1)
                    // {
                    //     Caption = 'Insurance';
                    //     field(InsuranceAll2; GetInsurance)
                    //     {
                    //         ApplicationArea = All;
                    //         Caption = 'Insurance';
                    //         ToolTip = 'Insurance';
                    //         Editable = false;
                    //         ShowCaption = false;
                    //     }
                    // }
                    group(MGR1CA1)
                    {
                        Caption = 'MGR1';
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
                        Caption = 'MGR2';
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
                        Caption = 'MGR3';
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
                        Caption = 'TM1';
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
                        Caption = 'TM2';
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
                        Caption = 'TM3';
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
                        Caption = 'TM4';
                        field(TM4CA2; GetTM4CA)
                        {
                            ApplicationArea = All;
                            Caption = 'TM4 - CA';
                            ToolTip = 'TM4 - CA';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM5All1)
                    {
                        Caption = 'TM5';
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
                        Caption = 'TM6';
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
                    // group(InsuranceQC1)
                    // {
                    //     Caption = 'Insurance';
                    //     field(InsuranceQC2; GetInsurance)
                    //     {
                    //         ApplicationArea = All;
                    //         Caption = 'Insurance';
                    //         ToolTip = 'Insurance';
                    //         Editable = false;
                    //         ShowCaption = false;
                    //     }
                    // }
                    group(MGR1QC1)
                    {
                        Caption = 'MGR1';
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
                        Caption = 'MGR2';
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
                        Caption = 'TM1';
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
                        Caption = 'TM2';
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
                        Caption = 'TM3';
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
                        Caption = 'TM4';
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
                        Caption = 'TM5';
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
                        Caption = 'TM6';
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
                    // group(InsuranceUS1)
                    // {
                    //     Caption = 'Insurance';
                    //     field(InsuranceUS2; GetInsurance)
                    //     {
                    //         ApplicationArea = All;
                    //         Caption = 'Insurance';
                    //         ToolTip = 'Insurance';
                    //         Editable = false;
                    //         ShowCaption = false;
                    //     }
                    // }
                    group(MGR1US1)
                    {
                        Caption = 'MGR1';
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
                        Caption = 'MGR2';
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
                        Caption = 'MGR3';
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
                        Caption = 'TM1';
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
                        Caption = 'TM2';
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
                        Caption = 'TM3';
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
                        Caption = 'TM4';
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
                        Caption = 'TM5';
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
                        Caption = 'TM6';
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

    trigger OnAfterGetRecord()
    begin
        Rec.SetRange(Rec."No.");
        CurrPage.TorlysItemAvailabilitySubform.Page.SetItemNo(Rec);
    end;

    procedure GetInsurance(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'INSURANCE');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR1CA(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR1-CA');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
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
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        PriceListLine.SetFilter("Starting Date", '<=%1', WorkDate()); //TLY-SD - 06/22/2026 - added
        PriceListLine.SetFilter("Ending Date", '%1|>=%2', 0D, WorkDate()); //TLY-SD - 06/22/2026 - added
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;
}