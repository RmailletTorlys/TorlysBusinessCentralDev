page 56005 "Item Unit of Measure API"
{
    PageType = API;
    Caption = 'Item';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'itemUnitsofMeasure';
    EntitySetName = 'itemsUnitsofMeasures';
    SourceTable = "Item Unit of Measure";
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("number"; Rec."Item No.")
                {
                    Caption = 'Number';
                }
                field("code"; Rec.Code)
                {
                    Caption = 'Code';
                }
                field("qty_uom"; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                }
                field("conversion_uom"; Rec."Conversion Unit of Measure")
                {
                    Caption = 'Conversion Unit of Measure';
                }
                field("conversion_qty"; Rec."Conversion Quantity")
                {
                    Caption = 'Conversion Quantity';
                }
                field("height"; Rec."Height")
                {
                    Caption = 'Height';
                }
                field("width"; Rec."Width")
                {
                    Caption = 'Width';
                }
                field("length"; Rec."length")
                {
                    Caption = 'Depth';
                }
                field("cubage"; Rec."Cubage")
                {
                    Caption = 'Cubage';
                }
                field("weight"; Rec."Weight")
                {
                    Caption = 'Weight';
                }
            }
        }
    }
}