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

            group(PricingAll)
            {
                Caption = 'Pricing - non QC/US';
                grid(PricingAll1)
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
                    group(MGR1All1)
                    {
                        Caption = 'MGR1';
                        field(MGR1All2; GetMGR1All)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR1 - non QC/US';
                            ToolTip = 'MGR1 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR2All1)
                    {
                        Caption = 'MGR2';
                        field(MGR2All2; GetMGR2All)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR2 - non QC/US';
                            ToolTip = 'MGR2 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(MGR3All1)
                    {
                        Caption = 'MGR3';
                        field(MGR3All2; GetMGR3All)
                        {
                            ApplicationArea = All;
                            Caption = 'MGR3 - non QC/US';
                            ToolTip = 'MGR3 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM1All1)
                    {
                        Caption = 'TM1';
                        field(TM1All2; GetTM1All)
                        {
                            ApplicationArea = All;
                            Caption = 'TM1 - non QC/US';
                            ToolTip = 'TM1 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM2All1)
                    {
                        Caption = 'TM2';
                        field(TM2All2; GetTM2All)
                        {
                            ApplicationArea = All;
                            Caption = 'TM2 - non QC/US';
                            ToolTip = 'TM2 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM3All1)
                    {
                        Caption = 'TM3';
                        field(TM3All2; GetTM3All)
                        {
                            ApplicationArea = All;
                            Caption = 'TM3 - non QC/US';
                            ToolTip = 'TM3 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM4All1)
                    {
                        Caption = 'TM4';
                        field(TM4All2; GetTM4All)
                        {
                            ApplicationArea = All;
                            Caption = 'TM4 - non QC/US';
                            ToolTip = 'TM4 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM5All1)
                    {
                        Caption = 'TM5';
                        field(TM5All2; GetTM5All)
                        {
                            ApplicationArea = All;
                            Caption = 'TM5 - non QC/US';
                            ToolTip = 'TM5 - non QC/US';
                            Editable = false;
                            ShowCaption = false;
                        }
                    }
                    group(TM6All1)
                    {
                        Caption = 'TM6';
                        field(TM6All2; GetTM6All)
                        {
                            ApplicationArea = All;
                            Caption = 'TM6 - non QC/US';
                            ToolTip = 'TM6 - non QC/US';
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
        exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR1All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR1');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR2All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR2');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR3All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR3');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM1All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM1');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM2All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM2');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM3All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM3');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM4All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM4');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM5All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM5');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM6All(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM6');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR1QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR1-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR2QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR2-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR3QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR3-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM1QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM1-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM2QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM2-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM3QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM3-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM4QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM4-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM5QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM5-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM6QC(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM6-QC');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR1US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR1-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR2US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetRange("Price List Code", 'TIER-MGR2-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetMGR3US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-MGR3-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM1US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM1-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM2US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM2-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM3US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM3-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM4US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM4-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM5US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM5-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;

    procedure GetTM6US(): Decimal
    var
        PriceListLine: Record "Price List Line";
    begin
        PriceListLine.SetFilter("Price List Code", 'TIER-TM6-US');
        PriceListLine.SetRange("Asset No.", Rec."Sales Price Code");
        if PriceListLine.Find('-') then
            exit(PriceListLine."Unit Price");
    end;
}