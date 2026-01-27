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

        modify("Variant Code")
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
    }
}