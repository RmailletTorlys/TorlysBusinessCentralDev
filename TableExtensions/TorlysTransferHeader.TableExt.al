tableextension 55740 TorlysTransferHeader extends "Transfer Header"
{
    fields
    {
        field(50001; "Transfer Type"; Enum TorlysTransferType)
        {
            Caption = 'Transfer Type';
            DataClassification = CustomerContent;
        }
    }
}