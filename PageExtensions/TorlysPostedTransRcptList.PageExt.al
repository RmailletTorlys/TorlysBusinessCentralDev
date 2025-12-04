pageextension 55753 TorlysPostedTransRcptList extends "Posted Transfer Receipts"
{
    layout
    {

        addafter("No.")
        {
            field("Transfer Order No."; Rec."Transfer Order No.")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Transfer Order No.';
                Caption = 'Transfer Order No.';
                Visible = true;
            }
            field("Transfer Order Date"; Rec."Transfer Order Date")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Transfer Order Date';
                Caption = 'Transfer Order Date';
                Visible = true;
            }
            field("Transfer Type"; Rec."Transfer Type")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Transfer Type';
                Caption = 'Transfer Type';
            }
        }
        moveafter("Transfer Type"; "Transfer-from Code", "Transfer-to Code")

        addafter("Transfer-to Code")
        {
            field("Direct Transfer"; Rec."Direct Transfer")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Direct Transfer';
                Caption = 'Direct Transfer';
            }

            field("In-Transit Code"; Rec."In-Transit Code")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'In-Transit Code';
                Caption = 'In-Transit Code';
            }
        }

        moveafter("In-Transit Code"; "Posting Date", "Shipment Date", "Receipt Date", "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
            field("BOL No."; Rec."BOL No.")
            {
                Caption = 'BOL No.';
                ToolTip = 'BOL No.';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field("Package Tracking No."; Rec."Package Tracking No.")
            {
                Caption = 'Package Tracking No.';
                ToolTip = 'Package Tracking No.';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created Date';
                ToolTip = 'Created Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
        }

        modify("Shipment Date")
        {
            visible = true;
        }

        modify("Receipt Date")
        {
            visible = true;
        }

        modify("Shipping Agent Code")
        {
            visible = true;
        }
    }
    var
        LookupUserId: Codeunit "TorlysLookupUserID";
}
