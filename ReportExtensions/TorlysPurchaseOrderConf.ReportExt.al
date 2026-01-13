reportextension 50400 "TorlysPurchaseOrderConf" extends "Standard Purchase - Order"
{
    dataset
    {
        add("Purchase Header")
        {
            column(BuyFromContact; "Buy-from Contact")
            {

            }
            column(CurrencyCodeToPrint; CurrencyCodeToPrint)
            {

            }

        }

        add("Purchase Line")
        {
            column(qtytoprint; Quantity)
            {

            }
            column(Quantity_Pallet; "Quantity Pallet")
            {

            }
            column(Quantity_Case; "Quantity Case")
            {

            }
            column(SQM2Label; SQM2Label)
            {

            }
            column(SQM2Price; SQM2Price)
            {

            }
            column(SQM2Qty; SQM2Qty)
            {

            }
            column(UnitPriceToPrint; UnitPriceToPrint)
            {

            }
            column(AmountExclInvDisc; AmountExclInvDisc)
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }

        }

        modify("Purchase Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                If "Currency Code" = '' then begin
                    glsetup1.get();
                    CurrencyCodeToPrint := glsetup1."LCY Code"
                end else
                    CurrencyCodeToPrint := "Currency Code";
            end;
        }

        modify("Purchase Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                If Type = Type::Item then
                    Item.Get("No.")
                Else
                    Clear(Item);

                If ("Buy-from Vendor No." = 'S237') OR ("Buy-from Vendor No." = 'S239') Then
                    If (Type = Type::"Item") AND (Quantity <> 0) then begin
                        SQM2Qty := "Quantity (Base)" / 10.764;
                        SQM2Price := "Line Amount" / SQM2Qty;
                        SQM2Label := '/SQM2'
                    end else begin
                        SQM2Qty := 0;
                        SQM2Price := 0;
                        SQM2Label := '';
                    end;

                If Type = Type::" " then begin
                    "No." := '';
                    "Vendor Item No." := '';
                    "Unit of Measure" := '';
                    "Line Amount" := 0;
                    "Inv. Discount Amount" := 0;
                    qtytoprint := 0;
                end;

                AmountExclInvDisc := "Line Amount";

                If Quantity = 0 then
                    UnitPriceToPrint := 0
                Else
                    UnitPriceToPrint := Round(AmountExclInvDisc / Quantity, 0.00001);
            end;
        }

    }

    var

        Item: Record Item;
        glsetup1: Record "General Ledger Setup";
        qtytoprint: Decimal;
        SQM2Qty: Decimal;
        SQM2Price: Decimal;
        AmountExclInvDisc: Decimal;
        UnitPriceToPrint: Decimal;
        SQM2Label: Text;
        CurrencyCodeToPrint: Text;

}