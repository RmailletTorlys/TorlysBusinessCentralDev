tableextension 50312 TlyPurchasesPayablesSetup extends "Purchases & Payables Setup"

{
    fields
    {
        field(50001; "Booking Nos."; Code[20])
        {
            Caption = 'Booking Nos.';
            TableRelation = "No. Series";
            ToolTip = 'Specifies the code for the number series that will be used to assign numbers to Bookings.';
        }
    }
}