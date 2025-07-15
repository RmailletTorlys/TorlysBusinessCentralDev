pageextension 50067 "TorlysSalesCommentSheet" extends "Sales Comment Sheet"
{
    layout
    {
        addafter(Code)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
                Caption = 'Type';
                ToolTip = 'Specifies the type of comment.';

            }
        }

        modify(Code)
        {
            Visible = false;
        }
    }
}