
pageextension 50046 TorlysSalesOrderSubform extends "Sales Order Subform"
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
                Editable = UoMValid;


                trigger OnValidate()
                begin
                    OnValidateCase(Rec, Rec);
                end;

            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;
                Editable = UoMValid;

                trigger OnValidate()
                begin
                    OnValidatePallet(Rec, Rec);
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
                Editable = UoMValid;

                trigger OnValidate()
                begin
                    OnValidateToShipCase(Rec, xRec);
                end;

            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                Editable = UoMValid;

                trigger OnValidate()
                begin
                    OnValidateToShipPallet(Rec, xRec);
                end;

            }

        }
        moveafter("Qty. to Ship Pallet"; "Shipment Date", "Quantity Shipped")
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

        moveafter("Qty. Shipped Not Invoiced"; "Qty. to Invoice", "Quantity Invoiced")
        addafter("Quantity Invoiced")
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

        moveafter("Unit Cost"; "Unit Cost (LCY)", "Tax Group Code", "Tax Area Code", "Purchasing Code", "Drop Shipment")
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

        modify("Item Reference No.")
        {
            Visible = false;
        }

        modify("Description 2")
        {
            Visible = false;
        }

        modify("Location Code")
        {
            Visible = false;
        }

        modify("Quantity Shipped")
        {
            Visible = true;
        }

        modify("Quantity Invoiced")
        {
            Visible = false;
        }

        modify("Line Amount")
        {
            Visible = false;
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

    trigger OnAfterGetRecord()
    begin
        if Rec."Type" <> Rec.Type::Item then
            exit;
        OnAfterGetRecordOnValidateUoM(Rec, xRec, UoMValid);
    end;

    var
        UserModifiedUnitPrice: Boolean;
        UoMValid: Boolean;


    procedure PrepareUserModifiedUnitPrice()
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        UserModifiedUnitPrice := true;

    end;


    [IntegrationEvent(false, false)]
    local procedure OnValidateCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidatePallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToShipCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToShipPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordOnValidateUoM(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var UoMValid: Boolean)
    begin
    end;

    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;
}


