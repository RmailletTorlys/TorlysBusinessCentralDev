pageextension 55749 TlyTransferLines extends "Transfer Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Transfer-from Code"; Rec."Transfer-from Code")
            {
                Caption = 'Transfer-from Code';
                ToolTip = 'Transfer-from Code';
                ApplicationArea = All;
            }
            field("Transfer-to Code"; Rec."Transfer-to Code")
            {
                Caption = 'Transfer-to Code';
                ToolTip = 'Transfer-to Code';
                ApplicationArea = All;
            }
            field("Receipt Date"; Rec."Receipt Date")
            {
                Caption = 'Receipt Date';
                ToolTip = 'Receipt Date';
                ApplicationArea = All;
            }
        }

        moveafter("Item No."; Description)

        addafter(Description)
        {
            field("Unit of Measure Code"; Rec."Unit of Measure Code")
            {
                Caption = 'Unit of Measure Code';
                ToolTip = 'Unit of Measure Code';
                ApplicationArea = All;
            }
            field("Quantity"; Rec."Quantity")
            {
                Caption = 'Quantity';
                ToolTip = 'Quantity';
                ApplicationArea = All;
            }
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
            }
            field("Qty. to Ship"; Rec."Qty. to Ship")
            {
                Caption = 'Qty. to Ship';
                ToolTip = 'Qty. to Ship';
                ApplicationArea = All;
            }

            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;
            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
            }
            field("Quantity Shipped"; Rec."Quantity Shipped")
            {
                Caption = 'Quantity Shipped';
                ToolTip = 'Quantity Shipped';
                ApplicationArea = All;
            }
        }

        moveafter("Quantity Shipped"; "Qty. in Transit")

        addafter("Qty. in Transit")
        {
            field("Qty. to Receive"; Rec."Qty. to Receive")
            {
                Caption = 'Qty. to Receive';
                ToolTip = 'Qty. to Receive';
                ApplicationArea = All;
            }
            field("Qty. to Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;
            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;
            }
            field("Quantity Received"; Rec."Quantity Received")
            {
                Caption = 'Quantity Received';
                ToolTip = 'Quantity Received';
                ApplicationArea = All;
            }

            field("Sales Order No."; Rec."Sales Order No.")
            {
                Caption = 'Sales Order No.';
                ToolTip = 'Sales Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Sales Order Line No."; Rec."Sales Order Line No.")
            {
                Caption = 'Sales Order Line No.';
                ToolTip = 'Sales Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Quantity Linked"; Rec."Quantity Linked")
            {
                Caption = 'Quantity Linked';
                ToolTip = 'Quantity Linked';
                ApplicationArea = All;
            }
            field("Qty. to Ship Linked"; Rec."Qty. to Ship Linked")
            {
                Caption = 'Qty. to Ship Linked';
                ToolTip = 'Qty. to Ship Linked';
                ApplicationArea = All;
            }

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

        modify("Shipment Date")
        {
            Visible = false;
        }

        modify("Outstanding Quantity")
        {
            Visible = false;
        }

        modify("Unit of Measure")
        {
            Visible = false;
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}