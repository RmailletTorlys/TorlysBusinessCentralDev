codeunit 50227 ROToReceiveQuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', true, true)]
    local procedure OnChangeCaseQuantity(var Rec: Record "Sales Line")

    begin
        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
        Rec."Return Qty. to Receive" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Receive Case", Rec."Qty. to Receive Pallet", Rec.Quantity);

        // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
        if Rec."Return Qty. to Receive" >= PalletConst then Rec."Qty. to Receive Pallet" := QtyOfUoM.Quantity(Rec."Return Qty. to Receive", PalletConst);

        RemainingQuantity := Rec."Return Qty. to Receive" - PalletConst * Rec."Qty. to Receive Pallet";

        // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
        if RemainingQuantity > 0 then
            Rec."Qty. to Receive Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
        else
            Rec."Qty. to Receive Case" := 0;

        UpdateToInvoice(Rec);

    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', true, true)]
    local procedure OnChangePalletQuantity(var Rec: Record "Sales Line")

    begin
        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        Rec."Return Qty. to Receive" := CheckQtyAndCuom.CheckQty(CaseConst, PalletConst, Rec."Qty. to Receive Case", Rec."Qty. to Receive Pallet", Rec.Quantity);
        UpdateToInvoice(Rec);
    end;

    local procedure UpdateToInvoice(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Invoice" := Rec.Quantity;
    end;

    var
        GetUoMQuantity: Codeunit GetUnitOfMeasureQuantity;
        CheckQtyAndCuom: Codeunit CheckQtyAndCompareUoM;
        QtyOfUoM: Codeunit QtyOfUnitOfMeasure;
        QtyFits: Codeunit QuantityFitsInCase;
        PalletConst: Decimal;
        CaseConst: Decimal;
        RemainingQuantity: Decimal;

}