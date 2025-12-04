pageextension 55742 TorlysTransferOrders extends "Transfer Orders"
{
    layout
    {
        moveafter("No."; Status)

        addafter("Status")
        {
            field("Transfer Type"; Rec."Transfer Type")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Transfer Type';
                Caption = 'Transfer Type';
            }
        }
        moveafter("Transfer Type"; "Transfer-from Code", "Transfer-to Code", "Direct Transfer", "In-Transit Code")

        addafter("In-Transit Code")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Posting Date';
                Caption = 'Posting Date';
            }
        }

        moveafter("Posting Date"; "Shipment Date", "Receipt Date", "Shipping Agent Code")

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
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified Date';
                ToolTip = 'Modified Date';
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
