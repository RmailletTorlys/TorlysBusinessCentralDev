pageextension 57016 TlySalesPriceList extends "Sales Price List"
{
    layout
    {
        addafter(AssignToNo)
        {
            field("National Property Management"; Rec."National Property Management")
            {
                Caption = 'National Property Management';
                ApplicationArea = All;
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