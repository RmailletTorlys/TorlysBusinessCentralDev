pageextension 50054 TorlysPurchaseOrderSubform extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Reference No."; Rec."Vendor Item No.")
            {
                Caption = 'Vendor Reference No.';
                ToolTip = 'Vendor Reference No.';
                ApplicationArea = All;
            }
        }

        moveafter("Vendor Reference No."; Description, "Location Code")
        addafter("Location Code")
        {

            field("Container No."; Rec."Container No.")
            {
                Caption = 'Container No.';
                ToolTip = 'Container No.';
                ApplicationArea = All;
            }
        }

        moveafter("Container No."; "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Case Quantity"; Rec."Quantity Case")
            {
                Caption = 'Case Quantity';
                ToolTip = 'Case Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if Rec.Type <> Rec.Type::Item then
                        exit;
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
                    if Rec.Type <> Rec.Type::Item then
                        exit;
                    OnValidatePallet(Rec, xRec);
                end;
            }
        }

        moveafter("Pallet Quantity"; "Expected Receipt Date", "Direct Unit Cost", "Indirect Cost %")

        addafter("Indirect Cost %")
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
            }
        }
        moveafter("Unit Cost"; "Unit Cost (LCY)", "Line Amount")

        addafter("Line Amount")
        {
            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                Caption = 'Outstanding Quantity';
                ToolTip = 'Outstanding Quantity';
                ApplicationArea = All;
                DecimalPlaces = 0 : 5;
                Editable = false;
            }
        }

        moveafter("Outstanding Quantity"; "Qty. to Receive")


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

        }

        moveafter("Qty. to Receive Pallet"; "Quantity Received")

        addafter("Quantity Received")
        {
            field("Qty. Rcd. Not Invoiced"; Rec."Qty. Rcd. Not Invoiced")
            {
                Caption = 'Qty. Rcd. Not Invoiced';
                ToolTip = 'Qty. Rcd. Not Invoiced';
                ApplicationArea = All;
                Editable = false;
            }
        }

        moveafter("Qty. Rcd. Not Invoiced"; "Qty. to Invoice", "Quantity Invoiced", "Tax Group Code")


        modify("Reserved Quantity")
        {
            Visible = false;
        }

        modify("Tax Area Code")
        {
            Visible = false;
        }

        modify("Qty. to Assign")
        {
            Visible = false;
        }

        modify("Item Charge Qty. to Handle")
        {
            Visible = false;
        }

        modify("Qty. Assigned")
        {
            Visible = false;
        }

        modify("Promised Receipt Date")
        {
            Visible = false;
        }

        modify("Over-Receipt Code")
        {
            Visible = false;
        }

        modify("Over-Receipt Quantity")
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

        modify("GST/HST")
        {
            Visible = false;
        }

        modify("Bin Code")
        {
            Visible = false;
        }

        modify("TPS CMG Container Qty")
        {
            Visible = false;
        }

        modify("Quantity Received")
        {
            Visible = true;
        }

        modify("Planned Receipt Date")
        {
            Visible = false;
        }

        modify("LAX Exclude From Performance")
        {
            Visible = false;
        }

        modify("Item Reference No.")
        {
            Visible = false;
        }

        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }

        modify("Indirect Cost %")
        {
            Visible = true;
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