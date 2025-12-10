pageextension 50516 TorlysSalesLines extends "Sales Lines"
{
    layout
    {
        addafter("No.")
        {
            field("Item Reference No."; Rec."Item Reference No.")
            {
                Caption = 'Item Reference No.';
                ToolTip = 'Item Reference No.';
                ApplicationArea = All;
            }
        }
        moveafter("Item Reference No."; Description, "Location Code", "Unit of Measure Code", Quantity)
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

        moveafter("Quantity Pallet"; "Outstanding Quantity", "Qty. to Ship")
        addafter("Qty. to Ship")
        {
            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;
                Visible = true;
            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                Visible = true;
            }

        }
        moveafter("Qty. to Ship Pallet"; "Shipment Date")

        addafter("Shipment Date")
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }

            field("Price List Code"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        addafter("Price List Code")
        {
            field("Unit Price"; Rec."Unit Price")
            {
                Caption = 'Unit Price';
                ToolTip = 'Unit Price';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }
        moveafter("Unit Price"; "Line Amount")

        addafter("Line Amount")
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
            {
                Caption = 'Unit Cost (LCY)';
                ToolTip = 'Unit Cost (LCY)';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Quantity Shipped"; Rec."Quantity Shipped")
            {
                Caption = 'Quantity Shipped';
                ToolTip = 'Quantity Shipped';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        addafter("Quantity Shipped")
        {
            field("Qty. Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
            {
                Caption = 'Qty. Shipped Not Invoiced';
                ToolTip = 'Qty. Shipped Not Invoiced';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Qty. to Invoice"; Rec."Qty. to Invoice")
            {
                Caption = 'Qty. to Invoice';
                ToolTip = 'Qty. to Invoice';
                ApplicationArea = All;
                Visible = true;
            }
            field("Quantity Invoiced"; Rec."Quantity Invoiced")
            {
                Caption = 'Quantity Invoiced';
                ToolTip = 'Quantity Invoiced';
                ApplicationArea = All;
                Visible = true;
            }
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                ApplicationArea = All;
                Visible = true;
            }
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
                Visible = true;
            }
            field("Builder Description"; Rec."Builder Description")
            {
                Caption = 'Builder Description';
                ToolTip = 'Builder Description';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order No."; Rec."Master Project Order No.")
            {
                Caption = 'Master Project Order No.';
                ToolTip = 'Master Project Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order Line No."; Rec."Master Project Order Line No.")
            {
                Caption = 'Master Project Order Line No.';
                ToolTip = 'Master Project Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("MPO Qty. on Sales Order"; Rec."MPO Qty. on Sales Order")
            {
                Caption = 'MPO Qty. on Sales Order';
                ToolTip = 'MPO Qty. on Sales Order';
                ApplicationArea = All;
            }
            field("MPO Quantity Invoiced"; Rec."MPO Quantity Invoiced")
            {
                Caption = 'MPO Quantity Invoiced';
                ToolTip = 'MPO Quantity Invoiced';
                ApplicationArea = All;
            }
            field("Purchasing Code"; Rec."Purchasing Code")
            {
                Caption = 'Purchasing Code';
                ToolTip = 'Purchasing Code';
                ApplicationArea = All;
                Visible = true;
            }
            field("Drop Shipment"; Rec."Drop Shipment")
            {
                Caption = 'Drop Shipment';
                ToolTip = 'Drop Shipment';
                ApplicationArea = All;
                Visible = true;
            }

            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                Caption = 'PO Number';
                ToolTip = 'Purchase Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Purch. Order Line No."; Rec."Purch. Order Line No.")
            {
                Caption = 'PO Line No.';
                ToolTip = 'Purch. Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Transfer Order No."; Rec."Transfer Order No.")
            {
                Caption = 'Transfer Order No.';
                ToolTip = 'Transfer Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Transfer Order Line No."; Rec."Transfer Order Line No.")
            {
                Caption = 'Transfer Line Order No.';
                ToolTip = 'Transfer Line Order No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Linked Purchase Order No."; Rec."Linked Purchase Order No.")
            {
                Caption = 'Linked Purchase Order No.';
                ToolTip = 'Linked Purchase Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Purch. Order Line No."; Rec."Linked Purch. Order Line No.")
            {
                Caption = 'Linked Purch. Order Line No.';
                ToolTip = 'Linked Purch. Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Linked Transfer Order No."; Rec."Linked Transfer Order No.")
            {
                Caption = 'Linked Transfer Order No.';
                ToolTip = 'Linked Transfer Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Transfer Order Line No."; Rec."Linked Transfer Order Line No.")
            {
                Caption = 'Linked Transfer Line Order No.';
                ToolTip = 'Linked Transfer Line Order No.';
                ApplicationArea = All;
                Visible = true;
            }
        }

        addafter("Linked Transfer Order Line No.")
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

        modify("Location Code")
        {
            Visible = true;
        }
        modify("Qty. to Ship")
        {
            Visible = true;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }

        modify("Reserve")
        {
            Visible = false;
        }

        modify("Reserved Qty. (Base)")
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit "TorlysLookupUserID";
}

