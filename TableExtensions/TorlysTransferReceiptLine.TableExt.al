tableextension 55747 TorlysTransferReceiptLine extends "Transfer Receipt Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Quantity Case';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Quantity Pallet';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Qty. to Ship Case';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Qty. to Ship Pallet';
            DataClassification = CustomerContent;
        }

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Qty. to Receive Case';
            DataClassification = CustomerContent;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Qty. to Receive Pallet';
            DataClassification = CustomerContent;
        }
    }

}