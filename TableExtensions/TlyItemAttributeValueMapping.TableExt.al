tableextension 57505 TlyItemAttributeValueMapping extends "Item Attribute Value Mapping"
{
    fields
    {
        field(50001; "Item Attribute Name"; Text[250])
        {
            Caption = 'Item Attribute Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Item Attribute".Name where(ID = field("Item Attribute ID")));
        }

        field(50002; "Item Attribute Value Name"; Text[250])
        {
            Caption = 'Item Attribute Value Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Item Attribute Value".Value where(ID = field("Item Attribute Value ID")));
        }
    }
}