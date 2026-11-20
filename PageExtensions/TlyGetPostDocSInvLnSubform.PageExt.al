pageextension 55852 TlyGetPostDocSInvLnSubform extends "Get Post.Doc - S.InvLn Subform"
{
    layout
    {
        addafter(QtyReturned)
        {
            field("Unit Price"; Rec."Unit Price")
            {
                ApplicationArea = All;
                Caption = 'Unit Price';
                ToolTip = 'Unit Price';
                Editable = false;
            }
        }

        modify("Item Reference No.")
        {
            Visible = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }
    }

    procedure SetOriginalInvoiceNo(DocumentNo: Code[20])
    begin
        Rec.SetRange("Document No.", DocumentNo);
        CurrPage.Update();
    end;
}