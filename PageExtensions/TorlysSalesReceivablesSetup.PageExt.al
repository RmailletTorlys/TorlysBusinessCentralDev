pageextension 50459 "TorlysSalesReceivablesSetup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Price List Nos.")
        {
            field("Bill of Lading No."; Rec."Bill of Lading Nos.")
            {
                Caption = 'Bill of Lading Nos.';
                ApplicationArea = All;
            }
            field("Claims Tracking No."; Rec."Claims Tracking Nos.")
            {
                Caption = 'Claims Tracking Nos.';
                ApplicationArea = All;
            }
        }


    }
}