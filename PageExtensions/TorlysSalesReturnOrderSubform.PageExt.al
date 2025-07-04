pageextension 56631 TorlysSalesReturnOrderSubform extends "Sales Return Order Subform"
{
    layout
    {

        moveafter(Description; "Description 2", "Unit of Measure Code", "Location Code", Quantity)

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
            field("Return Qty. To Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateToReceiveCase(Rec, xRec);
                end;

            }

            field("Return Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateToReceivePallet(Rec, xRec);
                end;
            }
        }
        moveafter("Return Qty. to Receive Pallet"; "Return Qty. Received")

        addafter("Return Qty. Received")
        {

            field("Return Qty. Rcd. Not Invoiced"; Rec."Return Rcd. Not Invd.")
            {
                Caption = 'Return Qty. Rcd. Not Invoiced';
                ToolTip = 'Return Qty. Rcd. Not Invoiced';
                ApplicationArea = All;
            }
        }
        moveafter("Return Qty. Rcd. Not Invoiced"; "Qty. to Invoice")

        addafter("Qty. to Invoice")
        {

            field("Qty. Invoiced"; Rec."Quantity Invoiced")
            {
                Caption = 'Qty. Invoiced';
                ToolTip = 'Qty. Invoiced';
                ApplicationArea = All;
            }

            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
            }

            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
            }

            field("Price List Code"; Rec."Price List")
            {
                Caption = 'Price List Code';
                ToolTip = 'Price List Code';
                ApplicationArea = All;
            }
        }

        moveafter("Price List Code"; "Unit Price")

        addafter("Unit Price")
        {

            field("Line Amount Excl. Tax"; Rec.Amount)
            {
                Caption = 'Line Amount Excl. Tax';
                ToolTip = 'Line Amount Excl. Tax';
                ApplicationArea = All;
            }

            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
            }

            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'SystemCreatedAt';
                ToolTip = 'SystemCreatedAt';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'SystemModifiedBy';
                ToolTip = 'SystemModifiedBy';
                ApplicationArea = All;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'SystemModifiedAt';
                ToolTip = 'SystemModifiedAt';
                ApplicationArea = All;
            }


        }
    }

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