
pageextension 50046 TorlysSalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.")

        moveafter(Description; "Location Code", "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateQuantityCase(Rec, Rec);
                    CurrPage.Update(true);
                end;
            }
            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateQuantityPallet(Rec, Rec);
                    CurrPage.Update(true);
                end;
            }
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
            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateQtyToShipCase(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }
            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateQtyToShipPallet(Rec, xRec);
                    CurrPage.Update(true);
                end;
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

        moveafter("Price List Code"; "Unit Price", "Line Amount")

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

        moveafter("Unit Cost"; "Unit Cost (LCY)", "Quantity Shipped")

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
        }

        moveafter("Qty. Shipped Not Invoiced"; "Qty. to Invoice", "Quantity Invoiced", "Tax Group Code", "Tax Area Code", "Purchasing Code", "Drop Shipment")

        addafter("Drop Shipment")
        {
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
        }

        addafter("Purch. Order Line No.")
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
            Visible = true;
        }

        modify("Quantity Invoiced")
        {
            Visible = true;
        }

        modify("Purchasing Code")
        {
            Visible = true;
        }

        modify("Drop Shipment")
        {
            Visible = true;
            Editable = false;
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

        modify("Special Order")
        {
            Visible = false;
        }

        modify("Qty. to Assemble to Order")
        {
            Visible = false;
        }

        modify("Reserved Quantity")
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

        modify("Qty. to Assign")
        {
            Visible = false;
        }

        modify("Qty. Assigned")
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
        modify("Item Charge Qty. to Handle")
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

        modify(ShortcutDimCode3)
        {
            Visible = false;
        }

        modify(ShortcutDimCode4)
        {
            Visible = false;
        }

        modify(ShortcutDimCode5)
        {
            Visible = false;
        }

        modify(ShortcutDimCode6)
        {
            Visible = false;
        }

        modify(ShortcutDimCode7)
        {
            Visible = false;
        }

        modify(ShortcutDimCode8)
        {
            Visible = false;
        }

        modify("TotalSalesLine.""Line Amount""")
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

        modify("Unit Price")
        {
            trigger OnBeforeValidate()
            begin
                if Rec.Type <> Rec.Type::Item then
                    exit;
                PrepareUserModifiedUnitPrice();

                if ((Rec."Unit Price") <> (xRec."Unit Price")) and (xRec."Unit Price" <> 0) and (UserModifiedUnitPrice) then begin
                    Rec."Price List" := '';
                    UserModifiedUnitPrice := false;
                    CurrPage.Update();
                end;
            end;
        }
    }

    var
        LookupUserId: Codeunit "LookupUserID";
        UserModifiedUnitPrice: Boolean;
        EditCasePallet: Boolean;

    trigger OnAfterGetRecord()
    begin
        OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
    end;

    procedure PrepareUserModifiedUnitPrice()
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        UserModifiedUnitPrice := true;
    end;


    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordCheckEditCasePallet(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQtyToShipCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQtyToShipPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;


}


