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

        addafter("Vendor Reference No.")
        {
            field("Manufacturing Code"; Rec."Manufacturing Code")
            {
                Caption = 'Manufacturing Code';
                ToolTip = 'Manufacturing Code';
                ApplicationArea = All;
            }
        }

        movebefore(Quantity; "Location Code", "Unit of Measure Code")

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

            field("Container No."; Rec."Container No.")
            {
                Caption = 'Container No.';
                ToolTip = 'Container No.';
                ApplicationArea = All;
            }

            field("SH BoL No."; Rec."SH BoL No.")
            {
                Caption = 'SH BoL No.';
                ToolTip = 'SH BoL No.';
                ApplicationArea = All;
            }

            field("Urgent"; Rec."Urgent")
            {
                Caption = 'Urgent';
                ToolTip = 'Urgent';
                ApplicationArea = All;
            }

            field("Strike"; Rec."Strike")
            {
                Caption = 'Strike';
                ToolTip = 'Strike';
                ApplicationArea = All;
            }

            field("Production Date"; Rec."Production Date")
            {
                Caption = 'Production Date';
                ToolTip = 'Production Date';
                ApplicationArea = All;
            }
        }

        moveafter("Production Date"; "Planned Receipt Date")

        addafter("Planned Receipt Date")
        {
            field("Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ToolTip = 'Shipment Date';
                ApplicationArea = All;
            }

            field("Previous ETA Date"; Rec."Previous ETA Date")
            {
                Caption = 'Previous ETA Date';
                ToolTip = 'Previous ETA Date';
                ApplicationArea = All;
            }
        }

        moveafter("Previous ETA Date"; "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {
            field("Confirmation No."; Rec."Confirmation No.")
            {
                Caption = 'Confirmation No.';
                ToolTip = 'Confirmation No.';
                ApplicationArea = All;
            }

            field("Outstanding Qty."; Rec."Outstanding Qty.")
            {
                Caption = 'Outstanding Qty.';
                ToolTip = 'Outstanding Qty.';
                ApplicationArea = All;
            }

        }

        moveafter("Outstanding Qty."; "Qty. to Receive")

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
            field("Special Price"; Rec."Special Price")
            {
                Caption = 'Special Price';
                ToolTip = 'Special Price';
                ApplicationArea = All;
            }

            field("Special Purchase Price"; Rec."Special Purchase Price")
            {
                Caption = 'Special Purchase Price';
                ToolTip = 'Special Purchase Price';
                ApplicationArea = All;
            }
        }

        moveafter("Special Purchase Price"; "Direct Unit Cost")

        addafter("Direct Unit Cost")
        {

            field("Price Based On"; Rec."Price Based On")
            {
                Caption = 'Price Based On';
                ToolTip = 'Price Based On';
                ApplicationArea = All;
            }

            field("Price Confirmed"; Rec."Price Confirmed")
            {
                Caption = 'Price Confirmed';
                ToolTip = 'Price Confirmed';
                ApplicationArea = All;
            }
        }

        moveafter("Price Confirmed"; "Indirect Cost %")

        addafter("Indirect Cost %")
        {
            field("Landed Cost CDN"; Rec."Landed Cost CDN")
            {
                Caption = 'Landed Cost CDN';
                ToolTip = 'Landed Cost CDN';
                ApplicationArea = All;
            }
        }

        moveafter("Landed Cost CDN"; "Line Amount", "Quantity Received")

        addafter("Quantity Received")
        {
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

        addafter("Qty. Received Pallet")
        {
            field("Amt. Rcd. not Invoiced"; Rec."Amt. Rcd. Not Invoiced")
            {
                Caption = 'Amt. Rcd. Not Invoiced';
                ToolTip = 'Amt. Rcd. Not Invoiced';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Amt. Rcd. Not Invoiced ($)"; Rec."Amt. Rcd. Not Invoiced (LCY)")
            {
                Caption = 'Amt. Rcd. Not Invoiced ($)';
                ToolTip = 'Amt. Rcd. Not Invoiced ($)';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }
        }


        moveafter("Amt. Rcd. Not Invoiced ($)"; "Qty. to Invoice", "Quantity Invoiced", "Tax Group Code", "Drop Shipment")

        addafter("Drop Shipment")
        {
            field("Special Order"; Rec."Special Order")
            {
                Caption = 'Special Order';
                ToolTip = 'Special Order';
                ApplicationArea = All;
            }

            field("Department Code"; Rec."Department Code")
            {
                Caption = 'Department Code';
                ToolTip = 'Department Code';
                ApplicationArea = All;
            }

            field("Project Code"; Rec."Project Code")
            {
                Caption = 'Project Code';
                ToolTip = 'Project Code';
                ApplicationArea = All;
            }

            field("LOB Code"; Rec."LOB Code")
            {
                Caption = 'LOB Code';
                ToolTip = 'LOB Code';
                ApplicationArea = All;
            }
        }

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