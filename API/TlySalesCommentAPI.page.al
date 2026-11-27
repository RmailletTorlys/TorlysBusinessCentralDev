page 50120 "TlySalesCommentAPI"
{
    PageType = API;
    Caption = 'salesCommentLine';
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v1.0';
    EntityName = 'salesCommentLine';
    EntitySetName = 'salesCommentLines';
    SourceTable = "Sales Comment Line";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(Records)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(documentNo; Rec."No.")
                {
                    Caption = 'Document No.';
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(date; Rec.Date)
                {
                    Caption = 'Date';
                }
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SalesCommentLine: Record "Sales Comment Line";
    begin
        if Rec."Line No." = 0 then begin
            SalesCommentLine.SetRange("Document Type", Rec."Document Type");
            SalesCommentLine.SetRange("No.", Rec."No.");
            SalesCommentLine.SetRange("Document Line No.", Rec."Document Line No.");
            if SalesCommentLine.FindLast() then
                Rec."Line No." := SalesCommentLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;

        if Rec.Date = 0D then
            Rec.Date := WorkDate();
    end;
}
