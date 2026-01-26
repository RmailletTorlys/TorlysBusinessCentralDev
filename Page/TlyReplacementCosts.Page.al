page 55102 TlyReplacementCosts
{
    Caption = 'Replacement Costs';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    SourceTable = TlyReplacementCosts;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor No.';
                    ToolTip = 'Vendor No.';
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    ToolTip = 'Item No.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Unit of Measure Code';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';
                    ToolTip = 'Date';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Cost (LCY)';
                    ToolTip = 'Unit Cost (LCY)';
                }
            }
        }
    }
}
