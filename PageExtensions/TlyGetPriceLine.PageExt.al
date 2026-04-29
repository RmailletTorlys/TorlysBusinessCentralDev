pageextension 57010 TlyGetPriceLine extends "Get Price Line"
{
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

    var
        LookupUserId: Codeunit TlyLookupUserID;
        PriceListDescription: Text[250];

    trigger OnAfterGetRecord()
    var
        PriceListHeader: Record "Price List Header";
    begin
        PriceListHeader.Get(Rec."Price List Code");
        PriceListDescription := PriceListHeader.Description;
    end;
}