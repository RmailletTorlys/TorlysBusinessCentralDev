codeunit 50030 TlyPostSales
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnValidatePostingAndDocumentDateOnAfterCalcPostingDateExists', '', false, false)]
    local procedure OnValidatePostingAndDocumentDateOnAfterCalcPostingDateExists(var PostingDateExists: Boolean; var ReplacePostingDate: Boolean; var ReplaceDocumentDate: Boolean; var PostingDate: Date; var SalesHeader: Record "Sales Header"; var ModifyHeader: Boolean; var VATDateExists: Boolean; var ReplaceVATDate: Boolean; var VATDate: Date)
    begin
        PostingDateExists := true;
        ReplacePostingDate := true;
        ReplaceDocumentDate := true;
        PostingDate := WorkDate();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitQtyToShip2', '', false, false)]
    local procedure OnAfterInitQtyToShip2(var SalesLine: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        //this is to not allocate quantities for partial shipments when shipping or invoicing
        if (SalesLine.Type = SalesLine.Type::Item) and (SalesLine."Document Type" = SalesLine."Document Type"::Order) then begin
            // Message('here i am running OnAfterInitQtyToShip2 from TlyPostSales');
            // Message('Round 1. QTS = %1', SalesLine."Qty. to Ship");
            SalesLine."Qty. to Ship" := 0;
            SalesLine."Qty. to Ship (Base)" := 0;
            SalesLine."Qty. to Ship Case" := 0;
            SalesLine."Qty. to Ship Pallet" := 0;
            SalesLine.Modify(true);
            // Message('Round 2. QTS = %1', SalesLine."Qty. to Ship");
        end;
    end;
}