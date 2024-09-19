codeunit 50202 QuantityRounding
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateEvent', 'Quantity', true, true)]
    local procedure QuantityRoundingToCaseAndPallet()
    var
        sl: Record "Sales Line";
        iuom: Record "Item Unit of Measure";
        item: Record "Item";
        remainingQuantity: Decimal;
        palletQuantity: Integer;
        caseQuantity: Integer;

    begin
        item.SetRange("No.", sl."No.");
        iuom.SetRange("Item No.", sl."No.");
        remainingQuantity := 0;
        palletQuantity := 0;
        caseQuantity := 0;

        item.Get();
        iuom.Get();

        if (item."Compare Unit of Measure" = '') then exit;
        if (item."Compare Unit of Measure" = 'EACH') then exit;

        if sl.Quantity <> 0 then begin

            iuom.SetRange(Code, 'Pallet');
            if sl.Quantity > iuom."Qty. per Unit of Measure" then begin
                palletQuantity := sl.Quantity / iuom."Qty. per Unit of Measure";
                remainingQuantity := sl.Quantity mod iuom."Qty. per Unit of Measure";
            end;

            iuom.SetRange(Code, 'Case');
            if remainingQuantity > 0 then begin
                caseQuantity := remainingQuantity / iuom."Qty. per Unit of Measure";
                remainingQuantity := remainingQuantity mod iuom."Qty. per Unit of Measure";
            end;

        end;

    end;



}