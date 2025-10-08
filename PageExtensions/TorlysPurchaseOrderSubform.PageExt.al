pageextension 50054 TorlysPurchaseOrderSubform extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Item No."; Rec."Vendor Item No.")
            {
                Caption = 'Vendor Item No.';
                ToolTip = 'Vendor Item No.';
                ApplicationArea = All;
            }
        }

        moveafter("Vendor Item No."; Description, "Location Code", "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if Rec.Type <> Rec.Type::Item then
                        exit;
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
                    if Rec.Type <> Rec.Type::Item then
                        exit;
                    OnValidatePallet(Rec, xRec);
                end;
            }
        }

        moveafter("Quantity Pallet"; "Direct Unit Cost", "Indirect Cost %", "Unit Cost (LCY)", "Line Amount")

        addafter("Line Amount")
        {
            field("Confirmation No."; Rec."Confirmation No.")
            {
                Caption = 'Confirmation No.';
                ToolTip = 'Confirmation No.';
                ApplicationArea = All;
            }

            field("Production Date"; Rec."Production Date")
            {
                Caption = 'Production Date';
                ToolTip = 'Production Date';
                ApplicationArea = All;
            }
            field("Possible Loading Date"; Rec."Possible Loading Date")
            {
                Caption = 'Possible Loading Date';
                ToolTip = 'Possible Loading Date';
                ApplicationArea = All;
            }
            field("Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ToolTip = 'Shipment Date';
                ApplicationArea = All;
            }
            field("Expected Departure Date"; Rec."Expected Departure Date")
            {
                Caption = 'Expected Departure Date';
                ToolTip = 'Expected Departure Date';
                ApplicationArea = All;
            }
        }

        moveafter("Expected Departure Date"; "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
                Editable = true;
            }
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

        moveafter("Qty. Rcd. Not Invoiced"; "Qty. to Invoice", "Quantity Invoiced", "Tax Group Code", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field("Created By"; LookupUser.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }

            field("Created At"; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
            }

            field("Modified By"; LookupUser.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
            }

            field("Modified At"; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
            }
        }

        modify("Reserved Quantity")
        {
            Visible = false;
        }

        modify("Tax Area Code")
        {
            Visible = true;
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

        modify(AmountBeforeDiscount)
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
}