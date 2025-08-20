pageextension 50132 TorlysPostedSalesInvoice extends "Posted Sales Invoice"
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