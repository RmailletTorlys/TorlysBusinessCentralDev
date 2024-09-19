tableextension 50116 TorlysItemJournalLine extends "Item Journal Line"
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