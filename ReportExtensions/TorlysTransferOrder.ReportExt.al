reportextension 50500 "TorlysTransferOrder" extends "Transfer Order"
{
    dataset
    {
        add("Transfer Header")
        {
            column(Shipment_Method_Code; "Shipment Method Code")
            {

            }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            column(EncodedText; EncodedText)
            {

            }

        }

        add("Transfer Line")
        {
            column(BinLocationLabel; BinLocationLabel)
            {

            }
            column(BinLocation; BinLocation)
            {

            }
            column(Picked; Picked)
            {

            }
            column(ToReceiveWeight; ToReceiveWeight)
            {

            }
            column(ToShipWeight; ToShipWeight)
            {

            }
            column(Qty__to_Ship; "Qty. to Ship")
            {

            }
            column(Qty__to_Ship_Case; "Qty. to Ship Case")
            {

            }
            column(Qty__to_Ship_Pallet; "Qty. to Ship Pallet")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(qty; Quantity)
            {

            }
            column(TotalWeight; TotalWeight)
            {

            }
        }


        modify("Transfer Header")
        {
            trigger OnAfterAfterGetRecord()
            var
                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";
                BarcodeStrings: Code[20];

            begin
                // Declare the barcode provider using the barcode provider interface and enum
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;

                // Declare the font using the barcode symbology enum
                BarcodeSymbology := Enum::"Barcode Symbology"::"Code39";

                // Set data string source
                BarcodeStrings := "No.";

                // Validate the input. This method is not available for 2D provider
                BarcodeFontProvider.ValidateInput(BarcodeStrings, BarcodeSymbology);

                // Encode the data string to the barcode font
                EncodedText := BarcodeFontProvider.EncodeFont(BarcodeStrings, BarcodeSymbology);
            end;
        }

        modify("Transfer Line")
        {
            trigger OnAfterPreDataItem()
            begin
                TotalWeight := 0;
            end;

            trigger OnAfterAfterGetRecord()
            begin
                If "Item No." = '' then
                    Picked := ''
                else
                    Picked := '________';

                TotalWeight := TotalWeight + ("Net Weight" * Quantity);
                ToShipWeight += ("Net Weight" * "Qty. to Ship");
                ToReceiveWeight += ("Net Weight" * "Qty. to Receive");

                BinLocation := '';
                BinLocationLabel := '';
                BinContent.Reset();
                BinContent.SetRange(BinContent."Location Code", "Transfer-from Code");
                BinContent.SetRange(BinContent."Item No.", "Transfer Line"."Item No.");
                If (BinContent.Find('-')) then begin
                    repeat
                        If StrPos(BinLocation, BinContent."Bin Code") = 0 then
                            BinLocation := CopyStr(BinLocation + ' ' + BinContent."Bin Code", 1, 100);

                    Until BinContent.Next() = 0;
                    BinLocationLabel := 'Bin(s): ';
                end;
            end;
        }
    }

    var
        BinContent: Record "Bin Content";
        BinLocation: Code[100];
        TotalWeight: Decimal;
        ToShipWeight: Decimal;
        ToReceiveWeight: Decimal;
        qty: Decimal;
        EncodedText: Text;
        Picked: Text;
        BinLocationLabel: Text;
}