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
                trigger OnValidate()
                begin
                    OnValidatePallet(Rec, xRec);
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
                trigger OnValidate()
                begin
                    OnValidateToShipCase(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateToShipPallet(Rec, xRec);
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

                trigger OnValidate()
                begin
                    OnValidateToReceiveCase(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateToReceivePallet(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }
        }

        moveafter("Qty. to Receive Pallet"; "Quantity Received")

        addafter("Quantity Received")
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
        LookupUserId: Codeunit "LookupUserID";

    [IntegrationEvent(false, false)]
    local procedure OnValidateCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidatePallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToShipCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToShipPallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToReceiveCase(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToReceivePallet(var Rec: Record "Transfer Line"; xRec: Record "Transfer Line")
    begin
    end;

}