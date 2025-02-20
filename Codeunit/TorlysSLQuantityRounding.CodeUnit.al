codeunit 50235 "Torlys SL Quantity Rounding"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateSOQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnValidateSOToShipQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 2);
    end;

    [EventSubScriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateROQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnValidateCrMemoQuantity(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;


    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnValidateSOCase(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', false, false)]
    local procedure OnValidateSOToShipCase(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 2);
    end;

    [EventSubScriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnValidateROCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubScriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Case', false, false)]
    local procedure OnValidateROToReceiveCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnValidateCrMemoCase(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnValidateSOPallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', false, false)]
    local procedure OnValidateSOToShipPallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 2);
    end;

    [EventSubScriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnValidateROPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubScriber(ObjectType::Page, Page::"Sales Return Order Subform", 'OnBeforeValidateEvent', 'Qty. to Receive Pallet', false, false)]
    local procedure OnValidateROToReceivePallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 3);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Cr. Memo Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnValidateCrMemoPallet(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;





    procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)
    var
        CaseQuantity: Integer;

    begin

        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."No.") then exit;

        // Get the Case and Pallet quantities per Unit of Measure and calculate the number of Cases from the quantity entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');


        case OrderType of
            //Quantity
            1:
                begin
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

                    case Rec."Document Type" of
                        Rec."Document Type"::Order:
                            UpdateShipAndInvoice(Rec);
                        Rec."Document Type"::"Return Order":
                            UpdateToReceive(Rec);
                    end;
                end;
            //Qty. to Ship (Base)
            2:
                begin
                    CaseQuantity := QtyOfUoM.Quantity(Rec."Qty. to Ship (Base)", CaseConst);

                    // Check if Quantity entered matched CaseConst * CaseQuantity. If Not, present options to user to chose quantity that fits.
                    Rec.Quantity := QtyFits.Validate(Rec."Qty. to Ship (Base)", CaseConst, CaseQuantity);

                    // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
                    if Rec."Qty. to Ship (Base)" >= PalletConst then
                        Rec."Qty. to Ship Pallet" := QtyOfUoM.Quantity(Rec."Qty. to Ship (Base)", PalletConst)
                    else
                        Rec."Quantity Pallet" := 0;

                    RemainingQuantity := Rec."Qty. to Ship (Base)" - PalletConst * Rec."Qty. to Ship Pallet";

                    // If RemainingQuantity is not 0, calculate the cases that are remaining. Set Quantity Case to 0 otherwise.
                    if RemainingQuantity > 0 then
                        Rec."Qty. to Ship Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
                    else
                        Rec."Qty. to Ship Case" := 0;
                end;
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)

    begin

        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');

        case OrderType of
            //Case Quantity
            1:
                begin
                    // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
                    Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

                    // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
                    if Rec.Quantity >= PalletConst then Rec."Quantity Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst);

                    RemainingQuantity := Rec.Quantity - PalletConst * Rec."Quantity Pallet";

                    // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
                    if RemainingQuantity > 0 then
                        Rec."Quantity Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
                    else
                        Rec."Quantity Case" := 0;

                    case Rec."Document Type" of
                        Rec."Document Type"::Order:
                            UpdateShipAndInvoice(Rec);
                        Rec."Document Type"::"Return Order":
                            UpdateToReceive(Rec);
                    end;
                end;
            2:
                begin
                    // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
                    Rec."Qty. to Ship (Base)" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");

                    // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
                    if Rec.Quantity >= PalletConst then Rec."Qty. to Ship Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst);

                    RemainingQuantity := Rec.Quantity - PalletConst * Rec."Qty. to Ship Pallet";

                    // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
                    if RemainingQuantity > 0 then
                        Rec."Qty. to Ship Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
                    else
                        Rec."Qty. to Ship Case" := 0;
                end;
            3:
                begin
                    // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
                    Rec."Return Qty. to Receive (Base)" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");

                    // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
                    if Rec."Return Qty. to Receive (Base)" >= PalletConst then Rec."Qty. to Receive Pallet" := QtyOfUoM.Quantity(Rec."Return Qty. to Receive (Base)", PalletConst);

                    RemainingQuantity := Rec."Return Qty. to Receive (Base)" - PalletConst * Rec."Qty. to Receive Pallet";

                    // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
                    if RemainingQuantity > 0 then
                        Rec."Qty. to Receive Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
                    else
                        Rec."Qty. to Receive Case" := 0;

                    UpdateToInvoice(Rec);
                end;

        end;

        Commit();


    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line"; OrderType: Integer)

    begin

        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."No.", 'CASE');



        case OrderType of
            1:
                begin
                    Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");

                    case Rec."Document Type" of
                        Rec."Document Type"::Order:
                            UpdateShipAndInvoice(Rec);
                        Rec."Document Type"::"Return Order":
                            UpdateToReceive(Rec);
                    end;
                end;
            2:
                Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");
            3:
                begin
                    Rec."Return Qty. to Receive" := (CaseConst * Rec."Qty. to Receive Case") + (PalletConst * Rec."Qty. to Receive Pallet");
                    UpdateToInvoice(Rec);
                end;

        end;

        Commit();

    end;

    local procedure UpdateShipAndInvoice(var Rec: Record "Sales Line")
    begin
        Rec."Qty. to Ship" := Rec.Quantity;
        Rec."Qty. to Ship Case" := Rec."Quantity Case";
        Rec."Qty. to Ship Pallet" := Rec."Quantity Pallet";
        Rec."Qty. to Invoice" := Rec.Quantity;
    end;

    local procedure UpdateToReceive(var Rec: Record "Sales Line")
    begin
        Rec."Return Qty. to Receive" := Rec.Quantity;
        Rec."Qty. to Invoice" := Rec.Quantity;
        Rec."Qty. to Receive Case" := Rec."Quantity Case";
        Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet";
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