pageextension 55700 TlyStockkeepingUnitCard extends "Stockkeeping Unit Card"
{
    layout
    {
        moveafter("Item No."; Description, "Location Code", Inventory, "Qty. on Sales Order", "Qty. on Purch. Order", "Qty. in Transit")

        addafter("Qty. in Transit")
        {
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = true;
                ToolTip = 'This field is the user who created the customer account.';
                Importance = Additional;
            }
            field("Created At"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was created.';
                Importance = Additional;
            }

            field("Modified By"; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Modified At"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was last modified.';
                Importance = Additional;
            }
        }

        modify("Variant Code")
        {
            Visible = false;
        }

        modify("Shelf No.")
        {
            Visible = false;
        }

        modify("Qty. on Prod. Order")
        {
            Visible = false;
        }

        modify("Qty. on Assembly Order")
        {
            Visible = false;
        }

        modify("Qty. on Asm. Component")
        {
            Visible = false;
        }

        modify("Assembly Policy")
        {
            Visible = false;
        }

        modify("Transfer-from Code")
        {
            Visible = false;
        }

        modify("Last Date Modified")
        {
            Visible = false;
        }

        modify("Unit Cost")
        {
            Editable = false;
        }

        modify("Last Direct Cost")
        {
            Editable = false;
        }

        modify("Safety Stock Quantity")
        {
            Enabled = true;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}