tableextension 50103 TorlysSalesLine extends "Sales Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Case Quantity';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityCase(Rec, xRec, CurrFieldNo, 15)
            end;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Pallet Quantity';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityPallet(Rec, xRec, CurrFieldNo, 15)
            end;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Case Quantity to Ship';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityCase(Rec, xRec, CurrFieldNo, 18)
            end;

        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Ship';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityPallet(Rec, xRec, CurrFieldNo, 18)
            end;
        }

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityCase(Rec, xRec, CurrFieldNo, 5803)
            end;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityPallet(Rec, xRec, CurrFieldNo, 5803)
            end;
        }

        field(50007; "Qty. Received Case"; Integer)
        {
            Caption = 'Case Quantity Received';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityCase(Rec, xRec, CurrFieldNo, 5809)
            end;
        }

        field(50008; "Qty. Received Pallet"; Integer)
        {
            Caption = 'Pallet Quantity Received';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Rec: Record "Sales Line";
                xRec: Record "Sales Line";
            begin
                OnValidateQuantityPallet(Rec, xRec, CurrFieldNo, 5809)
            end;
        }


    }
    [IntegrationEvent(false, false)]
    local procedure OnValidateQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;
}