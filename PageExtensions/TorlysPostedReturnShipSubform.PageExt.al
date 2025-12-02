pageextension 56651 TorlysPostedReturnShipSubform extends "Posted Return Shipment Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Item No."; Rec."Vendor Item No.")
            {
                Caption = 'Vendor Item No.';
                ToolTip = 'Vendor Item No.';
                ApplicationArea = All;
            }
        }

        moveafter("Vendor Item No."; Description, "Location Code", "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
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
        }

        addafter("Quantity Pallet")
        {
            field("Confirmation No."; Rec."Confirmation No.")
            {
                Caption = 'Confirmation No.';
                ToolTip = 'Confirmation No.';
                ApplicationArea = All;
                Visible = false;
            }

            field("Production Date"; Rec."Production Date")
            {
                Caption = 'Production Date';
                ToolTip = 'Production Date';
                ApplicationArea = All;
                Visible = false;
            }
            field("Possible Loading Date"; Rec."Possible Loading Date")
            {
                Caption = 'Possible Loading Date';
                ToolTip = 'Possible Loading Date';
                ApplicationArea = All;
                Visible = false;
            }
            field("Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ToolTip = 'Shipment Date';
                ApplicationArea = All;
                Visible = false;
            }
            field("Expected Departure Date"; Rec."Expected Departure Date")
            {
                Caption = 'Expected Departure Date';
                ToolTip = 'Expected Departure Date';
                ApplicationArea = All;
                Visible = false;
            }
        }

        addafter("Expected Departure Date")
        {
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
                Editable = true;
                Visible = false;
            }
        }

        moveafter("Previous ETA"; "Return Qty. Shipped Not Invd.", "Quantity Invoiced")

        addafter("Quantity Invoiced")
        {
            field("Created By"; LookupUser.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }

            field("Created At"; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
            }
        }

        modify("Unit of Measure Code")
        {
            Visible = false;
        }

        modify("Return Qty. Shipped Not Invd.")
        {
            Visible = true;
        }

        modify("Direct Unit Cost")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }

        modify("Bin Code")
        {
            Visible = false;
        }

        modify("Item Reference No.")
        {
            Visible = false;
        }

        modify("Return Reason Code")
        {
            Visible = false;
        }
    }

    var
        LookupUser: Codeunit "TorlysLookupUserID";

}
