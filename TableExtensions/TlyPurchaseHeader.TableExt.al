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
    }

    trigger OnAfterInsert()
    begin
        CopyCommentsFromVendCardToPurchaseHeader();
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