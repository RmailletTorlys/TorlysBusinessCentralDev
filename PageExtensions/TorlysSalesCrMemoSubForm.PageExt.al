pageextension 50096 TorlysSalesCrMemoSubForm extends "Sales Cr. Memo Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.", Description, "Location Code", "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {

            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateCase(Rec, xRec);
                end;
            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidatePallet(Rec, xRec);
                end;
            }

            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                Caption = 'Outstanding Quantity';
                ToolTip = 'Outstanding Quantity';
                ApplicationArea = All;
            }
        }

        addafter("Outstanding Quantity")
        {
            field("Return Qty. to Receive"; Rec."Return Qty. to Receive")
            {
                Caption = 'Return Qty. to Receive';
                ToolTip = 'Return Qty. to Receive';
                ApplicationArea = All;
            }

            field("Return Qty. To Receive Case"; Rec."Return Qty. to Receive Case")
            {
                Caption = 'Return Qty. to Receive Case';
                ToolTip = 'Return Qty. to Receive Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateToReceiveCase(Rec, xRec);
                end;

            }

            field("Return Qty. to Receive Pallet"; Rec."Return Qty. to Receive Pallet")
            {
                Caption = 'Return Qty. to Receive Pallet';
                ToolTip = 'Return Qty. to Receive Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateToReceivePallet(Rec, xRec);
                end;
            }
        }
        addafter("Return Qty. to Receive Pallet")
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Visible = false;
                Editable = false;
            }

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Visible = false;
                Editable = false;
            }
            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Visible = false;
                Editable = false;
            }

            field("Price List"; Rec."Price List")
            {
                Caption = 'Price List Code';
                ToolTip = 'Price List Code';
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
                Visible = true;
                editable = false;
            }
        }

        moveafter("Unit Cost"; "Unit Cost (LCY)")

        addafter("Unit Cost (LCY)")
        {
            field("Return Qty. Received"; Rec."Return Qty. Received")
            {
                Caption = 'Return Qty. Received';
                ToolTip = 'Return Qty. Received';
                ApplicationArea = All;
                Visible = true;
            }

            field("Return Qty. Rcd. Not Invoiced"; Rec."Return Rcd. Not Invd.")
            {
                Caption = 'Return Qty. Rcd. Not Invoiced';
                ToolTip = 'Return Qty. Rcd. Not Invoiced';
                ApplicationArea = All;
                Visible = true;
            }
        }
        addafter("Return Qty. Rcd. Not Invoiced")
        {
            field("Qty. to Invoice"; Rec."Qty. to Invoice")
            {
                Caption = 'Qty. to Invoice';
                ToolTip = 'Qty. to Invoice';
                ApplicationArea = All;
            }

            field("Quantity Invoiced"; Rec."Quantity Invoiced")
            {
                Caption = 'Quantity Invoiced';
                ToolTip = 'Quantity Invoiced';
                ApplicationArea = All;
                Visible = true;
            }
        }

        moveafter("Quantity Invoiced"; "Tax Group Code", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field("Created By"; LookupUser.GuidId(Rec.SystemCreatedBy))
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

            field("Modified By"; LookupUser.GuidId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Visible = true;
            }

            field("Modified At"; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
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

        modify("Unit Cost (LCY)")
        {
            Visible = true;
            Editable = false;
        }

        modify("Amount Including VAT")
        {
            Visible = false;
        }

        modify("Line Discount %")
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
        LookupUser: Codeunit "LookupUserID";
        UserModifiedUnitPrice: Boolean;

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
    local procedure OnValidateToReceiveCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToReceivePallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

}
