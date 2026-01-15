pageextension 50460 TlyPurchPayablesSetup extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Price List Nos.")
        {
            field("Booking Nos."; Rec."Booking Nos.")
            {
                Caption = 'Booking Nos.';
                ApplicationArea = All;
            }
        }
    }
}