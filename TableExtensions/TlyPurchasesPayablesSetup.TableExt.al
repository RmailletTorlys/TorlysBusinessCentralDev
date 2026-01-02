<<<<<<< HEAD:TableExtensions/TlyPurchasesPayablesSetup.TableExt.al
tableextension 50312 TlyPurchasesPayablesSetup extends "Purchases & Payables Setup"
=======
tableextension 50312 "TorlysPurchasesPayablesSetup" extends "Purchases & Payables Setup"
>>>>>>> 5d97453bc243d6e4cb3019687424c0f4e6bb89a7:TableExtensions/TorlysPurchasesPayablesSetup.TableExt.al
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