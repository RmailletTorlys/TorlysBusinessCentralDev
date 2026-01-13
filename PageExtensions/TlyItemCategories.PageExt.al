pageextension 55730 TlyItemCategories extends "Item Categories"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
                Caption = 'Description 2';
                ToolTip = 'Description 2';

            }

            field("Description (FR)"; Rec."Description (FR)")
            {
                ApplicationArea = All;
                Caption = 'Description (FR)';
                ToolTip = 'Description (FR)';
            }

            field("Description 2 (FR)"; Rec."Description 2 (FR)")
            {
                ApplicationArea = All;
                Caption = 'Description 2 (FR)';
                ToolTip = 'Description 2 (FR)';
            }

            field("Dimensions"; Rec."Dimensions")
            {
                ApplicationArea = All;
                Caption = 'Dimensions';
                ToolTip = 'Dimensions';
            }


            field("US Exclusive"; Rec."US Exclusive")
            {
                ApplicationArea = All;
                Caption = 'US Exclusive';
                ToolTip = 'US Exclusive';
            }

            field("Not Available in US"; Rec."Not Available in US")
            {
                ApplicationArea = All;
                Caption = 'Not Available in US';
                ToolTip = 'Not Available in US';

            }

            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                ApplicationArea = All;
                Caption = 'System Created By';
                ToolTip = 'System Created By';
                Editable = false;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'System Created At';
                ToolTip = 'System Created At';
                Editable = false;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                ApplicationArea = All;
                Caption = 'System Modified By';
                ToolTip = 'System Modified By';
                Editable = false;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
                Caption = 'System Modified At';
                ToolTip = 'System Modified At';
                Editable = false;
            }
        }
    }
}