pageextension 50131 "TorlysPostedSalesShptSubform" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.", "Description", "Unit of Measure Code", "Location Code", Quantity)

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

        moveafter("Quantity Pallet"; "Shipment Date", "Qty. Shipped Not Invoiced", "Quantity Invoiced")

        addafter("Quantity Invoiced")
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
                Visible = true;
            }

            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Visible = true;
            }

            field("Price List"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                Visible = true;
            }

            field("Unit Price"; Rec."Unit Price")
            {
                Caption = 'Unit Price';
                ToolTip = 'Unit Price';
                ApplicationArea = All;
            }

            field("Line Amount"; Rec."Line Amount Excl. Tax")
            {
                Caption = 'Line Amount';
                ToolTip = 'Line Amount';
                ApplicationArea = All;
            }

            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
            }

            field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
            {
                Caption = 'Unit Cost (LCY)';
                ToolTip = 'Unit Cost (LCY)';
                ApplicationArea = All;
            }

            field("Tax Group Code"; Rec."Tax Group Code")
            {
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                ApplicationArea = All;
            }

            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
            }

            field("Purchasing Code"; Rec."Purchasing Code")
            {
                Caption = 'Purchasing Code';
                ToolTip = 'Purchasing Code';
                ApplicationArea = All;
            }

            field("Drop Shipment"; Rec."Drop Shipment")
            {
                Caption = 'Drop Shipment';
                ToolTip = 'Drop Shipment';
                ApplicationArea = All;
            }

            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                Caption = 'Purchase Order No.';
                ToolTip = 'Purchase Order No.';
                ApplicationArea = All;
            }

            field("Purchase Order Line No."; Rec."Purch. Order Line No.")
            {
                Caption = 'Purchase Order Line No.';
                ToolTip = 'Purchase Order Line No.';
                ApplicationArea = All;
            }

            field("Created By"; LookupUserIdWithGuid(Rec.SystemCreatedBy))
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

            field("Modified By"; LookupUserIdWithGuid(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
            }

            field("Modified At"; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
            }
        }

        modify("Qty. Shipped Not Invoiced")
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

        modify("Planned Delivery Date")
        {
            Visible = false;
        }

        modify("Planned Shipment Date")
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