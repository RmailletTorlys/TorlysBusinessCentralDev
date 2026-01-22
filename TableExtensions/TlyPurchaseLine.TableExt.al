tableextension 50039 TlyPurchaseLine extends "Purchase Line"
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
                    Rec.Validate(Rec."Direct Unit Cost"); // need this to update cost
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
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;

            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    Rec.Validate(Rec.Quantity, ((QtyPerPallet * Rec."Quantity Pallet" + QtyPerCase * Rec."Quantity Case")) / Rec."Qty. per Unit of Measure");
                    Rec.Validate(Rec."Direct Unit Cost"); // need this to update cost
                end;
            end;
        }

        field(50003; "Qty. to Receive Case"; Integer)
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
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    TempQuantity := Rec."Qty. to Receive Case" * QtyPerCase; //how many SF make up the case quantity entered
                    if TempQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Qty. to Receive Pallet" := Rec."Qty. to Receive Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Qty. to Receive Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                    Rec.Validate(Rec."Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50004; "Qty. to Receive Pallet"; Integer)
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
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    Rec.Validate(Rec."Qty. to Receive", ((QtyPerPallet * Rec."Qty. to Receive Pallet") + (QtyPerCase * Rec."Qty. to Receive Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50005; "Return Qty. to Ship Case"; Integer)
        {
            Caption = 'Return Qty. to Ship Case';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                TempQuantity: Decimal;
            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    TempQuantity := Rec."Return Qty. to Ship Case" * QtyPerCase; //how many SF make up the case quantity entered
                    if TempQuantity >= QtyPerPallet then  //check if the entered quantity is more than a full pallet
                        while TempQuantity >= QtyPerPallet do begin
                            Rec."Return Qty. to Ship Pallet" := Rec."Return Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                            TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                        end;
                    Rec."Return Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases            
                    Rec.Validate(Rec."Return Qty. to Ship", ((QtyPerPallet * Rec."Return Qty. to Ship Pallet") + (QtyPerCase * Rec."Return Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50006; "Return Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Return Qty. to Ship Pallet';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;

            begin
                if Rec.Type = Rec.Type::Item then begin //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                    QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
                    Rec.Validate(Rec."Return Qty. to Ship", ((QtyPerPallet * Rec."Return Qty. to Ship Pallet") + (QtyPerCase * Rec."Return Qty. to Ship Case")) / Rec."Qty. per Unit of Measure");
                end;
            end;
        }

        field(50007; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = TlyBookingInfo;
        }

        field(50008; "SH BOL No."; Code[20])
        {
            Caption = 'SH BOL No.';
            DataClassification = CustomerContent;
        }

        field(50009; "Previous ETA"; Date)
        {
            Caption = 'Previous ETA';
            DataClassification = CustomerContent;
        }

        field(50010; "Possible Loading Date"; Date)
        {
            Caption = 'Possible Loading Date';
            DataClassification = CustomerContent;
        }

        field(50011; "Expected Departure Date"; Date)
        {
            Caption = 'Expected Departure Date';
            DataClassification = CustomerContent;
        }

        field(50012; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = CustomerContent;
        }

        field(50013; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }

        field(50014; "Confirmation No."; Text[20])
        {
            Caption = 'Confirmation No.';
            DataClassification = CustomerContent;
        }
        field(50015; "Quantity Linked"; Decimal)
        {
            Caption = 'Quantity Linked';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Quantity" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Line No.")));
        }
        field(50016; "Qty. to Ship Linked"; Decimal)
        {
            Caption = 'Qty. to Ship Linked';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Qty. to Ship" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Line No.")));
        }

        field(50017; "Container No."; Code[20])
        {
            Caption = 'Container No.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("TPS CMG Container Line"."Container No." where("Document No." = field("Document No."), "Document Line No." = field("Line No.")));
        }

        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
            begin
                if Rec.Type = Rec.Type::Item then begin
                Item.Get(Rec."No.");
                if Rec."Buy-from Vendor No." <> Item."Vendor No." then
                    Message('This is not the item card vendor for this item!');
                end;
            end;
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
                if Rec.Type = Rec.Type::Item THEN BEGIN //only run check for items
                    Item.Get(Rec."No."); //get the item record
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
                        // Rec.InitQtyToInvoice();
                        // IF (Rec."Qty. to Receive" * Rec.Quantity < 0) OR (ABS(Rec."Qty. to Receive") > ABS(Rec."Outstanding Quantity"))
                        // OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                        // ERROR('You cannot receive more than %1 units.', Rec."Outstanding Quantity");
                    end;
                end;
            end;
        }
        modify("Return Qty. to Ship")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                UOMMgt: Codeunit "Unit of Measure Management";
                QtyPerCase: Decimal;
                QtyPerPallet: Decimal;
                TempQuantity: Decimal;
            begin
                if Rec.Type = Rec.Type::Item THEN BEGIN //only run check for items
                    Item.Get(Rec."No."); //get the item record
                    if Item."Compare Unit of Measure" <> '' then begin
                        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                        TempQuantity := Rec."Return Qty. to Ship"; //store entered quantity in variable
                        Rec."Return Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                        if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                            while TempQuantity >= QtyPerPallet do begin
                                Rec."Return Qty. to Ship Pallet" := Rec."Return Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                                TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                            end;
                        Rec."Return Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                        Rec."Return Qty. to Ship" := ((QtyPerPallet * Rec."Return Qty. to Ship Pallet") + (QtyPerCase * Rec."Return Qty. to Ship Case")) / Rec."Qty. per Unit of Measure";
                        // Rec."Return Qty. to Ship (Base)" := Rec.CalcBaseQty(Rec."Return Qty. to Ship", Rec.FieldCaption(Rec."Return Qty. to Ship"), Rec.FieldCaption(Rec."Return Qty. to Ship (Base)"));
                        // Rec.InitQtyToInvoice();
                        // IF (Rec."Return Qty. to Ship" * Rec.Quantity < 0) OR (ABS(Rec."Return Qty. to Ship") > ABS(Rec."Outstanding Quantity"))
                        // OR (Rec.Quantity * Rec."Outstanding Quantity" < 0) THEN
                        // ERROR('You cannot receive more than %1 units.', Rec."Outstanding Quantity");
                    end;
                end;
            end;
        }


    }
    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnValidateQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    // begin
    // end;

    // local procedure UpdateDirectUnitCostByField(CalledByFieldNo: Integer)
    // var
    //     BlanketOrderPurchaseLine: Record "Purchase Line";
    //     PriceCalculation: Interface "Price Calculation";
    //     IsHandled: Boolean;
    //     ShouldExit: Boolean;
    // begin
    //     if not IsPriceCalcCalledByField(CalledByFieldNo) then
    //         exit;

    //     IsHandled := false;
    //     // OnBeforeUpdateDirectUnitCost(Rec, xRec, CalledByFieldNo, CurrFieldNo, IsHandled);
    //     if IsHandled then
    //         exit;

    //     if (CurrFieldNo <> 0) and IsProdOrder() then
    //         UpdateAmounts();

    //     ShouldExit := ((CalledByFieldNo <> CurrFieldNo) and (CurrFieldNo <> 0)) or IsProdOrder();
    //     // OnUpdateDirectUnitCostByFieldOnAfterCalcShouldExit(Rec, xRec, CalledByFieldNo, CurrFieldNo, ShouldExit);
    //     if ShouldExit then
    //         exit;

    //     case Type of
    //         Type::"G/L Account",
    //         Type::Item,
    //         Type::Resource:
    //             begin
    //                 GetPurchHeader();
    //                 IsHandled := false;
    //                 // OnUpdateDirectUnitCostOnBeforeFindPrice(PurchHeader, Rec, CalledByFieldNo, CurrFieldNo, IsHandled, xRec);
    //                 if not IsHandled then
    //                     if not BlanketOrderIsRelated(BlanketOrderPurchaseLine) then begin
    //                         GetPriceCalculationHandler(PurchHeader, PriceCalculation);
    //                         if not ("Copied From Posted Doc." and IsCreditDocType()) then begin
    //                             PriceCalculation.ApplyPrice(CalledByFieldNo);
    //                             PriceCalculation.ApplyDiscount();
    //                         end;
    //                         GetLineWithCalculatedPrice(PriceCalculation);
    //                     end else begin
    //                         Validate("Direct Unit Cost", BlanketOrderPurchaseLine."Direct Unit Cost");
    //                         Validate("Line Discount %", BlanketOrderPurchaseLine."Line Discount %");

    //                         // OnUpdateDirectUnitCostByFieldOnAfterSetBlanketOrderPriceFields(PurchHeader, BlanketOrderPurchaseLine, Rec, CalledByFieldNo, CurrFieldNo);
    //                     end;
    //                 if (xRec."Direct Unit Cost" <> Rec."Direct Unit Cost") or not (CalledByFieldNo in [FieldNo("Job Task No."), FieldNo("Job No.")]) then
    //                     Validate("Direct Unit Cost");
    //             end;
    //     end;
}