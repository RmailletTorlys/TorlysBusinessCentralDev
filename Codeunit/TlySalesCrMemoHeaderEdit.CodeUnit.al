codeunit 50119 TlySalesCrMemoHeaderEdit
{
    Permissions = TableData "G/L Entry" = m,
    TableData "Detailed Cust. Ledg. Entry" = m,
    TableData "Value Entry" = m,
    TableData "VAT Entry" = m;

    [EventSubscriber(ObjectType::Page, Page::"Pstd. Sales Cr. Memo - Update", 'OnAfterRecordChanged', '', false, false)]
    //STEP 1 - this checks to see what is changed in the "Update Document" window from the cr.memo page
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
        (SalesCrMemoHeader."Reason Code" <> xSalesCrMemoHeader."Reason Code") or
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
    var
        ValueEntry: Record "Value Entry";
    begin
        //STEP 2 - this writes the new value to the "Value Entry" since "Reason Code" is just a flow field in "Item Ledger Entry", need to use these parameters as the "Document No." is not there
        ValueEntry.Reset();
        ValueEntry.SetRange("Document No.", SalesCrMemoHeader."No.");
        if ValueEntry.Find('-') then begin
            repeat
                ValueEntry."Reason Code" := FromSalesCrMemoHeader."Reason Code";
                ValueEntry.Modify();
            until ValueEntry.Next() = 0;
        end;

        //STEP 3 - this writes the new value to the "Sales Cr.Memo Header" table
        SalesCrMemoHeader."Tag Name" := FromSalesCrMemoHeader."Tag Name";
        SalesCrMemoHeader."Reason Code" := FromSalesCrMemoHeader."Reason Code";
        SalesCrMemoHeader."Original Invoice No." := FromSalesCrMemoHeader."Original Invoice No.";
        SalesCrMemoHeader."Rebill Invoice No." := FromSalesCrMemoHeader."Rebill Invoice No.";
        SalesCrMemoHeader."Salesperson Code" := FromSalesCrMemoHeader."Salesperson Code";
        SalesCrMemoHeader."Salesperson Commission" := FromSalesCrMemoHeader."Salesperson Commission";
        SalesCrMemoHeader."Salesperson Code 2" := FromSalesCrMemoHeader."Salesperson Code 2";
        SalesCrMemoHeader."Salesperson Commission 2" := FromSalesCrMemoHeader."Salesperson Commission 2";
        SalesCrMemoHeader."Salesperson Code 3" := FromSalesCrMemoHeader."Salesperson Code 3";
        SalesCrMemoHeader."Salesperson Commission 3" := FromSalesCrMemoHeader."Salesperson Commission 3";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Credit Memo Hdr. - Edit", 'OnBeforeUpdateCustLedgerEntryAfterSetValues', '', false, false)]
    //STEP 4 - this pulls the new value from the "Sales Cr.Memo Header" to send to the "Cust. Ledger Entry"
    local procedure OnBeforeUpdateCustLedgerEntryAfterSetValues(var CustLedgerEntry: Record "Cust. Ledger Entry"; SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        CustLedgerEntry."Reason Code" := SalesCrMemoHeader."Reason Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cust. Entry-Edit", 'OnBeforeCustLedgEntryModify', '', false, false)]
    //STEP 5 - this writes the new value to the "Cust. Ledger Entry"
    local procedure OnBeforeCustLedgEntryModify(var CustLedgEntry: Record "Cust. Ledger Entry"; FromCustLedgEntry: Record "Cust. Ledger Entry")
    var
        DetCustLedgerEntry: Record "Detailed Cust. Ledg. Entry";
        GLEntry: Record "G/L Entry";
        TaxEntry: Record "VAT Entry";
    begin
        CustLedgEntry.Validate("Reason Code", FromCustLedgEntry."Reason Code");

        //STEP 6 - this writes the new value to the "Detailed Customer Ledger Entry"
        DetCustLedgerEntry.Reset();
        DetCustLedgerEntry.SetRange("Document No.", FromCustLedgEntry."Document No.");
        if DetCustLedgerEntry.Find('-') then begin
            repeat
                DetCustLedgerEntry."Reason Code" := FromCustLedgEntry."Reason Code";
                DetCustLedgerEntry.Modify();
            until DetCustLedgerEntry.Next() = 0;
        end;

        //STEP 7 - this writes the new value to the "G/L Entry"
        GLEntry.Reset();
        GLEntry.SetRange("Document No.", FromCustLedgEntry."Document No.");
        if GLEntry.Find('-') then begin
            repeat
                GLEntry."Reason Code" := FromCustLedgEntry."Reason Code";
                GLEntry.Modify();
            until GLEntry.Next() = 0;
        end;

        //STEP 8 - this writes the new value to the "Tax Entry"
        TaxEntry.Reset();
        TaxEntry.SetRange("Document No.", FromCustLedgEntry."Document No.");
        if TaxEntry.Find('-') then begin
            repeat
                TaxEntry."Reason Code" := FromCustLedgEntry."Reason Code";
                TaxEntry.Modify();
            until TaxEntry.Next() = 0;
        end;
    end;
}