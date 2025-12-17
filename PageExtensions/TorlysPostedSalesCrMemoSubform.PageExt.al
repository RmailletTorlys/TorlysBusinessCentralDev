pageextension 50135 TorlysPostedSalesCrMemoSubform extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.", Description)

        addafter(Description)
        {
            field("Location Code"; Rec."Location Code")
            {
                Caption = 'Location Code';
                ToolTip = 'Location Code';
                ApplicationArea = All;
                Visible = true;
            }
        }

        moveafter("Location Code"; "Unit of Measure Code", "Quantity")

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
        }

        moveafter("Price List"; "Unit Price", "Line Amount")

        addafter("Line Amount")
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
                Visible = true;
            }
        }
        moveafter("Unit Cost"; "Unit Cost (LCY)", "Tax Group Code", "Tax Area Code")

        addafter("Tax Area Code")
        {
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

        modify("Invoice Discount Amount")
        {
            Visible = false;
        }

        modify("Return Reason Code")
        {
            Visible = false;
        }

        modify("Deferral Code")
        {
            Visible = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }
    }

    actions
    {
        addfirst("&Line")
        {
            group(CustomerItemHistory)
            {
                Visible = true;
                Caption = 'Customer/Item History';
                Image = ViewOrder;
                action("Open Sales Orders")
                {
                    Caption = 'Open Sales Orders';
                    ToolTip = 'View open sales orders for this customer and this item';
                    ApplicationArea = All;
                    Image = Order;
                    RunObject = Page "Sales Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const(Order), "No." = field("No.");
                }
                action("Posted Sales Invoices")
                {
                    Caption = 'Posted Sales Invoices';
                    ToolTip = 'View posted sales invoices for this customer and this item';
                    ApplicationArea = All;
                    Image = Invoice;
                    RunObject = Page "Posted Sales Invoice Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "No." = field("No.");
                }
                action("Open Credit Memos")
                {
                    Caption = 'Open Credit Memos';
                    ToolTip = 'View open credit memos for this customer/item';
                    ApplicationArea = All;
                    Image = CreditMemo;
                    RunObject = Page "Sales Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const("Credit Memo"), "No." = field("No.");
                }
                action("Open Return Orders")
                {
                    Caption = 'Open Return Orders';
                    ToolTip = 'View open return orders for this customer/item';
                    ApplicationArea = All;
                    Image = ReturnOrder;
                    RunObject = Page "Sales Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const("Return Order"), "No." = field("No.");
                }
                action("Posted Credit Memos")
                {
                    Caption = 'Posted Credit Memos';
                    ToolTip = 'View posted credt memos for this customer';
                    ApplicationArea = All;
                    Image = PostedCreditMemo;
                    RunObject = Page "Posted Sales Credit Memo Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "No." = field("No.");
                }
            }
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
