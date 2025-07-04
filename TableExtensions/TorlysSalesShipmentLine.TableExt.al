tableextension 50111 TorlysSalesShipmentLine extends "Sales Shipment Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Case Quantity';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Pallet Quantity';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Case Quantity to Ship';
            DataClassification = CustomerContent;

        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Ship';
            DataClassification = CustomerContent;

        }

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;


        }

        field(50007; "Qty. Received Case"; Integer)
        {
            Caption = 'Case Quantity Received';
            DataClassification = CustomerContent;


        }

        field(50008; "Qty. Received Pallet"; Integer)
        {
            Caption = 'Pallet Quantity Received';
            DataClassification = CustomerContent;

        }

        field(50009; "Sales Price Code"; Code[20])
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50010; "Default Price List"; Code[20])
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50011; "Price List"; Code[20])
        {
            Caption = 'Item Category Code';
            DataClassification = CustomerContent;
            Editable = false;

        }

        field(50012; "Override Unit Price"; Boolean)
        {
            Caption = 'Override Unit Price';
            DataClassification = CustomerContent;

        }

        field(50013; "OverrideSOUnitPriceModDate"; Date)
        {
            Caption = 'Override Unit Price Modified Date';
            DataClassification = CustomerContent;
        }

        field(50014; "OverrideSOUnitPriceModTime"; Time)
        {
            Caption = 'Override Unit Price Modified Time';
            DataClassification = CustomerContent;
        }

        field(50015; "OverrideSOUnitPriceModUserID"; Text[2048])
        {
            Caption = 'Override Unit Price Modified User ID';
            DataClassification = CustomerContent;
        }

        field(50016; "Line Amount Excl. Tax"; Decimal)
        {
            Caption = 'Line Amount Excl. Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }
    }

    trigger OnModify()
    begin
        if ((Rec.Quantity) <> (xRec.Quantity)) then
            Rec.Validate(Quantity);

    end;


    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;
}