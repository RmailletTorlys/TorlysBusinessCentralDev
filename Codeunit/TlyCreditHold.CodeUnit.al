codeunit 50416 TlyCreditHold
{
    procedure RemoveCreditHold(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    begin
        Rec."On Hold" := '';
        Rec.Modify(true);
        // TLY-SD - 07/08/2026 - start - removed per FM
        // Rec.CalcFields("Amount Including VAT");
        // Message('Order = %1\Customer = %2\Amount = %3\Previous Credit Status = %4\New Credit Status = %5', Rec."No.", Rec."Sell-to Customer No.", Rec."Amount Including VAT", xRec."On Hold", Rec."On Hold");
        // TLY-SD - 07/08/2026 - end
    end;

    procedure PlaceOnCreditHold(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    begin
        Rec."On Hold" := 'CR';
        Rec.Modify(true);
        // TLY-SD - 07/08/2026 - start - removed per FM
        // Rec.CalcFields("Amount Including VAT");
        // Message('Order = %1\Customer = %2\Amount = %3\Previous Credit Status = %4\New Credit Status = %5', Rec."No.", Rec."Sell-to Customer No.", Rec."Amount Including VAT", xRec."On Hold", Rec."On Hold");
        // TLY-SD - 07/08/2026 - end
    end;
}

