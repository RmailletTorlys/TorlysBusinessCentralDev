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
            column(ItemNumberToPrint1; ItemNumberToPrint1)
            {

            }
        }

        modify("Purch. Inv. Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                if Type = Type::" " then begin
                    ItemNumberToPrint1 := '';
                    "Unit of Measure" := '';
                    Amount := 0;
                    "Amount Including VAT" := 0;
                    "Inv. Discount Amount" := 0;
                    Quantity := 0;
                end else
                    // if Type = Type::"G/L Account" then
                        ItemNumberToPrint1 := "No.";
            end;
        }
    }

    var
        qty: Decimal;
        ItemNumberToPrint1: text;
}