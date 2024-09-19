codeunit 50201 UnitOfMeasureConvert
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeValidateEvent', 'Quantity', true, true)]
    local procedure CheckAndConvertQuantityOnQuantityChange(Rec: Record "Sales Line")
    var
        Options: Text[30];
        Selected: Integer;
        ValueToPost: Decimal;
        Remainder: Decimal;
        Text000Lbl: Label 'Keep Amount, Change Amount';
        Text001Lbl: Label 'Amount is not even. Please select an action.';

    begin
        Options := Text000Lbl;
        Remainder := Rec."Quantity" mod 2;
        ValueToPost := 0;

        if (Rec."Quantity" mod 2 > 0) then begin
            Selected := Dialog.StrMenu(Options, 1, Text001Lbl);
            if (Selected = 1) then
                ValueToPost := Rec."Quantity"
            else
                ValueToPost := Rec."Quantity" - Remainder;
        end;

        Rec."Quantity" := ValueToPost;
    end;


}