pageextension 57010 TlyGetPriceLine extends "Get Price Line"
{
    layout
    {
        addafter("Unit Price")
        {
            field("Unit Price Tier"; UnitPriceTier)
            {
                Caption = 'Unit Price Tier';
                ToolTip = 'Unit Price Tier';
                ApplicationArea = All;
                Editable = false;
            }
        }

        moveafter("Source No."; "Starting Date", "Ending Date")

        addafter("Price List Code")
        {
            field("Description"; PriceListDescription)
            {
                Caption = 'Description';
                ToolTip = 'Description';
                ApplicationArea = All;
            }
        }

        addafter("Minimum Quantity")
        {
            field("Full Pallet Price"; Rec."Stocking Pallet Price")
            {
                Caption = 'Full Pallet Price';
                ToolTip = 'Full Pallet Price';
                ApplicationArea = All;
            }
            field("Full Pallet Price Tier"; FullPalletPriceTier)
            {
                Caption = 'Full Pallet Price Tier';
                ToolTip = 'Full Pallet Price Tier';
                ApplicationArea = All;
            }
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
            }
        }

        modify("Variant Code")
        {
            Visible = false;
        }

        modify("Work Type Code")
        {
            Visible = false;
        }

        modify("Allow Invoice Disc.")
        {
            Visible = false;
        }

        modify("Allow Line Disc.")
        {
            Visible = false;
        }
    }

    trigger OnAfterGetRecord()
    var
        PriceListHeader: Record "Price List Header";
    begin
        PriceListHeader.Get(Rec."Price List Code");
        PriceListDescription := PriceListHeader.Description;

        UpdateUnitPriceTier();
        UpdateFullPalletPriceTier();
    end;

    procedure UpdateUnitPriceTier();
    var
        Customer: Record "Customer";
        PriceLine: Record "Price List Line";
    begin
        UnitPriceTier := '';

        if Rec."Assign-to No." = '' then exit; //All Customer as type
        if Rec."Assign-to No." = 'CA' then exit; //CA tiers, insurance, CA promos, buying group
        if Rec."Assign-to No." = 'QC' then exit; //QC tiers, QC promos
        if Rec."Assign-to No." = 'US' then exit; //US tiers, US promos

        Customer.Get(Rec."Assign-to No.");
        PriceLine.Reset();
        PriceLine.SetFilter("Price List Code", 'TIER*');
        PriceLine.SetFilter("Assign-to No.", Customer."Customer Price Group");
        PriceLine.SetFilter("Product No.", Rec."Product No.");
        PriceLine.SetFilter("Ending Date", '%1|>=%2', 0D, Rec."Starting Date");
        PriceLine.SetRange("Starting Date", 0D, Rec."Starting Date");
        PriceLine.SetRange("Unit Price", Rec."Unit Price");
        if PriceLine.Find('-') then begin
            UnitPriceTier := PriceLine."Price List Code";
        end else begin
            UnitPriceTier := '';
        end;
    end;

    procedure UpdateFullPalletPriceTier();
    var
        Customer: Record "Customer";
        PriceLine: Record "Price List Line";
    begin
        FullPalletPriceTier := '';

        if Rec."Assign-to No." = '' then exit; //All Customer as type
        if Rec."Assign-to No." = 'CA' then exit; //CA tiers, insurance, CA promos, buying group
        if Rec."Assign-to No." = 'QC' then exit; //QC tiers, QC promos
        if Rec."Assign-to No." = 'US' then exit; //US tiers, US promos

        Customer.Get(Rec."Assign-to No.");
        PriceLine.Reset();
        PriceLine.SetFilter("Price List Code", 'TIER*');
        PriceLine.SetFilter("Assign-to No.", Customer."Customer Price Group");
        PriceLine.SetFilter("Product No.", Rec."Product No.");
        PriceLine.SetFilter("Ending Date", '%1|>=%2', 0D, Rec."Starting Date");
        PriceLine.SetRange("Starting Date", 0D, Rec."Starting Date");
        PriceLine.SetRange("Stocking Pallet Price", Rec."Unit Price");
        if PriceLine.Find('-') then begin
            FullPalletPriceTier := PriceLine."Price List Code";
        end else begin
            FullPalletPriceTier := '';
        end;
    end;

    var
        LookupUserId: Codeunit TlyLookupUserID;
        PriceListDescription: Text[250];
        UnitPriceTier: Code[20];
        FullPalletPriceTier: Code[20];
}