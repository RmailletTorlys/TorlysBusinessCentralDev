tableextension 50113 TorlysSalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Quantity Case';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Quantity Pallet';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Qty. to Ship Case';
            DataClassification = CustomerContent;

        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Qty. to Ship Pallet';
            DataClassification = CustomerContent;

        }

        field(50005; "Return Qty. to Receive Case"; Integer)
        {
            Caption = 'Return Qty. to Receive Case';
            DataClassification = CustomerContent;
        }

        field(50006; "Return Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Return Qty. to Receive Pallet';
            DataClassification = CustomerContent;


        }

        field(50009; "Sales Price Code"; Code[20])
        {
            Caption = 'Sales Price Code';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50010; "Default Price List"; Code[20])
        {
            Caption = 'Default Price List';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50011; "Price List"; Code[20])
        {
            Caption = 'Price List';
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