pageextension 55850 TlyPostedSalesDocumentLines extends "Posted Sales Document Lines"
{
    layout
    {
        addbefore(ShowRevLine)
        {
            field("Original Invoice No."; OriginalInvoiceNo)
            {
                ApplicationArea = All;
                Caption = 'Original Invoice No.';
                ToolTip = 'Original Invoice No.';
                Editable = false;
            }
        }
    }
    var
        OriginalInvoiceNo: Code[20];
}
