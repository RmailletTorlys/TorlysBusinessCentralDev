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
                    Editable = false;
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'No.';
                    Editable = false;
                }

                field("Item Attribute ID"; Rec."Item Attribute ID")
                {
                    ApplicationArea = All;
                    Caption = 'Item Attribute ID';
                    ToolTip = 'Item Attribute ID';
                }

                field("Item Attribute Name"; Rec."Item Attribute Name")
                {
                    ApplicationArea = All;
                    Caption = 'Item Attribute Name';
                    ToolTip = 'Item Attribute Name';
                    Editable = false;
                }

                field("Item Attribute Value ID"; Rec."Item Attribute Value ID")
                {
                    ApplicationArea = All;
                    Caption = 'Item Attribute Value ID';
                    ToolTip = 'Item Attribute Value ID';
                    // TableRelation = "Item Attribute Value".ID where("Attribute ID" = field("Item Attribute ID"));
                    trigger OnValidate()
                    var
                        ItemAttributeValue: Record "Item Attribute Value";
                    begin
                        ItemAttributeValue.Reset();
                        ItemAttributeValue.SetRange(ID, Rec."Item Attribute Value ID");
                        if ItemAttributeValue.Find('-') then
                            if Rec."Item Attribute ID" <> ItemAttributeValue."Attribute ID" then
                                Error('This is not for the correct attribute!');
                    end;
                }

                field("Item Attribute Value Name"; Rec."Item Attribute Value Name")
                {
                    ApplicationArea = All;
                    Caption = 'Item Attribute Value Name';
                    ToolTip = 'Item Attribute Value Name';
                    Editable = false;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Table ID" := 27;
    end;
}
