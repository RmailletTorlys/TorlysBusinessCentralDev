pageextension 50055 TorlysPurchaseInvoiceSubform extends "Purch. Invoice Subform"
{
    layout
    {
        moveafter("No."; Description, "Location Code", "Unit of Measure Code", "Quantity")

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

        moveafter("Quantity Pallet"; "Direct Unit Cost", "Line Amount", "Qty. to Assign", "Qty. Assigned")

        addafter("Qty. Assigned")
        {
            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                Caption = 'Outstanding Quantity';
                ToolTip = 'Outstanding Quantity';
                ApplicationArea = All;
            }

            field("Qty. to Invoice"; Rec."Qty. to Invoice")
            {
                Caption = 'Qty. to Invoice';
                ToolTip = 'Qty. to Invoice';
                ApplicationArea = All;
            }
            field("Quantity Invoiced"; Rec."Quantity Invoiced")
            {
                Caption = 'Quantity Invoiced';
                ToolTip = 'Quantity Invoiced';
                ApplicationArea = All;
            }

        }

        moveafter("Quantity Invoiced"; "Tax Group Code", "Tax Area Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", ShortcutDimCode5, ShortcutDimCode6, ShortcutDimCode7, ShortcutDimCode8)

        addafter(ShortcutDimCode8)
        {
            field("Created By"; LookupUser.GuidId(Rec.SystemCreatedBy))
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

            field("Modified By"; LookupUser.GuidId(Rec.SystemModifiedBy))
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



        modify("Item Reference No.")
        {
            Visible = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify(AmountBeforeDiscount)
        {
            Visible = false;
        }

        modify(InvoiceDiscountAmount)
        {
            Visible = false;
        }

        modify("Invoice Disc. Pct.")
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
}