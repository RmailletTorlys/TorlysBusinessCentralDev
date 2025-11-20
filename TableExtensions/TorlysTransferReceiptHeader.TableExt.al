tableextension 55746 TorlysTransferReceiptHeader extends "Transfer Receipt Header"
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