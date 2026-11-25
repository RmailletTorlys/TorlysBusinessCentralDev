pageextension 57011 TlyPurchPriceListLines extends "Purchase Price List Lines"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("Shipment Method Code"; Rec."Shipment Method Code")
            {
                ApplicationArea = All;
                Caption = 'Shipment Method Code';
                ToolTip = 'Shipment Method Code';
            }
            field("Cost Based On"; Rec."Cost Based On")
            {
                ApplicationArea = All;
                Caption = 'Cost Based On';
                ToolTip = 'Cost Based On';
            }
        }

        addafter(DirectUnitCost)
        {
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
                    // key(PK; "Price List Code", "Line No.") this is primary key of table for reference
                    Rec.SetCurrentKey("Price List Code", "Asset Type", "Asset No.", "Starting Date", "Ending Date"); //should be same at all spots
                    Rec.SetFilter("Ending Date", '%1|>%2', 0D, WorkDate());
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        // key(PK; "Price List Code", "Line No.") this is primary key of table for reference
        Rec.SetCurrentKey("Price List Code", "Asset Type", "Asset No.", "Starting Date", "Ending Date"); //should be same at all spots
    end;

    var
        LookupUserId: Codeunit TlyLookupUserID;
}