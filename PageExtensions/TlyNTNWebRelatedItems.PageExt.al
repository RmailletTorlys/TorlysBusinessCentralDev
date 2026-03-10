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

        addafter(Type)
        {
            field("Rank"; Rec."Rank")
            {
                ApplicationArea = All;
                Caption = 'Rank';
                ToolTip = 'Rank';
                Editable = true;
            }
            field("Sell Order Rank"; Rec."Sell Order Rank")
            {
                ApplicationArea = All;
                Caption = 'Sell Order Rank';
                ToolTip = 'Sell Order Rank';
                Editable = true;
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
