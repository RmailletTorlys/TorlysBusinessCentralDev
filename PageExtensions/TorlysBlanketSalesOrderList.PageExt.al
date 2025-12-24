pageextension 59303 TorlysBlanketSalesOrderList extends "Blanket Sales Orders"
{
    layout
    {
        moveafter("No."; "Sell-to Customer No.", "Ship-to Code", "Sell-to Customer Name")

        addafter("Sell-to Customer Name")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                Caption = 'Ordered By';
                ToolTip = 'Ordered By';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
        moveafter("Your Reference"; "External Document No.")

        addafter("External Document No.")
        {
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
        moveafter("Tag Name"; "Location Code")

        addafter("Location Code")
        {
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Created At"; Rec."SystemCreatedAt")
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Modified By"; LookupUserId.UserId(Rec."SystemModifiedBy"))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Modified At"; Rec."SystemModifiedAt")
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Ship-to Code")
        {
            Visible = true;
        }

        modify(Status)
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit "TorlysLookupUserID";
}