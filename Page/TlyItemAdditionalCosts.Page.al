page 55104 TlyItemAdditionalCosts
{
    Caption = 'Item Additional Costs';
    PageType = ListPart;
    ApplicationArea = All;
    // UsageCategory = Lists;
    Editable = true;
    SourceTable = TlyItemAdditionalCosts;
    // AutoSplitKey = true;
    // DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    Caption = 'Item Category Code';
                    ToolTip = 'Item Category Code';
                }
                field("Additional Cost Type"; Rec."Additional Cost Type")
                {
                    ApplicationArea = All;
                    Caption = 'Additional Cost Type';
                    ToolTip = 'Additional Cost Type';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';
                    ToolTip = 'Starting Date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    Caption = 'Ending Date';
                    ToolTip = 'Ending Date';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Unit of Measure Code';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Caption = 'Currency Code';
                    ToolTip = 'Currency Code';
                }
                field("Cost Unit"; Rec."Cost Unit")
                {
                    ApplicationArea = All;
                    Caption = 'Cost Unit';
                    ToolTip = 'Cost Unit';
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                    ToolTip = 'Amount';
                }
                field("Costing Method"; Rec."Costing Method")
                {
                    ApplicationArea = All;
                    Caption = 'Costing Method';
                    ToolTip = 'Costing Method';
                }
                field("Remit-to Vendor No."; Rec."Remit-to Vendor No.")
                {
                    ApplicationArea = All;
                    Caption = 'Remit-to Vendor No.';
                    ToolTip = 'Remit-to Vendor No.';
                }
            }
        }
    }
}