reportextension 50800 "TorlysReturnOrder" extends "Return Authorization"
{
    dataset
    {
        add("Sales Header")
        {
            column(Reason_Code; "Reason Code")
            {

            }
        }

        add("Sales line")
        {
            column(TempDesc3; TempDesc3)
            {

            }
            column(itemcrossref; "Item Reference No.")
            {

            }
            column(quantity; Quantity)
            {

            }
            column(qtycase; "Quantity Case")
            {

            }
            column(qtypallet; "Quantity Pallet")
            {

            }
            column(unitpricetoprint; unitpricetoprint)
            {

            }
            column(recCaseQty; recCaseQty)
            {

            }
            column(recPalletQty; recPalletQty)
            {

            }
            column(returnqtyreceived; "Return Qty. Received")
            {

            }
        }

        modify("Sales Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                CLEAR(TempDesc3);
                if ("Item Reference No." <> '') then begin
                    clear(ItemTemp);
                    ItemTemp.get("No.");
                    TempDesc3 := Description;
                    Description := ItemTemp.Description;
                    Modify();
                end;

                If Type = Type::" " then begin
                    "No." := '';
                    "Unit of Measure" := '';
                    "Line Amount" := 0;
                    "Inv. Discount Amount" := 0;
                    Quantity := 0;
                end else
                    if type = type::"G/L Account" then
                        "No." := '';

                TaxAmount := "Amount Including VAT" - Amount;
                If TaxAmount <> 0 then begin
                    TaxFlag := True;
                    TaxLiable := Amount;
                end else begin
                    TaxFlag := false;
                    TaxLiable := 0;
                end;


                amountexclusivedisc := "Line Amount";

                If quantity = 0 then
                    unitpricetoprint := 0
                else
                    unitpricetoprint := round(amountexclusivedisc / quantity, 0.01);

                if Type = Type::Item then begin
                    ItemCaseUOM.get("No.", 'Case');
                    ItemPalletUOM.get("No.", 'Pallet');
                    recCaseQty := Round((("Return Qty. Received" - (ItemPalletUOM."Qty. per Unit of Measure"
                                  * (Round("Return Qty. Received" / ItemPalletUOM."Qty. per Unit of Measure", 1, '<'))))
                                  / ItemCaseUOM."Qty. per Unit of Measure"), 1, '<');
                    recPalletQty := Round("Return Qty. Received" / ItemPalletUOM."Qty. per Unit of Measure", 1, '<');
                end;

                If "Gen. Bus. Posting Group" = 'MOULDINGS' then begin
                    Quantity := 0;
                    "Quantity Case" := 0;
                    "Quantity Pallet" := 0;
                    "Return Qty. to Receive" := 0;
                    "Return Qty. to Receive Case" := 0;
                    "Return Qty. to Receive Pallet" := 0;
                end;

                If "Gen. Bus. Posting Group" = 'MQ MOULDINGS' then begin
                    Quantity := 0;
                    "Quantity Case" := 0;
                    "Quantity Pallet" := 0;
                    "Return Qty. to Receive" := 0;
                    "Return Qty. to Receive Case" := 0;
                    "Return Qty. to Receive Pallet" := 0;
                end;

                If "Gen. Bus. Posting Group" = 'SS MOULDINGS' then begin
                    Quantity := 0;
                    "Quantity Case" := 0;
                    "Quantity Pallet" := 0;
                    "Return Qty. to Receive" := 0;
                    "Return Qty. to Receive Case" := 0;
                    "Return Qty. to Receive Pallet" := 0;
                end;

                SRSetup.get();
            end;
        }
    }

    var

        ItemTemp: Record "Item";
        ItemCaseUOM: Record "Item Unit of Measure";
        ItemPalletUOM: Record "Item Unit of Measure";
        SalesLineTemp: Record "Sales Line";
        SRSetup: Record "Sales & Receivables Setup";
        TaxFlag: Boolean;
        recCaseQty: Integer;
        recPalletQty: Integer;
        TempDesc3: Text;
        quantity: Decimal;
        TaxAmount: Decimal;
        TaxLiable: Decimal;
        amountexclusivedisc: Decimal;
        unitpricetoprint: Decimal;
}