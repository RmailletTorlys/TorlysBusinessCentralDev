reportextension 50900 "TorlysPostedPurchaseCreditMemo" extends "Purchase - Credit Memo"
{
    dataset
    {
        modify("Purch. Cr. Memo Hdr.")
        {
            trigger OnAfterAfterGetRecord()
            begin
                If "Currency Code" = '' then begin
                    CurrencyCode := 'CDN'
                end else begin
                    CurrencyCode := "Currency Code"
                end;
            end;
        }

        modify("Purch. Cr. Memo Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                AmountExclInvDisc := Amount + "Inv. Discount Amount";

                If Quantity = 0 then
                    unitpricetoprint := 0
                else
                    unitpricetoprint := ROUND(AmountExclInvDisc / Quantity, 0.01);
            end;
        }

        add("Purch. Cr. Memo Hdr.")
        {
            column("appliesto_Doc_Type"; "Applies-to Doc. Type")
            {

            }
            column("appliesto_Doc_No"; "Applies-to Doc. No.")
            {

            }
            column(CurrencyCode; CurrencyCode)
            {

            }
        }

        add("Purch. Cr. Memo Line")
        {
            column(unitpricetoprint; unitpricetoprint)
            {

            }
        }
    }

    var
        unitpricetoprint: Decimal;
        AmountExclInvDisc: Decimal;
        CurrencyCode: Text;
}