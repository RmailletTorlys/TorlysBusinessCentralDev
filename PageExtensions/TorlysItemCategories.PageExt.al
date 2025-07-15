pageextension 55730 TorlysItemCategories extends "Item Categories"
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

            field("Price List Order"; Rec."Price List Order")
            {
                ApplicationArea = All;
                Caption = 'Price List Order';
                ToolTip = 'Price List Order';
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

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                ApplicationArea = All;
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
            }

            field("SystemCreatedBy"; Rec."SystemCreatedBy")
            {
                ApplicationArea = All;
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
            }

            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'SystemCreatedAtd';
                ToolTip = 'SystemCreatedAtd';
            }

            field("SystemModifiedBy"; Rec."SystemModifiedBy")
            {
                ApplicationArea = All;
                Caption = 'SystemModifiedBy';
                ToolTip = 'SystemModifiedBy';
            }

            field("SystemModifiedAt"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'SystemModifiedAt';
                ToolTip = 'SystemModifiedAt';
            }
        }
    }
}