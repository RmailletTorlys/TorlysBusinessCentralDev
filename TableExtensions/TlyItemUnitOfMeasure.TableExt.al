tableextension 55404 TlyItemUnitOfMeasure extends "Item Unit of Measure"
{
    fields
    {
        field(50001; "Conversion Unit of Measure"; Code[20])
        {
            Caption = 'Conversion Unit of Measure';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }

        field(50002; "Conversion Quantity"; Integer)
        {
            Caption = 'Conversion Quantity';
            DataClassification = CustomerContent;
        }
    }

}