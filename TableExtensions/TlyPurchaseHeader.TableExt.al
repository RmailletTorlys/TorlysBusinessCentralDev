tableextension 50038 TlyPurchaseHeader extends "Purchase Header"
{
    fields
    {

        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }

        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            begin
                CopyCommentsFromVendCardToPurchaseHeader();
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
        PurchaseCommentLine: Record "Purch. Comment Line";
        LineNo: Integer;
    begin
        if Rec."Buy-from Vendor No." = '' then
            exit;



        CommentLine.Reset();
        CommentLine.SetRange("Table Name", Enum::"Comment Line Table Name"::Vendor);
        CommentLine.SetRange("No.", Rec."Buy-from Vendor No.");
        CommentLine.SetRange("Copy to Purchase Order", true);
        if CommentLine.FindSet() then BEGIN
            PurchaseCommentLine.RESET();
            PurchaseCommentLine.SETCURRENTKEY("Document Type", "No.");
            PurchaseCommentLine.SETRANGE("Document Type", "Document Type");
            PurchaseCommentLine.SETRANGE("No.", "No.");
            IF PurchaseCommentLine.FIND('+') THEN
                LineNo := PurchaseCommentLine."Line No.";
            LineNo += 10000;
            repeat
                PurchaseCommentLine.Init();
                PurchaseCommentLine."Document Type" := Rec."Document Type";
                PurchaseCommentLine."No." := Rec."No.";
                PurchaseCommentLine."Comment Type" := CommentLine."Comment Type";
                PurchaseCommentLine."Line No." := LineNo;
                LineNo += 10000;
                PurchaseCommentLine.Date := CommentLine.Date;
                PurchaseCommentLine.Comment := CommentLine.Comment;
                PurchaseCommentLine."Print on Purchase Order" := CommentLine."Print on Purchase Order";
                PurchaseCommentLine."Print on Purchase Receipt" := CommentLine."Print on Purchase Receipt";
                PurchaseCommentLine."Print on Purchase Invoice" := CommentLine."Print on Purchase Invoice";
                PurchaseCommentLine."Print on Purchase Credit Memo" := CommentLine."Print on Purchase Credit Memo";
                PurchaseCommentLine.Insert();
            until CommentLine.Next() = 0;
        end;
    end;
}