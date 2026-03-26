tableextension 50044 TlySalesCommentLine extends "Sales Comment Line"
{
    fields
    {
        field(50001; "Comment Type"; Code[25])
        {
            DataClassification = CustomerContent;
            Caption = 'Comment Type';
            ToolTip = 'Specifies the type of comment.';
            TableRelation = TlyCommentType;
        }
        field(50002; "Popup"; Boolean)
        {
            Caption = 'Popup';
            ToolTip = 'Popup';
            DataClassification = CustomerContent;
        }
        field(50020; "Entered By"; Code[50])
        {
            Caption = 'Entered By';
            ToolTip = 'Entered By';
            Editable = false;
            Description = 'TLY-SD - 03/25/2026';
        }
    }
    trigger OnBeforeInsert()
    begin
        Date := WorkDate();
        "Entered By" := UserId; //TLY-SD - 03/25/2026
    end;
}