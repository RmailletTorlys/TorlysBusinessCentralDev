codeunit 50119 TlySalesCrMemoHeaderEdit
{
    [EventSubscriber(ObjectType::Page, Page::"Pstd. Sales Cr. Memo - Update", 'OnAfterRecordChanged', '', false, false)]
    local procedure OnAfterRecordChanged(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; xSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var IsChanged: Boolean)
    begin
        // out of the box options
        IsChanged :=
        (SalesCrMemoHeader."Shipping Agent Code" <> xSalesCrMemoHeader."Shipping Agent Code") or
        (SalesCrMemoHeader."Shipping Agent Service Code" <> xSalesCrMemoHeader."Shipping Agent Service Code") or
        (SalesCrMemoHeader."Package Tracking No." <> xSalesCrMemoHeader."Package Tracking No.") or
        (SalesCrMemoHeader."Company Bank Account Code" <> xSalesCrMemoHeader."Company Bank Account Code") or
        (SalesCrMemoHeader."CFDI Cancellation Reason Code" <> xSalesCrMemoHeader."CFDI Cancellation Reason Code") or
        (SalesCrMemoHeader."Substitution Document No." <> xSalesCrMemoHeader."Substitution Document No.") or
        (SalesCrMemoHeader."Posting Description" <> xSalesCrMemoHeader."Posting Description")
        // options we added
        or
        (SalesCrMemoHeader."Tag Name" <> xSalesCrMemoHeader."Tag Name") or
        (SalesCrMemoHeader."Original Invoice No." <> xSalesCrMemoHeader."Original Invoice No.") or
        (SalesCrMemoHeader."Rebill Invoice No." <> xSalesCrMemoHeader."Rebill Invoice No.") or
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
        // SalesCrMemoHeader.Reset();
        // SalesCrMemoHeader.SetRange("No.", SalesCrMemoHeader."No.");
        // if SalesCrMemoHeader.Find('-') then begin
        SalesCrMemoHeader."Tag Name" := FromSalesCrMemoHeader."Tag Name";
        SalesCrMemoHeader."Original Invoice No." := FromSalesCrMemoHeader."Original Invoice No.";
        SalesCrMemoHeader."Rebill Invoice No." := FromSalesCrMemoHeader."Rebill Invoice No.";
        SalesCrMemoHeader."Salesperson Code" := FromSalesCrMemoHeader."Salesperson Code";
        SalesCrMemoHeader."Salesperson Commission" := FromSalesCrMemoHeader."Salesperson Commission";
        SalesCrMemoHeader."Salesperson Code 2" := FromSalesCrMemoHeader."Salesperson Code 2";
        SalesCrMemoHeader."Salesperson Commission 2" := FromSalesCrMemoHeader."Salesperson Commission 2";
        SalesCrMemoHeader."Salesperson Code 3" := FromSalesCrMemoHeader."Salesperson Code 3";
        SalesCrMemoHeader."Salesperson Commission 3" := FromSalesCrMemoHeader."Salesperson Commission 3";
        // end;
    end;
}