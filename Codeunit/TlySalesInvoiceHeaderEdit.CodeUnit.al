codeunit 50118 TlySalesInvoiceHeaderEdit
{
    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Inv. - Update", 'OnAfterRecordChanged', '', false, false)]
    //STEP 1 - this checks to see what is changed in the "Update Document" window
    local procedure OnAfterRecordChanged(var SalesInvoiceHeader: Record "Sales Invoice Header"; xSalesInvoiceHeader: Record "Sales Invoice Header"; var IsChanged: Boolean)
    begin
        // out of the box options
        IsChanged := (SalesInvoiceHeader."Payment Method Code" <> xSalesInvoiceHeader."Payment Method Code") or
          (SalesInvoiceHeader."Payment Reference" <> xSalesInvoiceHeader."Payment Reference") or
          (SalesInvoiceHeader."Company Bank Account Code" <> xSalesInvoiceHeader."Company Bank Account Code") or
          (SalesInvoiceHeader."CFDI Cancellation Reason Code" <> xSalesInvoiceHeader."CFDI Cancellation Reason Code") or
          (SalesInvoiceHeader."Substitution Document No." <> xSalesInvoiceHeader."Substitution Document No.") or
          (SalesInvoiceHeader."Posting Description" <> xSalesInvoiceHeader."Posting Description") or
          (SalesInvoiceHeader."Fiscal Invoice Number PAC" <> xSalesInvoiceHeader."Fiscal Invoice Number PAC") or
          (SalesInvoiceHeader."Posting Description" <> xSalesInvoiceHeader."Posting Description") or
          (SalesInvoiceHeader."Promised Pay Date" <> xSalesInvoiceHeader."Promised Pay Date") or
          (SalesInvoiceHeader."Dispute Status" <> xSalesInvoiceHeader."Dispute Status") or
          (SalesInvoiceHeader."Shipping Agent Code" <> xSalesInvoiceHeader."Shipping Agent Code") or
          (SalesInvoiceHeader."Shipping Agent Service Code" <> xSalesInvoiceHeader."Shipping Agent Service Code") or
          (SalesInvoiceHeader."Package Tracking No." <> xSalesInvoiceHeader."Package Tracking No.") or
          (SalesInvoiceHeader."Due Date" <> xSalesInvoiceHeader."Due Date") or
          (SalesInvoiceHeader."Your Reference" <> xSalesInvoiceHeader."Your Reference")
          // options we added
          or
          (SalesInvoiceHeader."Tag Name" <> xSalesInvoiceHeader."Tag Name") or
          (SalesInvoiceHeader."Salesperson Code" <> xSalesInvoiceHeader."Salesperson Code") or
          (SalesInvoiceHeader."Salesperson Commission" <> xSalesInvoiceHeader."Salesperson Commission") or
          (SalesInvoiceHeader."Salesperson Code 2" <> xSalesInvoiceHeader."Salesperson Code 2") or
          (SalesInvoiceHeader."Salesperson Commission 2" <> xSalesInvoiceHeader."Salesperson Commission 2") or
          (SalesInvoiceHeader."Salesperson Code 3" <> xSalesInvoiceHeader."Salesperson Code 3") or
          (SalesInvoiceHeader."Salesperson Commission 3" <> xSalesInvoiceHeader."Salesperson Commission 3") or
          (SalesInvoiceHeader."External Document No." <> xSalesInvoiceHeader."External Document No.")
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", 'OnOnRunOnBeforeTestFieldNo', '', false, false)]
    //STEP 2 - this executes the change and write the new values to the invoice header
    local procedure OnOnRunOnBeforeTestFieldNo(var SalesInvoiceHeader: Record "Sales Invoice Header"; SalesInvoiceHeaderRec: Record "Sales Invoice Header")
    begin
        // SalesInvoiceHeader.Reset();
        // SalesInvoiceHeader.SetRange("No.", SalesInvoiceHeader."No.");
        // if SalesInvoiceHeader.Find('-') then begin
        SalesInvoiceHeader."Tag Name" := SalesInvoiceHeaderRec."Tag Name";
        SalesInvoiceHeader."Salesperson Code" := SalesInvoiceHeaderRec."Salesperson Code";
        SalesInvoiceHeader."Salesperson Commission" := SalesInvoiceHeaderRec."Salesperson Commission";
        SalesInvoiceHeader."Salesperson Code 2" := SalesInvoiceHeaderRec."Salesperson Code 2";
        SalesInvoiceHeader."Salesperson Commission 2" := SalesInvoiceHeaderRec."Salesperson Commission 2";
        SalesInvoiceHeader."Salesperson Code 3" := SalesInvoiceHeaderRec."Salesperson Code 3";
        SalesInvoiceHeader."Salesperson Commission 3" := SalesInvoiceHeaderRec."Salesperson Commission 3";
        SalesInvoiceHeader."External Document No." := SalesInvoiceHeaderRec."External Document No.";
        // end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", 'OnBeforeUpdateCustLedgerEntryAfterSetValues', '', false, false)]
    //STEP 3 - this pulls the new value from the invoice header to send to the cust. ledger entry
    local procedure OnBeforeUpdateCustLedgerEntryAfterSetValues(var CustLedgerEntry: Record "Cust. Ledger Entry"; SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        CustLedgerEntry."External Document No." := SalesInvoiceHeader."External Document No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cust. Entry-Edit", 'OnBeforeCustLedgEntryModify', '', false, false)]
    //STEP 4 - this writes the new value to the cust. ledger entry
    local procedure OnBeforeCustLedgEntryModify(var CustLedgEntry: Record "Cust. Ledger Entry"; FromCustLedgEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgEntry.Validate("External Document No.", FromCustLedgEntry."External Document No.");
    end;
}