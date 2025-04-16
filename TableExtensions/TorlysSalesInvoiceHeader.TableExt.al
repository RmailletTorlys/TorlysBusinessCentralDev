tableextension 50044 TorlysSalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {
        field(50001; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = "Torlys Freight Zones";

        }
    }
}