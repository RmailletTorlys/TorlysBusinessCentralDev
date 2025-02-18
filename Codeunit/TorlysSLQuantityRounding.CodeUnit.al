codeunit 50235 "Torlys SL Quantity Rounding"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeValidateQuantity, '', false, false)]
    local procedure "OnBeforeValidateQuantity"(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; CallingFieldNo: Integer; var IsHandled: Boolean)
    begin
        QuantityRoundingToCaseAndPallet(SalesLine)
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
    local procedure "OnAfterValidatevent"(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        QuantityRoundingToCaseAndPallet(Rec)
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnValidateQuantityCase, '', false, false)]
    local procedure "OnValidateQuantityCase"(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
        // OnChangeQuantityCase(Rec, xRec, CallingFieldNo, relatedQtyFieldNo);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnValidateQuantityPallet, '', false, false)]
    local procedure "OnValidateQuantityPallet"(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
        OnChangeQuantityPallet(Rec, xRec, CallingFieldNo, relatedQtyFieldNo);
    end;


    procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Sales Line")
    var
        CaseQuantity: Integer;

    begin

        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."No.") then exit;

        // Get the Case and Pallet quantities per Unit of Measure and calculate the number of Cases from the quantity entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseQuantity := QtyOfUoM.Quantity(Rec.Quantity, CaseConst);

        // Check if Quantity entered matched CaseConst * CaseQuantity. If Not, present options to user to chose quantity that fits.
        Rec.Quantity := QtyFits.Validate(Rec.Quantity, CaseConst, CaseQuantity);

        // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
        if Rec.Quantity >= PalletConst then
            Rec."Quantity Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst)
        else
            Rec."Quantity Pallet" := 0;

        RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

        // If RemainingQuantity is not 0, calculate the cases that are remaining. Set Quantity Case to 0 otherwise.
        if RemainingQuantity > 0 then
            Rec."Quantity Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Quantity Case" := 0;


        if Rec."Document Type" = Rec."Document Type"::"Return Order" then begin
            Rec."Return Qty. to Receive" := Rec.Quantity;
            Rec."Qty. to Invoice" := Rec.Quantity;
            Rec."Qty. to Receive Case" := Rec."Quantity Case";
            Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet"
        end
        else begin
            Rec."Qty. to Ship" := Rec.Quantity;
            Rec."Qty. to Ship Case" := Rec."Quantity Case";
            Rec."Qty. to Ship Pallet" := Rec."Quantity Pallet";
            Rec."Qty. to Invoice" := Rec.Quantity;
        end;


    end;

    procedure OnChangeQuantityCase(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CallingFieldNo: Integer; RelatedQtyField: Integer)

    begin
        RecRef.Open(DATABASE::"Sales Line");
        RecRef.GetTable(Rec);

        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        QtyFieldRef := RecRef.FIELD(RelatedQtyField);
        CaseFieldRef := RecRef.FIELD(CallingFieldNo);
        CaseFieldVal := CaseFieldRef.VALUE;
        PalletFieldRef := RecRef.FIELD(CallingFieldNo + 1);
        PalletFieldVal := PalletFieldRef.VALUE;

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.

        NewQty := (CaseConst * CaseFieldVal) + (PalletConst * PalletFieldVal);

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if NewQty >= PalletConst then
            NewPalletQty := QtyOfUoM.Quantity(NewQty, PalletConst)
        else
            NewPalletQty := 0;

        RemainingQty := NewQty - newPalletQty * PalletConst;

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQty > 0 then
            NewCaseQty := QtyOfUoM.Quantity(RemainingQty, CaseConst)
        else
            NewCaseQty := 0;

        QtyFieldRef.VALUE := NewQty;
        CaseFieldRef.VALUE := NewCaseQty;
        PalletFieldRef.VALUE := NewPalletQty;

        RecRef.Modify(true);
        if NewQty <> xRec."Quantity" then
            QuantityRoundingToCaseAndPallet(Rec);

        Rec.Modify(true);


    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CallingFieldNo: Integer; RelatedQtyField: Integer)

    begin
        RecRef.Open(DATABASE::"Sales Line");
        RecRef.GetTable(Rec);
        // Get the Case and Pallet SqFt amounts for the item entered.
        QtyFieldRef := RecRef.FIELD(RelatedQtyField);
        CaseFieldRef := RecRef.FIELD(CallingFieldNo - 1);
        PalletFieldRef := RecRef.FIELD(CallingFieldNo);
        QtyField := QtyFieldRef.Name;
        CaseField := CaseFieldRef.Name;
        PalletField := PalletFieldRef.Name;
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        Message('%1, %2, %3', QtyField, CaseField, PalletField);


        NewQty := (CaseConst * CaseFieldVal) + (PalletConst * PalletFieldVal);

        RecRef.Modify(true);
        if NewQty <> xRec."Quantity" then
            QuantityRoundingToCaseAndPallet(Rec);

        Rec.Modify(true);






    end;

    var
        GetUoMQuantity: Codeunit GetUnitOfMeasureQuantity;
        CheckQtyAndCuom: Codeunit CheckQtyAndCompareUoM;
        QtyOfUoM: Codeunit QtyOfUnitOfMeasure;
        QtyFits: Codeunit QuantityFitsInCase;
        RecRef: RecordRef;
        QtyFieldRef: FieldRef;
        CaseFieldRef: FieldRef;
        PalletFieldRef: FieldRef;
        RemainingQty: Decimal;
        CaseFieldVal: Decimal;
        PalletFieldVal: Decimal;
        NewQty: Decimal;
        NewCaseQty: Integer;
        NewPalletQty: Integer;
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;
        QtyField: Text;
        CaseField: Text;
        PalletField: Text;
}