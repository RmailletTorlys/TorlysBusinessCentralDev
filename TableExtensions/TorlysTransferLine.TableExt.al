tableextension 55741 TorlysTransferLine extends "Transfer Line"
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
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
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
                Rec."Quantity Case" := ROUND((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                Rec.Validate(Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Quantity Pallet';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;

            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                Rec.Validate(Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Qty. to Ship Case';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                TempQuantity: Decimal;
            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                TempQuantity := Rec."Qty. to Ship Case" * QtyPerCase; //how many SF make up the case quantity entered
                if TempQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                Rec."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                Rec.Validate("Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Qty. to Ship Pallet';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;

            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                Rec.Validate("Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Qty. to Receive Case';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                TempQuantity: Decimal;
            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                TempQuantity := Rec."Qty. to Receive Case" * QtyPerCase; //how many SF make up the case quantity entered
                if TempQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        Rec."Qty. to Receive Pallet" := Rec."Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                Rec."Qty. to Receive Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                Rec.Validate("Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Qty. to Receive Pallet';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;

            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                Rec.Validate(Rec."Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
            end;
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
            TableRelation = "Sales Line"."Line No." where("Document Type" = const(Order), "Document No." = field("Sales Order No."));
        }

        field(50009; "Quantity Linked"; Decimal)
        {
            Caption = 'Quantity Linked';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Quantity" where("Linked Transfer Order No." = field("Document No."), "Linked Transfer Order Line No." = field("Line No.")));
        }
        field(50010; "Qty. to Ship Linked"; Decimal)
        {
            Caption = 'Qty. to Ship Linked';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Qty. to Ship" where("Linked Transfer Order No." = field("Document No."), "Linked Transfer Order Line No." = field("Line No.")));
        }

        modify(Quantity)
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
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

        modify("Qty. to Ship")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                TempQuantity: Decimal;
            begin
                Item.Get(Rec."Item No."); //get the item record
                if Item."Compare Unit of Measure" <> '' then begin
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                    TempQuantity := Rec."Qty. to Ship"; //store entered quantity in variable
                    Rec."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                    if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                    Rec."Qty. to Ship" := ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure";
                    // Rec."Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Qty. to Ship", Rec.FieldCaption(Rec."Qty. to Ship"), Rec.FieldCaption(Rec."Qty. to Ship (Base)"));
                    // IF (Rec."Qty. to Ship" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Ship") > ABS(Rec."Outstanding Quantity"))
                    //     OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                    //     ERROR('You cannot ship more than %1 units.', Rec."Outstanding Quantity");
                end;
            end;
        }
        modify("Qty. to Receive")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                TempQuantity: Decimal;
            begin
                Item.Get(Rec."Item No."); //get the item record
                if Item."Compare Unit of Measure" <> '' then begin
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                    TempQuantity := Rec."Qty. to Receive"; //store entered quantity in variable
                    Rec."Qty. to Receive Pallet" := 0; //go back to 0 for when quantity is changed
                    if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Qty. to Receive Pallet" := Rec."Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Qty. to Receive Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                    Rec."Qty. to Receive" := ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure";
                    // Rec."Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Qty. to Receive", Rec.FieldCaption(Rec."Qty. to Receive"), Rec.FieldCaption(Rec."Qty. to Receive (Base)"));
                    // IF (Rec."Qty. to Receive" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Receive") > ABS(Rec."Qty. in Transit"))
                    // OR (Rec.Quantity * Rec."Qty. in Transit" < 0) THEN
                    // ERROR('You cannot receive more than %1 units.', Rec."Qty. in Transit");
                end;
            end;
        }
    }

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;
}