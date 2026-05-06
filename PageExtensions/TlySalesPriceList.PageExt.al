pageextension 57016 TlySalesPriceList extends "Sales Price List"
{
    layout
    {
        addafter(Description)
        {
            field("Price List Type"; Rec."Price List Type")
            {
                Caption = 'Price List Type';
                ApplicationArea = All;
            }
            field("National PM"; Rec."National Property Management")
            {
                Caption = 'National PM';
                ApplicationArea = All;
            }

            field("Project Builder/Brand"; Rec."Project Builder/Brand")
            {
                Caption = 'Project Builder/Brand';
                ApplicationArea = All;
                Editable = (Rec."Price List Type" = Rec."Price List Type"::Project);
            }
            field("Shared Commission"; Rec."Shared Commission")
            {
                Caption = 'Shared Commission';
                ApplicationArea = All;
            }
        }

        // moveafter("Project Builder/Brand"; SourceType, SourceNo, CurrencyCode, StartingDate, EndingDate)//, LineDefaults, AllowUpdatingDefaults, View, AmountType, Status)

        addafter(Status)
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        modify(Tax)
        {
            Visible = false;
        }

        modify(VATBusPostingGrPrice)
        {
            Visible = false;
        }

        modify(PriceIncludesVAT)
        {
            Visible = false;
        }

        modify(AllowInvoiceDisc)
        {
            Visible = false;
        }

        modify(AllowLineDisc)
        {
            Visible = false;
        }
        modify(AllowUpdatingDefaults)
        {
            Importance = Standard;
            // Visible = true;
        }

        // modify(View)
        // {
        //     Visible = false;
        // }

        // modify(LineDefaults)
        // {
        //     Visible = false;
        // }

        // modify(AmountType)
        // {
        //     Visible = true;
        // }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}