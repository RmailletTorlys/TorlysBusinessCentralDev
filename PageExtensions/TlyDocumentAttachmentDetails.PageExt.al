pageextension 51173 TlyDocumentAttachmentDetails extends "Document Attachment Details"
{
    layout
    {
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
