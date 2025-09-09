pageextension 50459 "TorlysSalesReceivablesSetup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Price List Nos.")
        {
            field("BoL No."; Rec."Bill of Lading Nos.")
            {
                Caption = 'Bill of Lading Nos.';
                ApplicationArea = All;
            }
        }


    }
}