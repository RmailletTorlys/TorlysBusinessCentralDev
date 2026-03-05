pageextension 51173 TlyDocumentAttachmentDetails extends "Document Attachment Details"
{
    layout
    {
        addbefore("File Extension")
        {
            field("ID"; Rec."ID")
            {
                ApplicationArea = All;
                Caption = 'ID';
                ToolTip = 'ID';
                Editable = false;
                Visible = true;
            }
            field("Table ID"; Rec."Table ID")
            {
                ApplicationArea = All;
                Caption = 'Table ID';
                ToolTip = 'Table ID';
                Editable = false;
                Visible = true;
            }
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'No.';
                ToolTip = 'No.';
                Editable = false;
                Visible = true;
            }
        }

        addafter("Attached Date")
        {
            field("Description"; Rec."Description")
            {
                ApplicationArea = All;
                Caption = 'Description';
                ToolTip = 'Description';
                Editable = false;
                Visible = true;
            }
        }
    }
}
