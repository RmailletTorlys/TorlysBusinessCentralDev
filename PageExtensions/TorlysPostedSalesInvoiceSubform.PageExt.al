pageextension 50133 TorlysPostedSalesInvoiceSubfor extends "Posted Sales Invoice Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.")
        moveafter(Description; "Description 2", "Unit of Measure Code", "Location Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case;"; Rec."Quantity Case")
            {
                Caption = 'Case Quantity';
                ToolTip = 'Case Quantity';
                ApplicationArea = All;
            }
            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;
            }
            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }

            field("Price List"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        moveafter("Price List"; "Unit Price", "Line Amount")

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
            field("System Created By"; LookupUserIdWithGuid(Rec."SystemCreatedBy"))
            {
                Caption = 'System Created By';
                ToolTip = 'System Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("System Created Date"; Rec."SystemCreatedAt")
            {
                Caption = 'System Created Date';
                ToolTip = 'System Created Date';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }

            field("System Last Modified By"; LookupUserIdWithGuid(Rec."SystemModifiedBy"))
            {
                Caption = 'System Last Modified By';
                ToolTip = 'System Last Modified By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }

            field("System Last Modified Date"; Rec."SystemModifiedAt")
            {
                Caption = 'System Last Modified Date';
                ToolTip = 'System Last Modified Date';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }



        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }

        modify("Tax Area Code")
        {
            Visible = true;
        }

        modify("Tax Group Code")
        {
            Visible = true;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Deferral Code")
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

        modify("Amount Including VAT")
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
