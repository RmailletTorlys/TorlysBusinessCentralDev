pageextension 56641 TorlysPurchReturnOrderSubform extends "Purchase Return Order Subform"
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

        moveafter("Quantity Pallet"; "Direct Unit Cost", "Indirect Cost %", "Unit Cost (LCY)", "Line Amount")

        addafter("Line Amount")
        {
            field("Confirmation No."; Rec."Confirmation No.")
            {
                Caption = 'Confirmation No.';
                ToolTip = 'Confirmation No.';
                ApplicationArea = All;
                Visible = false;
            }

            field("Production Date"; Rec."Production Date")
            {
                Caption = 'Production Date';
                ToolTip = 'Production Date';
                ApplicationArea = All;
                Visible = false;
            }
            field("Possible Loading Date"; Rec."Possible Loading Date")
            {
                Caption = 'Possible Loading Date';
                ToolTip = 'Possible Loading Date';
                ApplicationArea = All;
                Visible = false;
            }
            field("Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ToolTip = 'Shipment Date';
                ApplicationArea = All;
                Visible = false;
            }
            field("Expected Departure Date"; Rec."Expected Departure Date")
            {
                Caption = 'Expected Departure Date';
                ToolTip = 'Expected Departure Date';
                ApplicationArea = All;
                Visible = false;
            }
        }

        addafter("Expected Departure Date")
        {
            field("Expected Receipt Date"; Rec."Expected Receipt Date")
            {
                Caption = 'Expected Receipt Date';
                ToolTip = 'Expected Receipt Date';
                ApplicationArea = All;
                Editable = true;
                Visible = false;
            }
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
                Editable = true;
                Visible = false;
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

        moveafter("Outstanding Quantity"; "Return Qty. to Ship")


        addafter("Return Qty. to Ship")
        {
            field("Return Qty. to Ship Case"; Rec."Return Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQtyToShipCase(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
            }

            field("Return Qty. to Ship Pallet"; Rec."Return Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQtyToShipPallet(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
            }
        }

        moveafter("Return Qty. to Ship Pallet"; "Return Qty. Shipped")

        addafter("Return Qty. Shipped")
        {
            field("Return Qty. Shipped Not Invd."; Rec."Return Qty. Shipped Not Invd.")
            {
                Caption = 'Return Qty. Shipped Not Invd.';
                ToolTip = 'Return Qty. Shipped Not Invd.';
                ApplicationArea = All;
                Editable = false;
            }
        }

        moveafter("Return Qty. Shipped Not Invd."; "Qty. to Invoice", "Quantity Invoiced", "Tax Group Code", "Tax Area Code")

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

        modify("Unit of Measure Code")
        {
            Visible = false;
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

        modify("Qty. Assigned")
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

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Return Reason Code")
        {
            Visible = false;
        }
    }

    var
        LookupUser: Codeunit TlyLookupUserID;
        EditCasePallet: Boolean;

    trigger OnAfterGetRecord()
    begin
        // OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
        EditCasePallet := CheckEditCasePallet(Rec);
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
    // local procedure OnValidateQtyToShipCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQtyToShipPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line")
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
