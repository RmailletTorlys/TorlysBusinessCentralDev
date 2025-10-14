pageextension 56631 TorlysSalesReturnOrderSubform extends "Sales Return Order Subform"
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
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateCase(Rec, xRec);
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
                    OnValidatePallet(Rec, xRec);
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

        moveafter("Outstanding Quantity"; "Return Qty. to Receive")

        addafter("Return Qty. to Receive")
        {
            field("Return Qty. To Receive Case"; Rec."Return Qty. to Receive Case")
            {
                Caption = 'Return Qty. to Receive Case';
                ToolTip = 'Return Qty. to Receive Case';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateToReceiveCase(Rec, xRec);
                    CurrPage.Update(true);
                end;

            }

            field("Return Qty. to Receive Pallet"; Rec."Return Qty. to Receive Pallet")
            {
                Caption = 'Return Qty. to Receive Pallet';
                ToolTip = 'Return Qty. to Receive Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateToReceivePallet(Rec, xRec);
                    CurrPage.Update(true);
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
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                visible = true;
                Editable = false;
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
            }
        }

        moveafter("Unit Cost"; "Unit Cost (LCY)", "Return Qty. Received")

        addafter("Return Qty. Received")
        {

            field("Return Qty. Rcd. Not Invoiced"; Rec."Return Rcd. Not Invd.")
            {
                Caption = 'Return Qty. Rcd. Not Invoiced';
                ToolTip = 'Return Qty. Rcd. Not Invoiced';
                ApplicationArea = All;
            }
        }

        moveafter("Return Qty. Rcd. Not Invoiced"; "Qty. to Invoice", "Quantity Invoiced")

        moveafter("Quantity Invoiced"; "Tax Group Code", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field("Created By"; LookupUser.UserId(Rec.SystemCreatedBy))
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

            field("Modified By"; LookupUser.UserId(Rec.SystemModifiedBy))
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

        modify("Unit Cost (LCY)")
        {
            Visible = true;
            Editable = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Return Reason Code")
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

        modify(SubtotalExclVAT)
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
    }

    var
        LookupUser: Codeunit "LookupUserID";
        EditCasePallet: Boolean;

    trigger OnAfterGetRecord()
    begin
        OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordCheckEditCasePallet(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    begin
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