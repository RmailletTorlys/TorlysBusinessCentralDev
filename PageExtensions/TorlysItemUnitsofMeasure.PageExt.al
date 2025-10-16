pageextension 55404 TorlysItemUnitsOfMeasure extends "Item Units of Measure"
{
    layout
    {
        addafter("Qty. per Unit of Measure")
        {


            field("Conversion Unit of Measure"; Rec."Conversion UoM")
            {
                Caption = 'Conversion Unit of Measure';
                ToolTip = 'Conversion Unit of Measure';
                ApplicationArea = All;
            }

            field("Conversion Quantity"; Rec."Conversion Qty.")
            {
                Caption = 'Conversion Quantity';
                ToolTip = 'Conversion Quantity';
                ApplicationArea = All;
            }
        }
    }
}