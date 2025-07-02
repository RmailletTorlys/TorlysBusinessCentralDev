reportextension 50600 "TorlysPostedInvoice" extends "Purchase Invoice NA"
{
    dataset
    {
        add("Purch. Inv. Header")
        {
            column(Buy_from_Contact; "Buy-from Contact")
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }
        }

        add("Purch. Inv. Line")
        {
            column(qty; Quantity)
            {

            }
        }
    }

    var
        qty: Decimal;
}