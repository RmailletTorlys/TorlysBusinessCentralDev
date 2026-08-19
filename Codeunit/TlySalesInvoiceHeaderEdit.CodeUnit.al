codeunit 50118 TlySalesInvoiceHeaderEdit
{
    Permissions = TableData "G/L Entry" = m,
    TableData "Item Ledger Entry" = m,
    tabledata "Value Entry" = m,
    tabledata "VAT Entry" = m;

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Inv. - Update", 'OnAfterRecordChanged', '', false, false)]
    //STEP 1 - this checks to see what is changed in the "Update Document" window from the invoice page
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
    local procedure OnOnRunOnBeforeTestFieldNo(var SalesInvoiceHeader: Record "Sales Invoice Header"; SalesInvoiceHeaderRec: Record "Sales Invoice Header")
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        ValueEntry: Record "Value Entry";
    begin
        //STEP 2 - this writes the new value to the "Item Ledger Entry", need to use these parameters as the "Document No." is not there
        ItemLedgerEntry.Reset();
        ItemLedgerEntry.SetRange("Source No.", SalesInvoiceHeader."Sell-to Customer No.");
        ItemLedgerEntry.SetRange("External Document No.", SalesInvoiceHeader."External Document No.");
        ItemLedgerEntry.SetFilter("Document Type", 'Sales Shipment');
        if ItemLedgerEntry.Find('-') then begin
            repeat
                ItemLedgerEntry."External Document No." := SalesInvoiceHeaderRec."External Document No.";
                ItemLedgerEntry.Modify();
            until ItemLedgerEntry.Next() = 0;
        end;

        //STEP 3 - this writes the new value to the "Value Entry" table
        ValueEntry.Reset();
        ValueEntry.SetRange("Document No.", SalesInvoiceHeader."No.");
        if ValueEntry.Find('-') then begin
            repeat
                ValueEntry."External Document No." := SalesInvoiceHeaderRec."External Document No.";
                ValueEntry.Modify();
            until ValueEntry.Next() = 0;
        end;

        //STEP 4 - this writes the new value to the "Sales Invoice Header" table
        SalesInvoiceHeader."Tag Name" := SalesInvoiceHeaderRec."Tag Name";
        SalesInvoiceHeader."Salesperson Code" := SalesInvoiceHeaderRec."Salesperson Code";
        SalesInvoiceHeader."Salesperson Commission" := SalesInvoiceHeaderRec."Salesperson Commission";
        SalesInvoiceHeader."Salesperson Code 2" := SalesInvoiceHeaderRec."Salesperson Code 2";
        SalesInvoiceHeader."Salesperson Commission 2" := SalesInvoiceHeaderRec."Salesperson Commission 2";
        SalesInvoiceHeader."Salesperson Code 3" := SalesInvoiceHeaderRec."Salesperson Code 3";
        SalesInvoiceHeader."Salesperson Commission 3" := SalesInvoiceHeaderRec."Salesperson Commission 3";
        SalesInvoiceHeader."External Document No." := SalesInvoiceHeaderRec."External Document No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", 'OnBeforeUpdateCustLedgerEntryAfterSetValues', '', false, false)]
    //STEP 5 - this pulls the new value from the "Sales Invoice Header" to send to the "Cust. Ledger Entry"
    local procedure OnBeforeUpdateCustLedgerEntryAfterSetValues(var CustLedgerEntry: Record "Cust. Ledger Entry"; SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        CustLedgerEntry."External Document No." := SalesInvoiceHeader."External Document No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cust. Entry-Edit", 'OnBeforeCustLedgEntryModify', '', false, false)]
    //STEP 6 - this writes the new value to the "Cust. Ledger Entry"
    local procedure OnBeforeCustLedgEntryModify(var CustLedgEntry: Record "Cust. Ledger Entry"; FromCustLedgEntry: Record "Cust. Ledger Entry")
    var
        GLEntry: Record "G/L Entry";
        TaxEntry: Record "VAT Entry";
    begin
        CustLedgEntry.Validate("External Document No.", FromCustLedgEntry."External Document No.");

        //STEP 7 - this writes the new value to the "G/L Entry"
        GLEntry.Reset();
        GLEntry.SetRange("Document No.", FromCustLedgEntry."Document No.");
        if GLEntry.Find('-') then begin
            repeat
                GLEntry."External Document No." := FromCustLedgEntry."External Document No.";
                GLEntry.Modify();
            until GLEntry.Next() = 0;
        end;

        //STEP 8 - this writes the new value to the "Tax Entry"
        TaxEntry.Reset();
        TaxEntry.SetRange("Document No.", FromCustLedgEntry."Document No.");
        if TaxEntry.Find('-') then begin
            repeat
                TaxEntry."External Document No." := FromCustLedgEntry."External Document No.";
                TaxEntry.Modify();
            until TaxEntry.Next() = 0;
        end;
    end;
}