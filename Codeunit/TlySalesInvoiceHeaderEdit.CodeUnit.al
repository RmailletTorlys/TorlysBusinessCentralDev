codeunit 50118 TlySalesInvoiceHeaderEdit
{
    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Inv. - Update", 'OnAfterRecordChanged', '', false, false)]
    local procedure OnAfterRecordChanged(var SalesInvoiceHeader: Record "Sales Invoice Header"; xSalesInvoiceHeader: Record "Sales Invoice Header"; var IsChanged: Boolean)
    begin
        IsChanged := (SalesInvoiceHeader."Tag Name" <> xSalesInvoiceHeader."Tag Name") or
        (SalesInvoiceHeader."Salesperson Code" <> xSalesInvoiceHeader."Salesperson Code") or
        (SalesInvoiceHeader."Salesperson Commission" <> xSalesInvoiceHeader."Salesperson Commission") or
          (SalesInvoiceHeader."Salesperson Code 2" <> xSalesInvoiceHeader."Salesperson Code 2") or
          (SalesInvoiceHeader."Salesperson Commission 2" <> xSalesInvoiceHeader."Salesperson Commission 2") or
          (SalesInvoiceHeader."Salesperson Code 3" <> xSalesInvoiceHeader."Salesperson Code 3") or
          (SalesInvoiceHeader."Salesperson Commission 3" <> xSalesInvoiceHeader."Salesperson Commission 3")
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", 'OnOnRunOnBeforeTestFieldNo', '', false, false)]
    local procedure OnOnRunOnBeforeTestFieldNo(var SalesInvoiceHeader: Record "Sales Invoice Header"; SalesInvoiceHeaderRec: Record "Sales Invoice Header")
    begin
        SalesInvoiceHeader.Reset();
        SalesInvoiceHeader.SetRange("No.", SalesInvoiceHeader."No.");
        if SalesInvoiceHeader.Find('-') then begin
            SalesInvoiceHeader."Tag Name" := SalesInvoiceHeaderRec."Tag Name";
            SalesInvoiceHeader."Salesperson Code" := SalesInvoiceHeaderRec."Salesperson Code";
            SalesInvoiceHeader."Salesperson Commission" := SalesInvoiceHeaderRec."Salesperson Commission";
            SalesInvoiceHeader."Salesperson Code 2" := SalesInvoiceHeaderRec."Salesperson Code 2";
            SalesInvoiceHeader."Salesperson Commission 2" := SalesInvoiceHeaderRec."Salesperson Commission 2";
            SalesInvoiceHeader."Salesperson Code 3" := SalesInvoiceHeaderRec."Salesperson Code 3";
            SalesInvoiceHeader."Salesperson Commission 3" := SalesInvoiceHeaderRec."Salesperson Commission 3";
        end;
    end;
}