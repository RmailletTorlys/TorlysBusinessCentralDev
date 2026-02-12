reportextension 50300 "TorlysPostedCreditMemo" extends "Standard Sales - Credit Memo"
{
    dataset
    {
        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                AmountExclInvDisc := Amount + "Inv. Discount Amount";

                If Quantity = 0 then
                    unitpricetoprint := 0
                else
                    unitpricetoprint := ROUND(AmountExclInvDisc / Quantity, 0.01);

                Clear(tempdesc3);
                If ("Item Reference No." <> '') then begin
                    Clear(ItemTemp);
                    ItemTemp.get("No.");
                    tempdesc3 := Description;
                    Description := ItemTemp.Description;
                    Modify();
                end;

                If Type = Type::" " then begin
                    "No." := '';
                    "Unit of Measure" := '';
                    Amount := 0;
                    "Amount Including VAT" := 0;
                    "Inv. Discount Amount" := 0;
                    Quantity := 0;
                End else
                    if Type = Type::"G/L Account" then
                        "No." := '';

                desctoprint := Description + '' + "Description 2";
            end;
        }
        modify(header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if "Pre-Assigned No. Series" = 'SCR' then begin
                    ROandPreALabel := 'Credit Memo No.';
                    roandPreassignNo := "Pre-Assigned No.";
                end else begin
                    ROandPreALabel := 'Return Order No.';
                    roandPreassignNo := "Return Order No."
                end;
            end;
        }

        add(Header)
        {
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(ROandPreALabel; ROandPreALabel)
            {

            }
            column(roandPreassignNo; roandPreassignNo)
            {

            }
            column(Original_Invoice_No_; "Original Invoice No.")
            {

            }
        }

        add(Line)
        {
            column(quantity1; "Quantity")
            {

            }
            column(unitpricetoprint; unitpricetoprint)
            {

            }
            column(tempdesc3; tempdesc3)
            {

            }
            column(Item_Reference_No_; "Item Reference No.")
            {

            }
            column(desctoprint; desctoprint)
            {

            }
        }
    }

    var
        ItemTemp: Record Item;
        quantity1: Decimal;
        unitpricetoprint: Decimal;
        AmountExclInvDisc: Decimal;
        tempdesc3: Text;
        desctoprint: Text;
        ROandPreALabel: Text;
        roandPreassignNo: text;

}