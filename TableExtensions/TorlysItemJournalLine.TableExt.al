tableextension 50083 TorlysItemJournalLine extends "Item Journal Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Quantity Case';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
                TempQuantity: Decimal;
            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                TempQuantity := Rec."Quantity Case" * QtyPerCase; //how many SF make up the case quantity entered
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                Rec."Quantity Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                Rec.Validate(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Quantity Pallet';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                Rec.Validate(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        modify(Quantity)
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
                TempQuantity: Decimal;
            begin
                Item.Get(Rec."Item No."); //get the item record
                if Item."Compare Unit of Measure" <> '' then begin
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                    TempQuantity := Rec.Quantity; //store entered quantity in variable
                    Rec."Quantity Pallet" := 0; //go back to 0 for when quantity is changed
                    if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Quantity Pallet" := Rec."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Quantity Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                    // Rec.Validate(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
                    Rec.Quantity := ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure";
                end;
            end;
        }

    }

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityPallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;
}