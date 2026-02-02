pageextension 57005 TlyPriceListLineReview extends "Price List Line Review"
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
    }
}