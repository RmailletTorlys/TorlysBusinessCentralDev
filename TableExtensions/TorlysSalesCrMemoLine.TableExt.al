tableextension 50107 TorlysSalesCrMemoLine extends "Sales Cr.Memo Line"
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
    }


}