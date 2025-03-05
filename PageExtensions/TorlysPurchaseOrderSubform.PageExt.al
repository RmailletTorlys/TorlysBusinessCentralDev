pageextension 50008 TorlysPurchaseOrderSubform extends "Purchase Order Subform"
{
    layout
    {
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

            field("Qty. to Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateToReceiveCase(Rec, xRec);
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
                end;

            }

            field("Qty. Received Case"; Rec."Qty. Received Case")
            {
                Caption = 'Qty. Received Case';
                ToolTip = 'Qty. Received Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateReceivedCase(Rec, xRec);
                end;

            }

            field("Qty. Received Pallet"; Rec."Qty. Received Pallet")
            {
                Caption = 'Qty. Received Pallet';
                ToolTip = 'Qty. Received Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateReceivedPallet(Rec, xRec);
                end;
            }

        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnValidateCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidatePallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToReceiveCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToReceivePallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateReceivedCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateReceivedPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    begin
    end;

}