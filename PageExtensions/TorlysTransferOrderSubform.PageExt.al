pageextension 55741 TorlysTransferOrderSubform extends "Transfer Order Subform"
{
    layout
    {
        moveafter("Item No."; Description, "Unit of Measure Code", Quantity)

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
                    OnValidateQuantityCase(Rec, xRec);
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
                    OnValidateQuantityPallet(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }
        }

        moveafter("Quantity Pallet"; "Qty. to Ship")

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

        moveafter("Qty. to Ship Pallet"; "Quantity Shipped")

        addafter("Quantity Shipped")
        {
            field("Qty. in Transit"; Rec."Qty. in Transit")
            {
                Caption = 'Qty. in Transit';
                ToolTip = 'Qty. in Transit';
                ApplicationArea = All;
            }
        }

        moveafter("Qty. in Transit"; "Qty. to Receive")

        addafter("Qty. to Receive")
        {

            field("Qty. to Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateQtyToReceiveCase(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateQtyToReceivePallet(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }
        }

        moveafter("Qty. to Receive Pallet"; "Quantity Received")

        addafter("Quantity Received")
        {
            field("Sales Order No."; Rec."Sales Order No.")
            {
                Caption = 'Sales Order No.';
                ToolTip = 'Sales Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Sales Order Line No."; Rec."Sales Order Line No.")
            {
                Caption = 'Sales Order Line No.';
                ToolTip = 'Sales Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Quantity Linked"; Rec."Quantity Linked")
            {
                Caption = 'Quantity Linked';
                ToolTip = 'Quantity Linked';
                ApplicationArea = All;
            }

            field("Qty. to Ship Linked"; Rec."Qty. to Ship Linked")
            {
                Caption = 'Qty. to Ship Linked';
                ToolTip = 'Qty. to Ship Linked';
                ApplicationArea = All;
            }

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

        modify("Reserved Quantity Inbnd.")
        {
            Visible = false;
        }

        modify("Reserved Quantity Shipped")
        {
            Visible = false;
        }

        modify("Reserved Quantity Outbnd.")
        {
            Visible = false;
        }

        modify("Shipment Date")
        {
            Visible = false;
        }

        modify("Receipt Date")
        {
            Visible = false;
        }

        modify("Custom Transit Number")
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit "TorlysLookupUserID";
        EditCasePallet: Boolean;

    trigger OnAfterGetRecord()
    begin
        OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordCheckEditCasePallet(Rec: Record "Transfer Line"; xRec: Record "Transfer Line"; var EditCasePallet: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQuantityCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQuantityPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQtyToShipCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQtyToShipPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQtyToReceiveCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateQtyToReceivePallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

}