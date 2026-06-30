pageextension 55733 TlyItemCategoryCard extends "Item Category Card"
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

            field("Outbound Duty % to US"; Rec."Outbound Duty % to US")
            {
                ApplicationArea = All;
                Caption = 'Outbound Duty % to US';
                ToolTip = 'Outbound Duty % to US';

            }

            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                ToolTip = 'Created By';
                Editable = false;
                Importance = Additional;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'Created At';
                ToolTip = 'Created At';
                Editable = false;
                Importance = Additional;
            }

            field("SystemModifiedy"; LookupUserId.UserId(Rec."SystemModifiedBy"))
            {
                ApplicationArea = All;
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                Editable = false;
                Importance = Additional;
            }
        }

        modify("Parent Category")
        {
            Visible = false;
        }

        modify(Attributes)
        {
            Visible = false;
        }

        addafter(Attributes)
        {
            part(ItemAdditionalCostsSubform; TlyItemAdditionalCosts)
            {
                ApplicationArea = All;
                Enabled = true;
                SubPageLink = "Item Category Code" = field("Code");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        addlast(Category_Process)
        {
            actionref("Item Additional Costs"; ItemAdditionalCosts)
            { }
        }
        addlast(Creation)
        {
            action(ItemAdditionalCosts)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Additional Costs';
                Image = ItemCosts;
                RunObject = Page TlyItemAdditionalCosts;
                RunPageLink = "Item Category Code" = field("Code");
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}