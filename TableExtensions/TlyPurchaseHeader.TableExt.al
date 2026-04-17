tableextension 50038 TlyPurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50001; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            DataClassification = CustomerContent;
            TableRelation = Manufacturer;
        }

        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }

        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var
                CommentLine: Record "Comment Line";
            begin
                CopyCommentsFromVendCardToPurchaseHeader();

                CommentLine.Reset();
                CommentLine.SetRange("Table Name", Enum::"Comment Line Table Name"::Vendor);
                CommentLine.SetFilter(CommentLine."No.", "Buy-from Vendor No.");
                IF CommentLine.Find('-') then begin
                    repeat
                        IF CommentLine."Popup" = TRUE THEN
                            Message('%1', CommentLine.Comment);
                    until CommentLine.Next = 0;
                end;
            end;
        }

        modify("Shipment Method Code")
        {
            trigger OnAfterValidate()
            begin
                TestStatusOpen();
                if ("Shipment Method Code" <> xRec."Shipment Method Code") and
                   (xRec."Buy-from Vendor No." = "Buy-from Vendor No.")
                then
                    MessageIfPurchLinesExist(FieldCaption("Shipment Method Code"));
            end;
        }

        modify("Vendor Invoice No.")
        {
            trigger OnAfterValidate()
            var
                PurchHeader: Record "Purchase Header";
                PurchInvHeader: Record "Purch. Inv. Header";
            begin
                if ("Document Type" = "Document Type"::Invoice) then begin
                    if "Vendor Invoice No." <> xRec."Vendor Invoice No." then begin
                        // Check open PI
                        PurchHeader.Reset();
                        PurchHeader.SetRange("Buy-from Vendor No.", "Buy-from Vendor No.");
                        PurchHeader.SetRange("Vendor Invoice No.", "Vendor Invoice No.");
                        PurchHeader.SetFilter("Document Type", '%1|%2', "Document Type"::Order, "Document Type"::Invoice);
                        if (PurchHeader.Find('-') and (PurchHeader."No." <> "No.")) then
                            Error('Vendor Invoice # %1 exists on order # %2!', "Vendor Invoice No.", PurchHeader."No.");
                        // Check posted invoices
                        PurchInvHeader.Reset();
                        PurchInvHeader.SetRange("Buy-from Vendor No.", "Buy-from Vendor No.");
                        PurchInvHeader.SetRange("Vendor Invoice No.", "Vendor Invoice No.");
                        if (PurchInvHeader.Find('-')) then
                            Error('Vendor Invoice # %1 exists on invoice # %2!', "Vendor Invoice No.", PurchInvHeader."No.");
                    end;
                end;
            end;
        }
    }

    trigger OnAfterInsert()
    begin
        CopyCommentsFromVendCardToPurchaseHeader();
    end;

    trigger OnBeforeDelete()
    var
        PurchLineCount: Record "Purchase Line";
    begin
        // TLY-SD - 03/20/2026 - add this here as an extra check
        // can't delete if there are lines
        PurchLineCount.Reset();
        PurchLineCount.SetRange("Document No.", "No.");
        if PurchLineCount.Find('-') then Error('Must delete lines before deleting header.');
    end;

    local procedure CopyCommentsFromVendCardToPurchaseHeader()
    var
        CommentLine: Record "Comment Line";
        PurchCommentLine: Record "Purch. Comment Line";
        LineNo: Integer;
    begin
        if Rec."Buy-from Vendor No." = '' then
            exit;

        CommentLine.Reset();
        CommentLine.SetRange("Table Name", Enum::"Comment Line Table Name"::Vendor);
        CommentLine.SetRange("No.", Rec."Buy-from Vendor No.");
        CommentLine.SetRange("Copy to Purchase Order", true);
        if CommentLine.FindSet() then begin
            PurchCommentLine.Reset();
            PurchCommentLine.SetCurrentKey("Document Type", "No.");
            PurchCommentLine.SetRange("Document Type", "Document Type");
            PurchCommentLine.SetRange("No.", "No.");
            IF PurchCommentLine.Find('+') THEN
                LineNo := PurchCommentLine."Line No.";
            LineNo += 10000;
            repeat
                PurchCommentLine.Init();
                PurchCommentLine."Document Type" := Rec."Document Type";
                PurchCommentLine."No." := Rec."No.";
                PurchCommentLine."Comment Type" := CommentLine."Comment Type";
                PurchCommentLine."Line No." := LineNo;
                LineNo += 10000;
                PurchCommentLine.Date := CommentLine.Date;
                PurchCommentLine.Comment := CommentLine.Comment;
                PurchCommentLine."Print on Purchase Order" := CommentLine."Print on Purchase Order";
                PurchCommentLine."Print on Purchase Receipt" := CommentLine."Print on Purchase Receipt";
                PurchCommentLine."Print on Purchase Invoice" := CommentLine."Print on Purchase Invoice";
                PurchCommentLine."Print on Purchase Credit Memo" := CommentLine."Print on Purchase Credit Memo";
                PurchCommentLine.Insert();
            until CommentLine.Next() = 0;
        end;
    end;
}