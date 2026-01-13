pageextension 50508 TlyBlanketSalesOrderSubform extends "Blanket Sales Order Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.")

        moveafter(Description; "Location Code", "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                Caption = 'Outstanding Quantity';
                ToolTip = 'Outstanding Quantity';
                ApplicationArea = All;
            }
        }

        moveafter("Outstanding Quantity"; "Qty. to Ship")

        addafter("Qty. to Ship")
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
        }

        moveafter("Item Category Code"; "Unit Price", "Line Amount")

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
        }

        moveafter("Unit Cost"; "Unit Cost (LCY)", "Tax Group Code", "Tax Area Code")

        addafter("Tax Area Code")
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

        modify("Item Reference No.")
        {
            Visible = true;
        }

        modify("Location Code")
        {
            Visible = true;
        }

        modify("Quantity Shipped")
        {
            Visible = false;
        }

        modify("Quantity Invoiced")
        {
            Visible = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Unit Cost (LCY)")
        {
            Visible = true;
            Editable = false;
        }

        modify("Qty. to Assemble to Order")
        {
            Visible = false;
        }

        modify("Tax Area Code")
        {
            Visible = true;
        }

        modify("Tax Group Code")
        {
            Visible = true;
        }

        modify("Amount Including VAT")
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

        modify("Invoice Discount Amount")
        {
            Visible = false;
        }

        modify("Invoice Disc. Pct.")
        {
            Visible = false;
        }

        modify(SubtotalExclVAT)
        {
            Visible = false;
        }

        modify("ShortcutDimCode[3]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[4]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[5]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[6]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[7]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[8]")
        {
            Visible = false;
        }

        modify("Shipment Date")
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}