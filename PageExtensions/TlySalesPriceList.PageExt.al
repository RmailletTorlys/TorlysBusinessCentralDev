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
        }
    }
}