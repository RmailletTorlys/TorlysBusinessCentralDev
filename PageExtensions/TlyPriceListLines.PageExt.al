pageextension 57001 TlyPriceListLines extends "Price List Lines"
{
    // SourceTableView = sorting("Source Type", "Product No.");

    layout
    {
        addafter("Unit Price")
        {
            field("Unit Price Tier"; Rec."Unit Price Tier")
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

    // views
    // {
    //     addlast
    //     {
    //         view(CRHoldPast)
    //         {
    //             Caption = 'CR Hold - Past';
    //             Filters = where("Ending Date" = filter(' '));
    //             OrderBy = ascending("Source Type", "Product No.");
    //         }
    //     }
    // }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}