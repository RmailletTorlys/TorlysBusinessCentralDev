<<<<<<< HEAD:TableExtensions/TlyItemUnitOfMeasure.TableExt.al
tableextension 55404 TlyItemUnitOfMeasure extends "Item Unit of Measure"
=======
tableextension 55404 TorlysItemUnitOfMeasure extends "Item Unit of Measure"
>>>>>>> 5d97453bc243d6e4cb3019687424c0f4e6bb89a7:TableExtensions/TorlysItemUnitOfMeasure.TableExt.al
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