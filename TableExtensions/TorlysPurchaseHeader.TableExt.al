tableextension 50038 TorlysPurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50007; "Manufacturer Code"; Code[20])
        {
            Caption = 'Manufacturer Code';
            DataClassification = CustomerContent;
        }

        field(50008; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }

        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }

        field(50011; "Incoterms"; Code[20])
        {
            Caption = 'Incoterms';
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
    begin
        if Rec."Buy-from Vendor No." = '' then
            exit;

        PurchaseCommentLine.Reset();
        PurchaseCommentLine.SetRange("Document Type", Rec."Document Type");
        PurchaseCommentLine.SetRange("No.", Rec."No.");
        if PurchaseCommentLine.IsEmpty() then begin
            CommentLine.Reset();
            CommentLine.SetRange("Table Name", Enum::"Comment Line Table Name"::Vendor);
            CommentLine.SetRange("No.", Rec."Buy-from Vendor No.");
            CommentLine.SetRange("Copy to Purchase Order", true);
            if CommentLine.FindSet() then
                repeat
                    PurchaseCommentLine.Init();
                    PurchaseCommentLine."Document Type" := Rec."Document Type";
                    PurchaseCommentLine."No." := Rec."No.";
                    PurchaseCommentLine."Type" := CommentLine.Type;
                    PurchaseCommentLine."Line No." := CommentLine."Line No.";
                    PurchaseCommentLine.Date := CommentLine.Date;
                    PurchaseCommentLine.Comment := CommentLine.Comment;
                    PurchaseCommentLine."Print on Quote" := CommentLine."Print on Quote";
                    PurchaseCommentLine."Print on Pick Ticket" := CommentLine."Print on Pick Ticket";
                    PurchaseCommentLine."Print on Order Confirmation" := CommentLine."Print on Order Confirmation";
                    PurchaseCommentLine."Print on Shipment" := CommentLine."Print on Shipment";
                    PurchaseCommentLine."Print on Invoice" := CommentLine."Print on Invoice";
                    PurchaseCommentLine."Print on Credit Memo" := CommentLine."Print on Credit Memo";
                    PurchaseCommentLine."Print on Return Authorization" := CommentLine."Print on Return Authorization";
                    PurchaseCommentLine."Print on Return Receipt" := CommentLine."Print on Return Receipt";
                    PurchaseCommentLine.Insert();
                until CommentLine.Next() = 0;
        end;
    end;
}