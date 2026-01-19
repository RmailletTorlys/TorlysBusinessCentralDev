tableextension 55404 TlyItemUnitOfMeasure extends "Item Unit of Measure"
{
    fields
    {
        field(50001; "Conversion Unit of Measure"; Code[20])
        {
            Caption = 'Conversion Unit of Measure';
            DataClassification = CustomerContent;
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = field("Item No."));
        }

        field(50002; "Conversion Qty."; Decimal)
        {
            Caption = 'Conversion Quantity';
            DataClassification = CustomerContent;
        }
    }

}