tableextension 50036 TlySalesHeader extends "Sales Header"
{
    fields
    {
        field(50001; "Salesperson Commission"; Decimal)
        {
            Caption = 'Salesperson Commission';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50002; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50003; "Salesperson Commission 2"; Decimal)
        {
            Caption = 'Salesperson Commission 2';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50004; "Salesperson Code 3"; code[20])
        {
            Caption = 'Salesperson Code 3';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50005; "Salesperson Commission 3"; Decimal)
        {
            Caption = 'Salesperson Commission 3';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50006; "Order Time"; Time)
        {
            Caption = 'Order Time';
            DataClassification = CustomerContent;
        }

        field(50007; "Order Type"; Text[20])
        {
            Caption = 'Order Type';
            TableRelation = TlyOrderType;
            DataClassification = CustomerContent;
        }

        field(50008; "Tag Name"; Text[30])
        {
            Caption = 'Tag Name';
            DataClassification = CustomerContent;
        }

        field(50009; "Temporary Hold"; Boolean)
        {
            Caption = 'Temporary Hold';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "Temporary Hold" then "Order Type" := 'Hold Order'
            end;
        }

        field(50010; "No. Pick Slips Printed"; Integer)
        {
            Caption = 'No. Pick Slips Printed';
            DataClassification = CustomerContent;
        }

        field(50011; "Pick Slip Printed By"; Code[50])
        {
            Caption = 'Pick Slip Printed By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50012; "Pick Slip Printed Date"; Date)
        {
            Caption = 'Pick Slip Printed Date';
            DataClassification = CustomerContent;
        }

        field(50013; "Pick Slip Printed Time"; Time)
        {
            Caption = 'Pick Slip Printed Time';
            DataClassification = CustomerContent;
        }

        field(50014; "Popup Modify By"; Code[20])
        {
            Caption = 'Popup Modify By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50015; "Popup Modify Date"; Date)
        {
            Caption = 'Popup Modify Date';
            DataClassification = CustomerContent;
        }

        field(50016; "Popup Modify Time"; Time)
        {
            Caption = 'Popup Modify Time';
            DataClassification = CustomerContent;
        }

        field(50017; "Original Invoice No."; Code[20])
        {
            Caption = 'Original Invoice No.';
            // TableRelation = "Sales Invoice Header"."No." where("Sell-to Customer No." = field("Sell-to Customer No."));
            DataClassification = CustomerContent;
            // trigger OnValidate()
            // var
            //     SalesHeader: Record "Sales Header";
            //     SalesCrMemo: Record "Sales Cr.Memo Header";
            //     SalesInvoiceHeader: Record "Sales Invoice Header";
            // begin
            //     if ("Original Invoice No." <> '') and (Rec."Document Type" in [Rec."Document Type"::"Return Order", Rec."Document Type"::"Credit Memo"]) then begin
            //         if "Original Invoice No." <> xRec."Original Invoice No." then begin
            //             // Check open CM/RO
            //             SalesHeader.Reset;
            //             SalesHeader.SetRange("Sell-to Customer No.", "Sell-to Customer No.");
            //             SalesHeader.SetRange("Original Invoice No.", "Original Invoice No.");
            //             SalesHeader.SetFilter("Document Type", '%1', "Document Type"::"Credit Memo");
            //             if (SalesHeader.Find('-') and (SalesHeader."No." <> "No.")) then
            //                 Message('Invoice number %1 exists on open credit memo %3. Please investigate!', "Original Invoice No.", SalesHeader."Document Type", SalesHeader."No.");
            //             // Check posted CR
            //             SalesCrMemo.Reset;
            //             SalesCrMemo.SetRange("Sell-to Customer No.", "Sell-to Customer No.");
            //             SalesCrMemo.SetRange("Original Invoice No.", "Original Invoice No.");
            //             if SalesCrMemo.Find('-') and (SalesCrMemo."No." <> "No.") then
            //                 Message('Invoice number %1 exists on posted credit memo %2. Please investigate!', "Original Invoice No.", SalesCrMemo."No.");
            //         end;
            //     end;

            //     if (Rec."Original Invoice No." <> '') and (Rec."Document Type" in [Rec."Document Type"::"Return Order", Rec."Document Type"::"Credit Memo"]) then begin
            //         SalesInvoiceHeader.Get(Rec."Original Invoice No.");
            //         Rec."External Document No." := SalesInvoiceHeader."External Document No.";
            //         Rec."Tag Name" := SalesInvoiceHeader."Tag Name";
            //         Rec."Salesperson Code" := SalesInvoiceHeader."Salesperson Code";
            //         Rec."Salesperson Commission" := SalesInvoiceHeader."Salesperson Commission";
            //         Rec."Salesperson Code 2" := SalesInvoiceHeader."Salesperson Code 2";
            //         Rec."Salesperson Commission 2" := SalesInvoiceHeader."Salesperson Commission 2";
            //         Rec."Salesperson Code 3" := SalesInvoiceHeader."Salesperson Code 3";
            //         Rec."Salesperson Commission 3" := SalesInvoiceHeader."Salesperson Commission 3";
            //     end;
            // end;
        }
        field(50018; "Rebill Invoice No."; Code[20])
        {
            Caption = 'Rebill Invoice No.';
            TableRelation = "Sales Invoice Header"."No." where("Sell-to Customer No." = field("Sell-to Customer No."));
            DataClassification = CustomerContent;
        }
        field(50020; "Qty. to Ship"; Decimal)
        {
            Caption = 'Qty. to ship';
            CalcFormula = Sum("Sales Line"."Qty. to Ship" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50021; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            CalcFormula = Sum("Sales Line"."Outstanding Quantity" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50022; "Sample Allowance Exclusion"; Boolean)
        {
            Caption = 'Sample Allowance Exclusion';
            DataClassification = CustomerContent;
        }

        field(50023; "CM Accuracy Approval By"; code[20])
        {
            Caption = 'CM Accuracy Approval By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50024; "CM Accuracy Approval Date"; Date)
        {
            Caption = 'CM Accuracy Approval Date';
            DataClassification = CustomerContent;
        }

        field(50025; "Do Not Mail Credit Note"; Boolean)
        {
            Caption = 'Do Not Mail Credit Note';
            DataClassification = CustomerContent;
        }

        field(50026; "Picked By"; code[20])
        {
            Caption = 'Picked By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(50027; "Audited By"; code[20])
        {
            Caption = 'Audited By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(50028; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = TlyFreightZone;
        }

        field(50029; "CM Approved By"; code[20])
        {
            Caption = 'CM Approved By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50030; "CM Approved Date"; Date)
        {
            Caption = 'CM Approved Date';
            DataClassification = CustomerContent;
        }

        field(50031; "Order Method"; Text[20])
        {
            Caption = 'Order Method';
            DataClassification = CustomerContent;
            TableRelation = TlyOrderMethod;
        }

        field(50037; "Shipping Instructions"; Text[20])
        {
            Caption = 'Shipping Instructions';
            DataClassification = CustomerContent;
            TableRelation = TlyShippingInstructions;
        }

        field(50040; "Shipping Comment"; Text[50])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        field(50041; "MK Required"; Boolean)
        {
            Caption = 'MK Required';
            DataClassification = CustomerContent;
        }

        field(50042; "MK Required Type"; Enum TlyMKRequiredType)
        {
            Caption = 'MK Required Type';
            DataClassification = CustomerContent;
            // OptionMembers = " ","Plank","Swatch","Chainset","Custom";
        }
        field(50043; "MK Staged"; Boolean)
        {
            Caption = 'MK Staged';
            DataClassification = CustomerContent;
        }
        field(50044; "MK Staged Location"; Code[20])
        {
            Caption = 'MK Staged Location';
            TableRelation = TlyMKStagedLocation;
            DataClassification = CustomerContent;
        }
        field(50045; "MK Intransit"; Boolean)
        {
            Caption = 'MK Intransit';
            DataClassification = CustomerContent;
        }
        field(50046; "MK Received"; Boolean)
        {
            Caption = 'MK Received';
            DataClassification = CustomerContent;
        }

        field(50047; "Club"; Enum TlyClub)
        {
            Caption = 'Club';
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer.Club where("No." = field("Sell-to Customer No.")));
            // OptionMembers = None,"Power Up","Power Up National","Power Up Assurance","Power Up USA";
            Editable = false;
        }

        field(50048; "Power Up Level"; Enum TlyPowerUpLevel)
        {
            Caption = 'Club';
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."Power Up Level" where("No." = field("Sell-to Customer No.")));
            // OptionMembers = None,"Premier","Elite","Designer";
            Editable = false;
        }
        field(50049; "BOL No."; Code[20])
        {
            Caption = 'BOL No.';
            TableRelation = TlyBillOfLadingHeader;
            DataClassification = CustomerContent;
        }

        field(50050; "MK Staged Quantity"; Integer)
        {
            Caption = 'MK Staged Quantity';
            DataClassification = CustomerContent;
        }

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            begin
                CopyCommentsFromCustCardToSalesHeader();
            end;
        }

        modify("External Document No.")
        {
            trigger OnAfterValidate()
            var
                SalesHeader: Record "Sales Header";
                SalesInvoiceHeader: Record "Sales Invoice Header";
            begin
                if ("Document Type" in ["Document Type"::Order, "Document Type"::Invoice]) then begin
                    if "External Document No." <> xRec."External Document No." then begin
                        // Check open OR/SI
                        SalesHeader.Reset();
                        SalesHeader.SetRange("Sell-to Customer No.", "Sell-to Customer No.");
                        SalesHeader.SetRange("External Document No.", "External Document No.");
                        SalesHeader.SetFilter("Document Type", '%1|%2', "Document Type"::Order, "Document Type"::Invoice);
                        IF (SalesHeader.Find('-') and (SalesHeader."No." <> "No.")) then
                            Error('Customer PO # %1 exists on order # %2!', "External Document No.", SalesHeader."No.");
                        // Check posted invoices
                        SalesInvoiceHeader.Reset();
                        SalesInvoiceHeader.SetRange("Sell-to Customer No.", "Sell-to Customer No.");
                        SalesInvoiceHeader.SetRange("External Document No.", "External Document No.");
                        if (SalesInvoiceHeader.Find('-')) then
                            Error('Customer PO # %1 exists on invoice # %2!', "External Document No.", SalesInvoiceHeader."No.");
                    end;
                end;
            end;
        }

        modify("Location Code")
        {
            trigger OnAfterValidate()
            begin
                if Rec."Location Code" = 'CAL' then begin
                    Message('test %1', rec."Location Code");
                    // rec.validate(Rec."SCX Ship-from Code", 'CALGARY');
                    // rec.Modify(true);
                end;
            end;
        }
    }

    trigger OnAfterInsert()
    begin
        "Order Time" := Time;
        CopyCommentsFromCustCardToSalesHeader();
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit "DimensionManagement";
    begin
        DimMgt.GetShortcutDimensions(Rec."Dimension Set ID", ShortcutDimCode);
    end;

    local procedure CopyCommentsFromCustCardToSalesHeader()
    var
        CommentLine: Record "Comment Line";
        SalesCommentLine: Record "Sales Comment Line";
        LineNo: Integer;
        IsHandled: Boolean;
    begin
        OnBeforeCopyCommentsFromCustCardToSalesHeader(IsHandled);
        if IsHandled then
            exit;

        if Rec."Sell-to Customer No." = '' then
            exit;

        CommentLine.Reset();
        CommentLine.SetRange("Table Name", Enum::"Comment Line Table Name"::Customer);
        CommentLine.SetRange("No.", Rec."Sell-to Customer No.");
        CommentLine.SetRange("Copy to Sales Order", true);
        if CommentLine.FindSet() then BEGIN
            SalesCommentLine.RESET();
            SalesCommentLine.SETCURRENTKEY("Document Type", "No.");
            SalesCommentLine.SETRANGE("Document Type", "Document Type");
            SalesCommentLine.SETRANGE("No.", "No.");
            IF SalesCommentLine.FIND('+') THEN
                LineNo := SalesCommentLine."Line No.";
            LineNo += 10000;
            repeat
                SalesCommentLine.Init();
                SalesCommentLine."Document Type" := Rec."Document Type";
                SalesCommentLine."No." := Rec."No.";
                SalesCommentLine."Comment Type" := CommentLine."Comment Type";
                SalesCommentLine."Line No." := LineNo;
                LineNo += 10000;
                SalesCommentLine.Date := CommentLine.Date;
                SalesCommentLine.Comment := CommentLine.Comment;
                SalesCommentLine."Print on Quote" := CommentLine."Print on Quote";
                SalesCommentLine."Print on Pick Ticket" := CommentLine."Print on Pick Ticket";
                SalesCommentLine."Print on Order Confirmation" := CommentLine."Print on Order Confirmation";
                SalesCommentLine."Print on Shipment" := CommentLine."Print on Shipment";
                SalesCommentLine."Print on Invoice" := CommentLine."Print on Invoice";
                SalesCommentLine."Print on Credit Memo" := CommentLine."Print on Credit Memo";
                SalesCommentLine."Print on Return Authorization" := CommentLine."Print on Return Authorization";
                SalesCommentLine."Print on Return Receipt" := CommentLine."Print on Return Receipt";
                SalesCommentLine.Insert();
            until CommentLine.Next() = 0;
        end;

        OnAfterCopyCommentsFromCustCardToSalesHeader();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCopyCommentsFromCustCardToSalesHeader(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyCommentsFromCustCardToSalesHeader()
    begin
    end;
}