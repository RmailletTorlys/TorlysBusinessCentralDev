pageextension 51643 TlyNTNWebRelatedItems extends "NTN Web Related Items"
{
    layout
    {
        addbefore(Type)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'No.';
                ToolTip = 'No.';
                Editable = false;
            }
        }
        addafter("Related Item Description")
        {
            field("Inventory - TOR"; Rec."Inventory - TOR")
            {
                ApplicationArea = All;
                Caption = 'Inventory - TOR';
                ToolTip = 'Inventory - TOR';
                Editable = false;
            }
            field("Inventory - CAL"; Rec."Inventory - CAL")
            {
                ApplicationArea = All;
                Caption = 'Inventory - CAL';
                ToolTip = 'Inventory - CAL';
                Editable = false;
            }
        }
    }
}
