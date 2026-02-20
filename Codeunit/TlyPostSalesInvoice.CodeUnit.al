codeunit 50028 TlyPostSalesInvoice
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", 'OnAfterInitFromSalesLine', '', false, false)]
    local procedure OnAfterInitFromSalesLine(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line")
    var
        Item: Record Item;
        QtyPerCase: Decimal;
        QtyPerPallet: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
        TempQuantity: Decimal;
    begin
        // quantity case and pallet dont transfer properly if invoice is  partial
        if SalesLine.Type = SalesLine.Type::Item then begin //only run check for items
            Item.Get(SalesLine."No."); //get the item record
            if Item."Compare Unit of Measure" <> '' then begin
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
                QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet        
                TempQuantity := SalesLine."Qty. to Invoice"; //store entered quantity in variable
                SalesInvLine."Quantity Pallet" := 0; //go back to 0 for when quantity is changed
                if TempQuantity >= QtyPerPallet then //check if the entered quantity is more than a full pallet
                    while TempQuantity >= QtyPerPallet do begin
                        SalesInvLine."Quantity Pallet" := SalesInvLine."Quantity Pallet" + 1; //if more than a pallet, apply pallet quantity, and keep repeating
                        TempQuantity := TempQuantity - QtyPerPallet; //how much left after applying to pallets
                    end;
                SalesInvLine."Quantity Case" := Round((TempQuantity / QtyPerCase), 1, '>'); //apply remaining amount to cases and round up
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterUpdateLastPostingNos', '', false, false)]
    local procedure OnAfterUpdateLastPostingNos(var SalesHeader: Record "Sales Header")
    begin
        // blank out the below so if backorder, the warehouse doesn't see this old information
        if SalesHeader.Invoice then begin
            SalesHeader."No. Pick Slips Printed" := 0;
            SalesHeader."Pick Slip Printed By" := '';
            SalesHeader."Pick Slip Printed Date" := 0D;
            SalesHeader."Pick Slip Printed Time" := 0T;
            SalesHeader."Picked By" := '';
            SalesHeader."Audited By" := '';
            SalesHeader."Last Shipping No." := '';
            SalesHeader."BOL No." := '';
            SalesHeader."Package Tracking No." := '';
        end;
    end;
}