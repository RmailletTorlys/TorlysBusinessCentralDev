pageextension 50006 TorlysSalesOrder extends "Sales Order"
{
    layout
    {
        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }
    }

}