page 55098 TlyOrderMethod
{
    Caption = 'Order Method';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    SourceTable = TlyOrderMethod;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description';
                }
            }
        }
    }
}
