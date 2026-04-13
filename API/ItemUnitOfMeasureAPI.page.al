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
                field(ItemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(UOMCode; Rec.Code)
                {
                    Caption = 'UOM Code';
                }
                field(QtyPerUOM; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per UOM';
                }
                field(ConversionUOM; Rec."Conversion Unit of Measure")
                {
                    Caption = 'Conversion UUOM';
                }
                field(ConversionQty; Rec."Conversion Quantity")
                {
                    Caption = 'Conversion Qty.';
                }
                field(Height; Rec."Height")
                {
                    Caption = 'Height';
                }
                field(Width; Rec."Width")
                {
                    Caption = 'Width';
                }
                field(Length; Rec."length")
                {
                    Caption = 'Length';
                }
                field(Cubage; Rec."Cubage")
                {
                    Caption = 'Cubage';
                }
                field(Weight; Rec."Weight")
                {
                    Caption = 'Weight';
                }
            }
        }
    }
}