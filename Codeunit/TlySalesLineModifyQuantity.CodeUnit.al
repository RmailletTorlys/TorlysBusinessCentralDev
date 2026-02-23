codeunit 50101 "TlySalesLineModifyQuantity"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnBeforeQuantityOnAfterValidate', '', true, false)]
    local procedure OnBeforeQuantityOnAfterValidate(var SalesLine: Record "Sales Line"; var xSalesLine: Record "Sales Line")
    begin
        isPickSlipPrinted(SalesLine);
    end;



    local procedure isPickSlipPrinted(var SalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
    begin
        if SalesLine."Document Type" = SalesLine."Document Type"::Order then begin
            SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");

            if SalesHeader."No. Pick Slips Printed" > 0 then begin
                Message('The Pick Slip has already been printed for this order. Please contact the warehouse to advise of the modification and ensure the Pick Slip is reprinted to reflect the change in quantity.');
                if not SalesHeader."Temporary Posting Hold" then begin
                    SalesHeader."Temporary Posting Hold" := true;
                    SalesHeader.Modify(true);
                end;
            end
        end;
    end;
}