tableextension 50125 TorlysPurchCrMemoLine extends "Purch. Cr. Memo Line"
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

        field(50003; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Qty. to Receive Case';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Qty. to Receive Pallet';
            DataClassification = CustomerContent;
        }
        field(50013; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }
        field(50014; "Confirmation No."; Text[20])
        {
            Caption = 'Confirmation No.';
            DataClassification = CustomerContent;
        }

    }
}