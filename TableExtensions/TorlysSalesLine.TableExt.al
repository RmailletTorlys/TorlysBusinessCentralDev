tableextension 50037 TorlysSalesLine extends "Sales Line"
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
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
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
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    Rec.Validate(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Qty. to Ship Case';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
                TempQuantity: Decimal;
            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    TempQuantity := Rec."Qty. to Ship Case" * QtyPerCase; //how many SF make up the case quantity entered
                    if TempQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Qty. to Ship Pallet" := Rec."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                    Rec.Validate(Rec."Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Qty. to Ship Pallet';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    Rec.Validate(Rec."Qty. to Ship", ((QtyPerPallet * Rec."Qty. to Ship Pallet") + (QtyPerCase * Rec."Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50005; "Return Qty. to Receive Case"; Integer)
        {
            Caption = 'Return Qty. to Receive Case';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
                TempQuantity: Decimal;
            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    TempQuantity := Rec."Return Qty. to Receive Case" * QtyPerCase; //how many SF make up the case quantity entered
                    if TempQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Return Qty. to Receive Pallet" := Rec."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Return Qty. to Receive Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                    Rec.Validate(Rec."Return Qty. to Receive", ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50006; "Return Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Return Qty. to Receive Pallet';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    Rec.Validate(Rec."Return Qty. to Receive", ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
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
            TableRelation = "Transfer Header";
        }
        field(50019; "Transfer Order Line No."; Integer)
        {
            Caption = 'Transfer Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Transfer Line"."Line No." where("Document No." = field("Transfer Order No."));
        }

        field(50020; "Linked Purchase Order No."; Code[20])
        {
            Caption = 'Linked Purchase Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));
        }
        field(50021; "Linked Purch. Order Line No."; Integer)
        {
            Caption = 'Linked Purch. Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Purchase Line"."Line No." where("Document Type" = const(Order), "Document No." = field("Linked Purchase Order No."));
        }
        field(50022; "Linked Transfer Order No."; Code[20])
        {
            Caption = 'Linked Transfer Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Transfer Header";
        }
        field(50023; "Linked Transfer Order Line No."; Integer)
        {
            Caption = 'Linked Transfer Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Transfer Line"."Line No." where("Document No." = field("Linked Transfer Order No."));
        }
        field(50024; "Master Project Order No."; Code[20])
        {
            Caption = 'Master Project Order No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Sales Header"."No." where("Order Type" = const('MASTER PROJECT ORDER'));
        }

        field(50025; "Master Project Order Line No."; Integer)
        {
            Caption = 'Master Project Order Line No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Sales Line"."Line No." where("Document No." = field("Master Project Order No."));
        }

        field(50026; "MPO Qty. on Sales Order"; Decimal)
        {
            Caption = 'MPO Qty. on Sales Order';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Quantity" where("Master Project Order No." = field("Master Project Order No."), "Master Project Order Line No." = field("Master Project Order Line No.")));
        }
        field(50027; "MPO Quantity Invoiced"; Decimal)
        {
            Caption = 'MPO Quantity Invoiced';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Invoice Line"."Quantity" where("Master Project Order No." = field("Master Project Order No."), "Master Project Order Line No." = field("Master Project Order Line No.")));
        }
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                SalesHeader: Record "Sales Header";
            begin
                SalesHeader.Get(Rec."Document Type", Rec."Document No.");
                if ("Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]) and (SalesHeader."External Document No." = '') then
                    Error('You must enter the Original Invoice No. before entering items.');
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
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
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
                        // Rec.VALIDATE(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
                        Rec.Quantity := ((QtyPerPallet * Rec."Quantity Pallet") + (QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure";
                    end;
                end;
            end;
        }
        modify("Qty. to Ship")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
                TempQuantity: Decimal;
            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
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
                        // Rec.InitQtyToInvoice();
                        // if (Rec."Qty. to Ship" * Rec.Quantity < 0) or (ABS(Rec."Qty. to Ship") > ABS(Rec."Outstanding Quantity"))
                        // or (Rec.Quantity * Rec."Outstanding Quantity" < 0) then
                        // Error('You cannot ship more than %1 units.', Rec."Outstanding Quantity");
                    end;
                end;
            end;
        }
        modify("Return Qty. to Receive")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                UOMMgt: Codeunit "Unit of Measure Management";
                TempQuantity: Decimal;
            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    if Item."Compare Unit of Measure" <> '' then begin
                        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                        TempQuantity := Rec."Return Qty. to Receive"; //store entered quantity in variable
                        Rec."Return Qty. to Receive Pallet" := 0; //go back to 0 for when quantity is changed
                        if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                            while TempQuantity >= QtyPerPallet do begin
                                Rec."Return Qty. to Receive Pallet" := Rec."Return Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                                TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                            end;
                        Rec."Return Qty. to Receive Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                        Rec."Return Qty. to Receive" := ((QtyPerPallet * Rec."Return Qty. to Receive Pallet") + (QtyPerCase * Rec."Return Qty. to Receive Case")) / Rec."Qty. per Unit of Measure";
                        // Rec."Return Qty. to Receive (Base)" := Rec.CalcBaseQty(Rec."Return Qty. to Receive", Rec.FieldCaption(Rec."Return Qty. to Receive"), Rec.FieldCaption(Rec."Return Qty. to Receive (Base)"));
                        // Rec.InitQtyToInvoice();
                        // if (Rec."Return Qty. to Receive" * Rec.Quantity < 0) or (ABS(Rec."Return Qty. to Receive") > ABS(Rec."Outstanding Quantity"))
                        // or (Rec.Quantity * Rec."Outstanding Quantity" < 0) then
                        // Error('You cannot receive more than %1 units.', Rec."Outstanding Quantity");
                    end;
                end;
            end;
        }
    }



    // var
    //     EditCasePallet: Boolean;

    // trigger OnAfterGetRecord()
    // begin
    //     CheckEditCasePallet(Rec, xRec, EditCasePallet);
    // end;

    trigger OnModify()
    begin
        if ((Rec.Quantity) <> (xRec.Quantity)) then
            Rec.Validate(Quantity);
    end;

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;


}