pageextension 55740 TorlysTransferOrder extends "Transfer Order"
{
    layout
    {
        addafter("In-Transit Code")
        {
            field("Transfer Type"; Rec."Transfer Type")
            {
                Caption = 'Transfer Type';
                ToolTip = 'Transfer Type';
                ApplicationArea = All;
            }
        }
    }
}