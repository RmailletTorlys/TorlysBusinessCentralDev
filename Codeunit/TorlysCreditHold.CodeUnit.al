codeunit 50416 TorlysCreditHold
{
    procedure RemoveCreditHold(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    begin
        Rec."On Hold" := '';
        Rec.Modify(true);
        Message('Order = %1\Customer = %2\Previous Credit Status = %3\Current Credit Status = %4', Rec."No.", Rec."Sell-to Customer No.", xRec."On Hold", Rec."On Hold");
    end;

    procedure PlaceOnCreditHold(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    begin
        Rec."On Hold" := 'CR';
        Rec.Modify(true);
        Message('Order = %1\Customer = %2\Previous Credit Status = %3\Current Credit Status = %4', Rec."No.", Rec."Sell-to Customer No.", xRec."On Hold", Rec."On Hold");
    end;

    procedure RemoveCreditHoldMultiple(Rec: Record "Sales Header"; xRec: Record "Sales Header");
    begin
        Rec."On Hold" := '';
        Rec.Modify(true);
        Message('Order = %1\Customer = %2\Previous Credit Status = %3\Current Credit Status = %4', Rec."No.", Rec."Sell-to Customer No.", xRec."On Hold", Rec."On Hold");
    end;

    procedure PlaceOnCreditHoldMultiple(Rec: Record "Sales Header"; xRec: Record "Sales Header");
    begin
        Rec."On Hold" := 'CR';
        Rec.Modify(true);
        Message('Order = %1\Customer = %2\Previous Credit Status = %3\Current Credit Status = %4', Rec."No.", Rec."Sell-to Customer No.", xRec."On Hold", Rec."On Hold");
    end;
}

