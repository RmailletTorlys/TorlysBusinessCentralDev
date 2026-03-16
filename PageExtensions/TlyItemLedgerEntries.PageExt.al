pageextension 50038 TlyItemLedgerEntries extends "Item Ledger Entries"
{
    layout
    {
        addafter("TPS CMG Container No.")
        {
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = All;
                Caption = 'Reason Code';
                ToolTip = 'Reason Code';
                Visible = true;
            }
        }
        addafter("Shortcut Dimension 8 Code")
        {
            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = true;
                ToolTip = 'Created By';
                Importance = Additional;
            }
            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = true;
                ToolTip = 'Created At';
                Importance = Additional;
            }
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}