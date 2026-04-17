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
        }

        addafter(AssignToNo)
        {
            field("National PM"; Rec."National Property Management")
            {
                Caption = 'National PM';
                ApplicationArea = All;
            }

            field("National PM Brand"; Rec."National PM Brand")
            {
                Caption = 'National PM Brand';
                ApplicationArea = All;
                Editable = (Rec."National Property Management" = true);
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