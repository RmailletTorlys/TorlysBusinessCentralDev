reportextension 51300 "TorlysPackingList" extends "Sales Shipment NA"
{
    dataset
    {
        modify("Sales Shipment Header")
        {

        }
    }

    var
        ShippingAgent: Record "Shipping Agent";
        UOMMgt: Codeunit "Unit of Measure Management";
        Item: Record Item;
        TempItem: Record Item;
        TempCrossRef: Record "Item Reference";
        SRSetup: Record "Sales & Receivables Setup";
        TaxFlag: Boolean;
        OriginalItemNo: Code[20];
        SpacePointer: Integer;
        FedBinNoTxt: Text;
        TempDesc3: Text;
        TotalPieces: Decimal;
        QtyPerPallet: Decimal;
        QtyPerCase: Decimal;
}