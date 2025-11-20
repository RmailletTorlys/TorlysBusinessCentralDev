tableextension 55741 TorlysTransferLine extends "Transfer Line"
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

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Qty. to Receive Case';
            DataClassification = CustomerContent;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Qty. to Receive Pallet';
            DataClassification = CustomerContent;
        }

        field(50007; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Sales Header"."No." where("Document Type" = const(Order));
        }

        field(50008; "Sales Order Line No."; Integer)
        {
            Caption = 'Sales Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Sales Line"."Line No." where("Document No." = field("Sales Order No."));
        }
    }

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;
}