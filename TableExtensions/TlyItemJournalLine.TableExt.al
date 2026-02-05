tableextension 50083 TlyItemJournalLine extends "Item Journal Line"
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
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;

            begin
                Item.Get(Rec."Item No."); //get the item record
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                Rec.Validate(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50003; "Qty. (Calculated) Case"; Integer)
        {
            Caption = 'Qty. (Calculated) Case';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50004; "Qty. (Calculated) Pallet"; Integer)
        {
            Caption = 'Qty. (Calculated) Pallet';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50005; "Qty. (Phys. Inventory) Case"; Integer)
        {
            Caption = 'Qty. (Phys. Inventory) Case';
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
                TempQuantity := Rec."Qty. (Phys. Inventory) Case" * QtyPerCase; //how many SF make up the case quantity entered
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        Rec."Qty. (Phys. Inventory) Pallet" := Rec."Qty. (Phys. Inventory) Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                Rec."Qty. (Phys. Inventory) Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                Rec.Validate(Rec."Qty. (Phys. Inventory)", ((QtyPerPallet * Rec."Qty. (Phys. Inventory) Pallet") + (QtyPerCase * Rec."Qty. (Phys. Inventory) Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        field(50006; "Qty. (Phys. Inventory) Pallet"; Integer)
        {
            Caption = 'Qty. (Phys. Inventory) Pallet';
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
                Rec.Validate(Rec."Qty. (Phys. Inventory)", ((QtyPerPallet * Rec."Qty. (Phys. Inventory) Pallet" + QtyPerCase * Rec."Qty. (Phys. Inventory) Case")) / Rec."Qty. per Unit of Measure");
            end;
        }

        modify("Quantity")
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

        modify("Qty. (Calculated)")
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
                    TempQuantity := Rec."Qty. (Calculated)"; //store entered quantity in variable
                    Rec."Qty. (Calculated) Pallet" := 0; //go back to 0 for when quantity is changed
                    if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Qty. (Calculated) Pallet" := Rec."Qty. (Calculated) Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Qty. (Calculated) Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                    // Rec.Validate(Rec."Qty. (Calculated)"", ((QtyPerPallet * Rec."Qty. (Calculated) Pallet") + (QtyPerCase * Rec."Qty. (Calculated) Case")) / Rec."Qty. per Unit of Measure");
                    Rec."Qty. (Calculated)" := ((QtyPerPallet * Rec."Qty. (Calculated) Pallet") + (QtyPerCase * Rec."Qty. (Calculated) Case")) / Rec."Qty. per Unit of Measure";
                end;
            end;
        }

        modify("Qty. (Phys. Inventory)")
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
                    TempQuantity := Rec."Qty. (Phys. Inventory)"; //store entered quantity in variable
                    Rec."Qty. (Phys. Inventory) Pallet" := 0; //go back to 0 for when quantity is changed
                    if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Qty. (Phys. Inventory) Pallet" := Rec."Qty. (Phys. Inventory) Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Qty. (Phys. Inventory) Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                    // Rec.Validate(Rec."Qty. (Phys. Inventory)", ((QtyPerPallet * Rec."Qty. (Phys. Inventory) Pallet") + (QtyPerCase * Rec."Qty. (Phys. Inventory) Case")) / Rec."Qty. per Unit of Measure");
                    Rec."Qty. (Phys. Inventory)" := ((QtyPerPallet * Rec."Qty. (Phys. Inventory) Pallet") + (QtyPerCase * Rec."Qty. (Phys. Inventory) Case")) / Rec."Qty. per Unit of Measure";
                end;
            end;
        }
    }
}