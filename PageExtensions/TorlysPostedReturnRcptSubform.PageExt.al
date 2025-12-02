pageextension 56661 TorlysPostedReturnRcptSubform extends "Posted Return Receipt Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.", Description, "Location Code", "Unit of Measure Code", "Quantity")


        addafter(Quantity)
        {

            field("Quantity Case;"; Rec."Quantity Case")
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
            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Visible = true;
            }

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Visible = false;
            }

            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Visible = false;
            }

            field("Price List"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                Visible = false;
            }
        }

        addafter("Price List")
        {
            field("Unit Price"; Rec."Unit Price")
            {
                Caption = 'Unit Price';
                ToolTip = 'Unit Price';
                ApplicationArea = All;
                Visible = false;
            }

            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
                Visible = false;
            }

            field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
            {
                Caption = 'Unit Cost (LCY)';
                ToolTip = 'Unit Cost (LCY)';
                ApplicationArea = All;
                Visible = false;
            }
        }

        moveafter("Unit Cost (LCY)"; "Return Qty. Rcd. Not Invd.", "Quantity Invoiced")

        addafter("Quantity Invoiced")
        {
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                ApplicationArea = All;
                Visible = false;
            }
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
                Visible = false;
            }
            field("Created By"; LookupUserIdWithGuid(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Visible = true;
            }

            field("Created At"; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Visible = true;
            }
        }

        modify("Description 2")
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


        modify("Return Reason Code")
        {
            Visible = false;
        }

        modify("Shipment Date")
        {
            Visible = false;
        }


    }

    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;
}
