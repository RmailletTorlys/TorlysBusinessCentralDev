tableextension 50103 TorlysSalesLine extends "Sales Line"
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

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Case Quantity to Ship';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Ship';
            DataClassification = CustomerContent;
        }

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50007; "Qty. Received Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50008; "Qty. Received Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50009; "Sales Price Code"; Code[20])
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50010; "Default Price List"; Code[20])
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50011; "Price List"; Code[20])
        {
            Caption = 'Item Category Code';
            DataClassification = CustomerContent;
        }
    }
}