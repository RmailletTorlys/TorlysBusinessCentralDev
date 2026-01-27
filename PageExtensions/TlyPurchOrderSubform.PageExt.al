pageextension 50054 TlyPurchOrderSubform extends "Purchase Order Subform"
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
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQuantityCase(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     if Rec.Type <> Rec.Type::Item then
                //         exit;
                //     OnValidateQuantityPallet(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
            }
        }

        moveafter("Quantity Pallet"; "Direct Unit Cost", "Indirect Cost %", "Unit Cost (LCY)", "Line Amount", "Lead Time Calculation")

        addafter("Lead Time Calculation")
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
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
            }
            field("Expected Departure Date"; Rec."Expected Departure Date")
            {
                Caption = 'Expected Departure Date';
                ToolTip = 'Expected Departure Date';
                ApplicationArea = All;
            }
        }

        moveafter("Expected Departure Date"; "Planned Receipt Date", "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {
            field("Container No."; Rec."Container No.")
            {
                Caption = 'Container No.';
                ToolTip = 'Container No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Booking No."; Rec."Booking No.")
            {
                Caption = 'Booking No.';
                ToolTip = 'Booking No.';
                ApplicationArea = All;
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
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQtyToReceiveCase(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQtyToReceivePallet(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
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

        moveafter("Qty. Rcd. Not Invoiced"; "Qty. to Invoice", "Quantity Invoiced", "Tax Group Code", "Tax Area Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", ShortcutDimCode4, "Drop Shipment")

        addafter("Drop Shipment")
        {
            field("Sales Order No."; Rec."Sales Order No.")
            {
                Caption = 'Sales Order No.';
                ToolTip = 'Sales Order No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Sales Order Line No."; Rec."Sales Order Line No.")
            {
                Caption = 'Sales Order Line No.';
                ToolTip = 'Sales Order Line No.';
                ApplicationArea = All;
                Editable = false;
            }

            field("Quantity Linked"; Rec."Quantity Linked")
            {
                Caption = 'Quantity Linked';
                ToolTip = 'Quantity Linked';
                ApplicationArea = All;
            }

            field("Quantity Remaining"; QuantityRemaining)
            {
                Caption = 'Quantity Remaining';
                ToolTip = 'Quantity Remaining';
                ApplicationArea = All;
            }

            field("Qty. to Ship Linked"; Rec."Qty. to Ship Linked")
            {
                Caption = 'Qty. to Ship Linked';
                ToolTip = 'Qty. to Ship Linked';
                ApplicationArea = All;
            }
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

        modify(ShortcutDimCode3)
        {
            Visible = false;
        }

        modify(ShortcutDimCode4)
        {
            Editable = false;
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

        modify("Drop Shipment")
        {
            Visible = true;
        }
        modify("Lead Time Calculation")
        {
            Visible = true;
            Editable = false;
        }
    }

    actions
    {
        addfirst("&Line")
        {
            action(ItemAvailability)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Availability';
                Ellipsis = true;
                Image = ItemAvailability;
                ToolTip = 'Item Availability';
                Promoted = true;
                trigger OnAction()
                var
                    Item: Record "Item";
                begin
                    Item.Reset();
                    Item.SetRange("No.", Rec."No.");
                    Page.Run(Page::TlyItemAvailability, Item);
                end;
            }
        }
    }

    var
        LookupUser: Codeunit TlyLookupUserID;
        EditCasePallet: Boolean;
        QuantityRemaining: Decimal;

    trigger OnAfterGetRecord()
    begin
        // OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
        EditCasePallet := CheckEditCasePallet(Rec);
        QuantityRemaining := Rec.Quantity - Rec."Quantity Linked";
    end;


    // [IntegrationEvent(false, false)]
    // local procedure OnAfterGetRecordCheckEditCasePallet(Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; var EditCasePallet: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQtyToReceiveCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQtyToReceivePallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    // begin
    // end;

    procedure CheckEditCasePallet(var Rec: Record "Purchase Line"): Boolean
    var
        Item: Record Item;
    begin
        if Rec.Type <> Rec.Type::Item then exit(false);
        if Rec."No." = '' then exit(false);
        Item.Get(Rec."No.");
        if Item."Compare Unit of Measure" = '' then exit(false);
        exit(true);
    end;
}