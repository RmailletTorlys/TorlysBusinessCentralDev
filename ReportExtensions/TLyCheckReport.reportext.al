reportextension 52600 "TorlysCheckReport" extends "Check (Stub/Check/Stub)"
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