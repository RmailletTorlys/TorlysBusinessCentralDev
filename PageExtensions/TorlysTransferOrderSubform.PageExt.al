pageextension 55741 TorlysTransferOrderSubform extends "Transfer Order Subform"
{
    layout
    {
        movebefore(Quantity; "Unit of Measure Code")

        addafter(Quantity)
        {
            field("Case Quantity"; Rec."Quantity Case")
            {
                Caption = 'Case Quantity';
                ToolTip = 'Case Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateCase(Rec, xRec);
                end;
            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidatePallet(Rec, xRec);
                end;
            }
        }

        moveafter("Pallet Quantity"; "Qty. to Ship")

        addafter("Qty. to Ship")
        {

            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateToShipCase(Rec, xRec)
                end;
            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateToShipPallet(Rec, xRec)
                end;
            }
        }
        moveafter("Qty. to Ship Pallet"; "Qty. to Receive")

        addafter("Qty. to Receive")
        {

            field("Qty. to Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateToReceiveCase(Rec, xRec)
                end;

            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateToReceivePallet(Rec, xRec)
                end;

            }

        }

        addafter("Quantity Shipped")
        {
            field("Quantity in Transit"; Rec."Qty. in Transit")
            {
                Caption = 'Qty. in Transit';
                ToolTip = 'Qty. in Transit';
                ApplicationArea = All;
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