codeunit 50119 TlySalesCrMemoHeaderEdit
{
    [EventSubscriber(ObjectType::Page, Page::"Pstd. Sales Cr. Memo - Update", 'OnAfterRecordChanged', '', false, false)]
    local procedure OnAfterRecordChanged(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; xSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var IsChanged: Boolean)
    begin
        IsChanged := (SalesCrMemoHeader."Tag Name" <> xSalesCrMemoHeader."Tag Name") or
        (SalesCrMemoHeader."Salesperson Code" <> xSalesCrMemoHeader."Salesperson Code") or
        (SalesCrMemoHeader."Salesperson Commission" <> xSalesCrMemoHeader."Salesperson Commission") or
          (SalesCrMemoHeader."Salesperson Code 2" <> xSalesCrMemoHeader."Salesperson Code 2") or
          (SalesCrMemoHeader."Salesperson Commission 2" <> xSalesCrMemoHeader."Salesperson Commission 2") or
          (SalesCrMemoHeader."Salesperson Code 3" <> xSalesCrMemoHeader."Salesperson Code 3") or
          (SalesCrMemoHeader."Salesperson Commission 3" <> xSalesCrMemoHeader."Salesperson Commission 3")
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Credit Memo Hdr. - Edit", 'OnBeforeSalesCrMemoHeaderModify', '', false, false)]
    procedure OnBeforeSalesCrMemoHeaderModify(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; FromSalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        SalesCrMemoHeader.Reset();
        SalesCrMemoHeader.SetRange("No.", SalesCrMemoHeader."No.");
        if SalesCrMemoHeader.Find('-') then begin
            SalesCrMemoHeader."Tag Name" := FromSalesCrMemoHeader."Tag Name";
            SalesCrMemoHeader."Salesperson Code" := FromSalesCrMemoHeader."Salesperson Code";
            SalesCrMemoHeader."Salesperson Commission" := FromSalesCrMemoHeader."Salesperson Commission";
            SalesCrMemoHeader."Salesperson Code 2" := FromSalesCrMemoHeader."Salesperson Code 2";
            SalesCrMemoHeader."Salesperson Commission 2" := FromSalesCrMemoHeader."Salesperson Commission 2";
            SalesCrMemoHeader."Salesperson Code 3" := FromSalesCrMemoHeader."Salesperson Code 3";
            SalesCrMemoHeader."Salesperson Commission 3" := FromSalesCrMemoHeader."Salesperson Commission 3";
        end;
    end;
}