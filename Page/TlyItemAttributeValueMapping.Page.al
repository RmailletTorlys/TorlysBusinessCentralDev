page 57505 TlyItemAttributeValueMapping
{
    Caption = 'Item Attribute Value Mapping';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    SourceTable = "Item Attribute Value Mapping";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = All;
                    Caption = 'Table ID';
                    ToolTip = 'Table ID';
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'No.';
                }

                field("Item Attribute ID"; Rec."Item Attribute ID")
                {
                    ApplicationArea = All;
                    Caption = 'Item Attribute ID';
                    ToolTip = 'Item Attribute ID';
                }

                field("Item Attribute Value ID"; Rec."Item Attribute Value ID")
                {
                    ApplicationArea = All;
                    Caption = 'Item Attribute Value ID';
                    ToolTip = 'Item Attribute Value ID';
                }
            }
        }
    }
}
