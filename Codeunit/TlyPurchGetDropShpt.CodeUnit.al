codeunit 57076 TlyPurchGetDropShpt
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Get Drop Shpt.", 'OnCodeOnBeforeSelectSalesHeader', '', false, false)]
    local procedure OnCodeOnBeforeSelectSalesHeader(var PurchaseHeader: Record "Purchase Header"; var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        IsHandled := true;

        //below is out of the box except the 1 line noted
        SalesHeader.SetCurrentKey("Document Type", "Sell-to Customer No.");
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("Sell-to Customer No.", PurchaseHeader."Sell-to Customer No.");
        SalesHeader.SetFilter("On Hold", '<>CR'); //TLY-SD - 04/20/2026 - custom filter line added
        if (PAGE.RunModal(PAGE::"Sales List", SalesHeader) <> ACTION::LookupOK) or
           (SalesHeader."No." = '')
        then
            exit;
    end;
}