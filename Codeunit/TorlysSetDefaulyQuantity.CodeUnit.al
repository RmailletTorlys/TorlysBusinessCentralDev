codeunit 50017 TorlysSetDefaultQuantity
{
    // in "Sales & Receiveable Setup" we set "Default Quantity to Ship" = blank
    // this makes Sales Order "Qty. to Ship" default to 0 (via "SetDefaultQuantity" procedure on "Sales Line" table)
    // this makes Sales Return Order "Qty. to Ship" default to 0 (via "SetDefaultQuantity" procedure on "Sales Line" table)
    // Sales Invoice "Qty. to Ship" default is handled by "InitQtyToShip"
    // Sales Credit Memo "Return Qty. to Receive" default is handled by "InitQtyToReceive"
    // "SetDefaultQuantity" runs before "InitQtyToShip/Receive" so once they get there, it is 0
    // below we have modified so if Sales Order or Return Order a G/L Account line still populates "Qty. to Ship/Receive"
    // below we have modifed for Sales Order to respect allocation rules

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeSetDefaultQuantity', '', false, false)]
    local procedure OnBeforeSetDefaultQuantity(var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    var
        SalesSetup: Record "Sales & Receivables Setup";
        Item: Record Item;
        QtyPerCase: Decimal;
        QtyPerPallet: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
        TempQuantity: Decimal;
    begin
        IsHandled := true;

        // GetSalesSetup();
        SalesSetup.Get();
        if (SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Blank) then begin
            if (SalesLine."Document Type" = SalesLine."Document Type"::Order) or (SalesLine."Document Type" = SalesLine."Document Type"::Quote) then begin
                if SalesLine."Type" = SalesLine."Type"::Item then begin
                    // want Item to poulate "Qty. to Ship" to respect allocation rules
                    if ((SalesLine."Shipment Date" - WorkDate()) >= 0) and ((SalesLine."Shipment Date" - WorkDate()) <= 45) then begin
                        // if Shipment Date is within 45 days
                        Item.Get(SalesLine."No.");
                        Item.SetFilter("Location Filter", SalesLine."Location Code");
                        Item.CalcFields(Inventory, "Qty. to Ship", "Qty. to Ship (Transfer)");
                        SalesLine."Qty. to Ship" := Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)";
                        if SalesLine."Qty. to Ship" < 0 then
                            SalesLine."Qty. to Ship" := 0;
                        if SalesLine."Qty. to Ship" > SalesLine."Outstanding Quantity" then
                            SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
                        SalesLine."Qty. to Ship (Base)" := SalesLine.CalcBaseQty(SalesLine."Qty. to Ship", SalesLine.FieldCaption(SalesLine."Qty. to Ship"), SalesLine.FieldCaption(SalesLine."Qty. to Ship (Base)"));
                        if Item."Compare Unit of Measure" <> '' then begin
                            QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                            QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                            TempQuantity := SalesLine."Qty. to Ship"; //store entered quantity in variable
                            SalesLine."Qty. to Ship Pallet" := 0; //go back to 0 for when quantity is changed
                            if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                                while TempQuantity >= QtyPerPallet do begin
                                    SalesLine."Qty. to Ship Pallet" := SalesLine."Qty. to Ship Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                                    TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                                end;
                            SalesLine."Qty. to Ship Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
                        end;
                    end else begin
                        // if Shipment Date is not within 45 days
                        SalesLine."Qty. to Ship" := 0;
                        SalesLine."Qty. to Ship (Base)" := 0;
                        SalesLine."Qty. to Ship Case" := 0; //our field
                        SalesLine."Qty. to Ship Pallet" := 0; //our field
                        SalesLine."Qty. to Invoice" := 0;
                        SalesLine."Qty. to Invoice (Base)" := 0;
                    end;
                end else begin
                    // want G/L Account to populate "Qty. to Ship/Invoice"
                    SalesLine."Qty. to Ship" := SalesLine."Outstanding Quantity";
                    SalesLine."Qty. to Ship (Base)" := SalesLine."Outstanding Qty. (Base)";
                    SalesLine."Qty. to Invoice" := SalesLine."Outstanding Quantity";
                    SalesLine."Qty. to Invoice (Base)" := SalesLine."Outstanding Qty. (Base)";
                end;
            end;
            if SalesLine."Document Type" = SalesLine."Document Type"::"Return Order" then begin
                if SalesLine."Type" = SalesLine."Type"::Item then begin
                    // want Item to poulate "Return Qty. to Receive/Invoice" to 0
                    SalesLine."Return Qty. to Receive" := 0;
                    SalesLine."Return Qty. to Receive (Base)" := 0;
                    SalesLine."Return Qty. to Receive Case" := 0; //our field
                    SalesLine."Return Qty. to Receive Pallet" := 0; //our field
                    SalesLine."Qty. to Invoice" := 0;
                    SalesLine."Qty. to Invoice (Base)" := 0;
                end else begin
                    // want G/L Account to populate "Return Qty. to Receive/Invoice" fully
                    SalesLine."Return Qty. to Receive" := SalesLine."Outstanding Quantity";
                    SalesLine."Return Qty. to Receive (Base)" := SalesLine."Outstanding Qty. (Base)";
                    SalesLine."Qty. to Invoice" := SalesLine."Outstanding Quantity";
                    SalesLine."Qty. to Invoice (Base)" := SalesLine."Outstanding Qty. (Base)";
                end;
            end;
        end;
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterSetDefaultQuantity', '', false, false)]
    // local procedure OnAfterSetDefaultQuantity(var SalesLine: Record "Sales Line"; var xSalesLine: Record "Sales Line")
    // var
    //     SalesSetup: Record "Sales & Receivables Setup";
    // begin
    //     // GetSalesSetup();
    //     SalesSetup.Get();
    //     if SalesSetup."Default Quantity to Ship" = SalesSetup."Default Quantity to Ship"::Blank then begin
    //         if (SalesLine."Document Type" = SalesLine."Document Type"::Order) or (SalesLine."Document Type" = SalesLine."Document Type"::Quote) then begin
    //             SalesLine."Qty. to Ship Case" := 0;
    //             SalesLine."Qty. to Ship Pallet" := 0;
    //         end;
    //         if SalesLine."Document Type" = SalesLine."Document Type"::"Return Order" then begin
    //             SalesLine."Return Qty. to Receive Case" := 0;
    //             SalesLine."Return Qty. to Receive Pallet" := 0;
    //         end;
    //     end;
    // end;
}