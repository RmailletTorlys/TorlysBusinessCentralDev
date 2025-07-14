pageextension 50096 TorlysSalesCrMemoSubForm extends "Sales Cr. Memo Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.", Description, "Description 2", "Unit of Measure Code", "Location Code", Quantity)

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

        addafter("Outstanding Quantity")
        {
            field("Return Qty. to Receive"; Rec."Return Qty. to Receive")
            {
                Caption = 'Return Qty. to Receive';
                ToolTip = 'Return Qty. to Receive';
                ApplicationArea = All;
            }

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
        addafter("Return Qty. to Receive Pallet")
        {
            field("Return Qty. Received"; Rec."Return Qty. Received")
            {
                Caption = 'Qty. Received';
                ToolTip = 'Qty. Received';
                ApplicationArea = All;
                Visible = false;
            }

            field("Return Qty. Rcd. Not Invoiced"; Rec."Return Rcd. Not Invd.")
            {
                Caption = 'Return Qty. Rcd. Not Invoiced';
                ToolTip = 'Return Qty. Rcd. Not Invoiced';
                ApplicationArea = All;
                Visible = false;
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

            field("Qty. Invoiced"; Rec."Quantity Invoiced")
            {
                Caption = 'Qty. Invoiced';
                ToolTip = 'Qty. Invoiced';
                ApplicationArea = All;
                Visible = false;
            }

            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Visible = false;
            }

            field("Default Price List Code"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Visible = false;
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
                Visible = false;
            }

            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
                Visible = false;
            }

            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
                ApplicationArea = All;
                Visible = false;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'SystemCreatedAt';
                ToolTip = 'SystemCreatedAt';
                ApplicationArea = All;
                Visible = false;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'SystemModifiedBy';
                ToolTip = 'SystemModifiedBy';
                ApplicationArea = All;
                Visible = false;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'SystemModifiedAt';
                ToolTip = 'SystemModifiedAt';
                ApplicationArea = All;
                Visible = false;
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
