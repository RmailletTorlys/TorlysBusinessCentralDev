page 55019 TlyClaimsTrackingSubform
{
    PageType = ListPart;
    ApplicationArea = All;
    // UsageCategory = Tasks;
    SourceTable = TlyClaimsTrackingLine;
    Caption = 'Claims Tracking Subform';
    Editable = true;
    LinksAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of line.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number associated with the line.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Provides a description of the line item.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Provides a description of the line item.';
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of items in the line.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the UOM for the line.';
                }
                field("Batch No."; Rec."Batch No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Batch No.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit price of the item in the line.';
                }
                field("Line Amount"; Rec."Line Amount Excl. Tax")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount for the line.';
                }
                field("Unit Cost"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unit Cost';
                }
            }
        }
    }
}