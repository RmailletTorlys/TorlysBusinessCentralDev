tableextension 50115 TorlysSalesCrMemoLine extends "Sales Cr.Memo Line"
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

        field(50007; "Ship-to Code"; Code[20])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50008; "Builder Description"; Text[20])
        {
            Caption = 'Builder Description';
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

        field(50016; "Discontinued Item"; Boolean)
        {
            Caption = 'Discontinued Item';
            DataClassification = CustomerContent;
        }

        field(50017; "Clearance Item"; Boolean)
        {
            Caption = 'Clearance Item';
            DataClassification = CustomerContent;
        }

        field(50018; "Transfer Order No."; Code[20])
        {
            Caption = 'Transfer Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Transfer Header";
        }
        field(50019; "Transfer Order Line No."; Integer)
        {
            Caption = 'Transfer Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Transfer Line"."Line No." where("Document No." = field("Transfer Order No."));
        }
        field(50020; "Linked Purchase Order No."; Code[20])
        {
            Caption = 'Linked Purchase Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));
        }
        field(50021; "Linked Purch. Order Line No."; Integer)
        {
            Caption = 'Linked Purch. Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Purchase Line"."Line No." where("Document Type" = const(Order),"Document No." = field("Purchase Order No."));
        }
        field(50022; "Linked Transfer Order No."; Code[20])
        {
            Caption = 'Linked Transfer Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Transfer Header";
        }
        field(50023; "Linked Transfer Order Line No."; Integer)
        {
            Caption = 'Linked Transfer Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Transfer Line"."Line No." where("Document No." = field("Transfer Order No."));
        }
        field(50024; "Master Project Order No."; Code[20])
        {
            Caption = 'Transfer Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Sales Header"."No." where("Order Type" = const('MASTER PROJECT ORDER'));
        }
        field(50025; "Master Project Order Line No."; Integer)
        {
            Caption = 'Master Project Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            // TableRelation = "Sales Line"."Line No." where("Document No." = field("Master Project Order No."));
        }

    }

    // trigger OnModify()
    // begin
    //     if ((Rec.Quantity) <> (xRec.Quantity)) then
    //         Rec.Validate(Quantity);

    // end;


    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;
}