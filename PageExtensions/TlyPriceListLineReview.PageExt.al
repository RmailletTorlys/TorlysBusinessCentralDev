pageextension 57005 TlyPriceListLineReview extends "Price List Line Review"
{
    layout
    {
        moveafter("Source No."; "Currency Code", "Starting Date", "Ending Date", "Asset Type", "Asset No.", Description)

        addafter(Description)
        {
            field("Shipment Method Code"; Rec."Shipment Method Code")
            {
                ApplicationArea = All;
                Caption = 'Shipment Method Code';
                ToolTip = 'Shipment Method Code';
                // Visible = Rec."Price Type" = Rec."Price Type"::Purchase;
            }
            field("Cost Based On"; Rec."Cost Based On")
            {
                ApplicationArea = All;
                Caption = 'Cost Based On';
                ToolTip = 'Cost Based On';
                // Visible = Rec."Price Type" = Rec."Price Type"::Purchase;
            }
        }

        moveafter("Cost Based On"; "Unit of Measure Code", "Minimum Quantity", DirectUnitCost)

        addafter("Unit Price")
        {
            // field("Pallet Price"; Rec."Pallet Price")
            // {
            //     Caption = 'Pallet Price';
            //     ToolTip = 'Pallet Price';
            //     ApplicationArea = All;
            //     Visible = Rec."Price Type" = Rec."Price Type"::Sale;
            // }
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

        modify("Allow Line Disc.")
        {
            Visible = false;
        }

        modify("Allow Invoice Disc.")
        {
            Visible = false;
        }

        modify("Cost Factor")
        {
            Visible = false;
        }

        modify("Asset Type")
        {
            Visible = true;
        }

        modify("Asset No.")
        {
            Visible = true;
        }

        modify(Description)
        {
            Visible = true;
        }

        // modify("Minimum Quantity")
        // {
        //     Visible = Rec."Price Type" = Rec."Price Type"::Purchase;
        // }

        modify("Unit Price")
        {
            Visible = Rec."Price Type" = Rec."Price Type"::Sale;
        }
    }

    var
        LookupUserID: Codeunit TlyLookupUserID;
}