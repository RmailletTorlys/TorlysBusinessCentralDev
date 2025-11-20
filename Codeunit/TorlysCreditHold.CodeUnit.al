codeunit 50416 TorlysCreditHold
{
    procedure RemoveCreditHold(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    begin
        Rec."On Hold" := '';
        Rec.Modify(true);
        Rec.CalcFields("Amount Including VAT");
        Message('Order = %1\Customer = %2\Amount = %3\Previous Credit Status = %4\New Credit Status = %5', Rec."No.", Rec."Sell-to Customer No.", Rec."Amount Including VAT", xRec."On Hold", Rec."On Hold");
    end;

    procedure PlaceOnCreditHold(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    begin
        Rec."On Hold" := 'CR';
        Rec.Modify(true);
        Rec.CalcFields("Amount Including VAT");
        Message('Order = %1\Customer = %2\Amount = %3\Previous Credit Status = %4\New Credit Status = %5', Rec."No.", Rec."Sell-to Customer No.", Rec."Amount Including VAT", xRec."On Hold", Rec."On Hold");
    end;
}

