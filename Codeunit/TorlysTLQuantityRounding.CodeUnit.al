codeunit 50201 TorlysTLQuantityRounding
{

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure OnBeforeValidateQuantity(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Case Quantity', false, false)]
    local procedure OnBeforeValidateQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Pallet Quantity', false, false)]
    local procedure OnBeforeValidateQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 1);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnBeforeValidateQtyToShipBase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        QuantityRoundingToCaseAndPallet(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Case', false, false)]
    local procedure OnBeforeValidateQtyToShipCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQuantityCase(Rec, xRec, 2);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Transfer Order Subform", 'OnBeforeValidateEvent', 'Qty. to Ship Pallet', false, false)]
    local procedure OnBeforeValidateQtyToShipPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
        OnChangeQuantityPallet(Rec, xRec, 2);
    end;



    procedure QuantityRoundingToCaseAndPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)
    var
        CaseQuantity: Integer;

    begin

        if CheckQtyAndCuom.Validate(Rec.Quantity, Rec."Item No.") then exit;

        // Get the Case and Pallet quantities per Unit of Measure and calculate the number of Cases from the quantity entered.
        CaseConst := GetUoMQuantity.Get(Rec."Item No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."Item No.", 'PALLET');


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

                    UpdateShip(Rec);


                end;
            //Qty. to Ship
            2:
                begin
                    CaseQuantity := QtyOfUoM.Quantity(Rec."Qty. to Ship", CaseConst);

                    // Check if Quantity entered matched CaseConst * CaseQuantity. If Not, present options to user to chose quantity that fits.
                    Rec.Quantity := QtyFits.Validate(Rec."Qty. to Ship", CaseConst, CaseQuantity);

                    // Check if the quantity is larger than a pallet size and calculate the remaining quantity after converting to pallets.
                    if Rec."Qty. to Ship" >= PalletConst then
                        Rec."Qty. to Ship Pallet" := QtyOfUoM.Quantity(Rec."Qty. to Ship", PalletConst)
                    else
                        Rec."Quantity Pallet" := 0;

                    RemainingQuantity := Rec."Qty. to Ship" - PalletConst * Rec."Qty. to Ship Pallet";

                    // If RemainingQuantity is not 0, calculate the cases that are remaining. Set Quantity Case to 0 otherwise.
                    if RemainingQuantity > 0 then
                        Rec."Qty. to Ship Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
                    else
                        Rec."Qty. to Ship Case" := 0;
                end;
        end;
    end;

    procedure OnChangeQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)

    begin

        // Get the Case and Pallet SqFt amounts for the item entered.
        CaseConst := GetUoMQuantity.Get(Rec."Item No.", 'CASE');
        PalletConst := GetUoMQuantity.Get(Rec."Item No.", 'PALLET');

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

                    UpdateShip(Rec);
                end;
            //Case Qty. to Ship
            2:
                begin
                    // Calculate the Order Quantity based on the amount of cases entered and any pallets already on the order.
                    Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");

                    // If quantity is more than a pallet, calculate the amount for a pallet and pass remainder to case count.
                    if Rec.Quantity >= PalletConst then Rec."Qty. to Ship Pallet" := QtyOfUoM.Quantity(Rec.Quantity, PalletConst);

                    RemainingQuantity := Rec.Quantity - PalletConst * Rec."Qty. to Ship Pallet";

                    // After calculating the number of Pallets, calculate the remaining cases. If no remainder, set cases to 0
                    if RemainingQuantity > 0 then
                        Rec."Qty. to Ship Case" := QtyOfUoM.Quantity(RemainingQuantity, CaseConst)
                    else
                        Rec."Qty. to Ship Case" := 0;
                end;

        end;

        Commit();


    end;

    procedure OnChangeQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; OrderType: Integer)

    begin

        // Calculate the Order quantity based on the number of Pallets entered
        PalletConst := GetUoMQuantity.Get(Rec."Item No.", 'PALLET');
        CaseConst := GetUoMQuantity.Get(Rec."Item No.", 'CASE');



        case OrderType of
            //Pallet Quantity
            1:
                begin
                    Rec.Quantity := (CaseConst * Rec."Quantity Case") + (PalletConst * Rec."Quantity Pallet");
                    UpdateShip(Rec);

                end;
            //Pallet Qty. to Ship
            2:
                Rec."Qty. to Ship" := (CaseConst * Rec."Qty. to Ship Case") + (PalletConst * Rec."Qty. to Ship Pallet");


        end;

        Commit();

    end;

    local procedure UpdateShip(var Rec: Record "Transfer Line")
    begin
        Rec."Qty. to Ship" := Rec.Quantity;
        Rec."Qty. to Ship Case" := Rec."Quantity Case";
        Rec."Qty. to Ship Pallet" := Rec."Quantity Pallet";
    end;

    local procedure UpdateToReceive(var Rec: Record "Transfer Line")
    begin
        Rec."Qty. to Receive Case" := Rec."Quantity Case";
        Rec."Qty. to Receive Pallet" := Rec."Quantity Pallet";
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
    
}