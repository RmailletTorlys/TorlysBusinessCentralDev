pageextension 50038 TlyItemLedgerEntries extends "Item Ledger Entries"
{
    layout
    {
        moveafter(Description; "Source No.")

        addafter("TPS CMG Container No.")
        {
            field("Container No. (TPS)"; Rec."Container No. (TPS)")
            {
                ApplicationArea = All;
                Caption = 'Container No. (TPS)';
                ToolTip = 'Container No. (TPS)';
                Visible = true;
            }
            field("Container No. (NAV)"; Rec."Container No. (NAV)")
            {
                ApplicationArea = All;
                Caption = 'Container No. (NAV)';
                ToolTip = 'Container No. (NAV)';
                Visible = true;
            }
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
        modify("Source No.")
        {
            Visible = true;
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}