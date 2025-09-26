tableextension 50121 TorlysPurchRcptLine extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Case Quantity';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Pallet Quantity';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50013; "Production Date"; Date)
        {
            Caption = 'Pallet Quantity Received';
            DataClassification = CustomerContent;
        }

        field(50014; "Confirmation No."; Text[20])
        {
            Caption = 'Confirmation No.';
            DataClassification = CustomerContent;
        }
    }

}