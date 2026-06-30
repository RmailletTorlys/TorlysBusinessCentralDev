reportextension 52600 TlyCheck extends "Check (Stub/Check/Stub)"
{
    dataset
    {
        add(GenJnlLine)
        {
            column(vendor; vendor1."No.")
            {

            }
        }
    }
    var
        vendor1: Record Vendor;
}