pageextension 50043 TorlysPostedSalesShipment extends "Posted Sales Shipment"
{
    layout
    {
        addafter("Order No.")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = Dimensions;
                ToolTip = 'Freight Zone Code';
                Lookup = true;
                LookupPageId = "Freight Zone List";
            }
        }
    }
}