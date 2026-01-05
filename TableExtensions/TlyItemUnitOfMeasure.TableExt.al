tableextension 55404 TlyItemUnitOfMeasure extends "Item Unit of Measure"
{
    fields
    {
        field(50001; "Conversion UoM"; Code[20])
        {
            Caption = 'Conversion Unit of Measure';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }

        field(50002; "Conversion Qty."; Decimal)
        {
            Caption = 'Conversion Quantity';
            DataClassification = CustomerContent;
        }
    }

}