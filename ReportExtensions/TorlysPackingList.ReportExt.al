reportextension 51300 "TorlysPackingList" extends "Sales Shipment NA"
{
    dataset
    {
        modify("Sales Shipment Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                If "Shipping Agent Code" = '' then
                    Clear(ShippingAgent)
                else
                    ShippingAgent.get("Shipping Agent Code");

                TotalPieces := 0.0;
            end;
        }

        modify("Sales Shipment Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                If "No." <> '' then begin
                    Clear(TempCrossRef);
                    OriginalItemNo := TempSalesShipmentLine1."No.";
                    TempCrossRef.SetFilter("Item No.", "No.");
                    TempCrossRef.SetFilter("Reference Type", 'Reports');
                    If TempCrossRef.Find('-') then begin
                        TempSalesShipmentLine1."No." := TempCrossRef."Reference No.";
                    end;
                end;

                Clear(TempDesc3);
                If (TempSalesShipmentLine1."Item Reference No." <> '') then begin
                    Clear(TempItem);
                    TempItem.Get(TempSalesShipmentLine1."No.");
                    TempDesc3 := TempSalesShipmentLine1.Description;
                    TempSalesShipmentLine1.Description := TempItem.Description;
                    TempSalesShipmentLine1.Modify;
                end;
            end;
        }

    }

    var
        ShippingAgent: Record "Shipping Agent";
        UOMMgt: Codeunit "Unit of Measure Management";
        Item: Record Item;
        TempItem: Record Item;
        TempCrossRef: Record "Item Reference";
        SRSetup: Record "Sales & Receivables Setup";
        TempSalesShipmentLine1: Record "Sales Shipment Line";
        TaxFlag: Boolean;
        OriginalItemNo: Code[20];
        SpacePointer: Integer;
        FedBinNoTxt: Text;
        TempDesc3: Text;
        TotalPieces: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
}