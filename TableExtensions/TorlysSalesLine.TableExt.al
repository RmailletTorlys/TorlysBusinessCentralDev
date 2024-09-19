tableextension 50103 TorlysSalesLine extends "Sales Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Case Quantity';
            DataClassification = ToBeClassified;

        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Pallet Quantity';
            DataClassification = ToBeClassified;
        }

        field(50003; "Qty. to Ship Case"; Integer)
        {
            Caption = 'Case Quantity to Ship';
            DataClassification = ToBeClassified;
        }

        field(50004; "Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Ship';
            DataClassification = ToBeClassified;
        }

        field(50005; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = ToBeClassified;
        }

        field(50006; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = ToBeClassified;
        }
    }
}