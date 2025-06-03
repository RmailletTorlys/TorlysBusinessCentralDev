codeunit 57008 "TorlysUOMManagement"
{
    procedure GetQtyPerUnitOfMeasure(Item: Record Item; UnitOfMeasureCode: Code[10]; ItemUOM: Record "Item Unit of Measure"): Decimal
    Begin
        Item.TestField("No.");
        If UnitOfMeasureCode IN [Item."Base Unit of Measure", ''] then
            exit(1);
        If (Item."No." <> ItemUOM."Item No.") OR
           (UnitOfMeasureCode <> ItemUOM.Code) then
            ItemUOM.Get(Item."No.", UnitOfMeasureCode);
        ItemUOM.TestField("Qty. per Unit of Measure");
        exit(ItemUOM."Qty. per Unit of Measure");
    End;
}