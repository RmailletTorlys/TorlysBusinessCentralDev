pageextension 57001 TlyPriceListLines extends "Price List Lines"
{
    // SourceTableView = sorting("Source Type", "Product No.");

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
            field("Full Pallet Price"; Rec."Stocking Pallet Price")
            {
                Caption = 'Full Pallet Price';
                ToolTip = 'Full Pallet Price';
                ApplicationArea = All;
            }
            field("Full Pallet Price Tier"; Rec."Full Pallet Price Tier")
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

        modify("Variant Code Lookup")
        {
            Visible = false;
        }

        modify("Work Type Code")
        {
            Visible = false;
        }
        modify(VATBusPostingGrPrice)
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

        modify("Minimum Quantity")
        {
            Visible = false;
        }

        modify("Unit of Measure Code")
        {
            Visible = false;
        }

        modify(PriceIncludesVAT)
        {
            Visible = false;
        }
    }

    actions
    {
        addlast(Processing)
        {
            action(ShowCurrent)
            {
                ApplicationArea = All;
                Caption = 'Show Current Only';
                trigger OnAction()
                begin
                    // Rec.Reset();
                    Rec.SetCurrentKey("Product No.");
                    Rec.SetFilter("Ending Date", '%1|>%2', 0D, WorkDate());
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Customer: Record "Customer";
        PriceLine: Record "Price List Line";
    begin
        if Rec."Assign-to No." = '' then exit; //All Customer as type
        if Rec."Assign-to No." = 'CA' then exit; //CA tiers, insurance, CA promos, buying group
        if Rec."Assign-to No." = 'QC' then exit; //QC tiers, QC promos
        if Rec."Assign-to No." = 'US' then exit; //US tiers, US promos

        // if Rec."Assign-to No." <> '' then begin
        Customer.Get(Rec."Assign-to No.");
        PriceLine.Reset();
        PriceLine.SetFilter("Price List Code", 'TIER*');
        PriceLine.SetFilter("Assign-to No.", Customer."Customer Price Group");
        PriceLine.SetFilter("Product No.", Rec."Product No.");
        PriceLine.SetFilter("Ending Date", '%1|>=%2', 0D, Rec."Starting Date");
        PriceLine.SetRange("Starting Date", 0D, Rec."Starting Date");
        PriceLine.SetRange("Unit Price", Rec."Unit Price");
        if PriceLine.Find('-') then
            UnitPriceTier := PriceLine."Price List Code";
        // end;
    end;

    var
        LookupUserId: Codeunit TlyLookupUserID;
        UnitPriceTier: Code[20];
}