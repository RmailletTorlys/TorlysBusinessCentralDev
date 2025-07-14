pageextension 50040 TorlysItemJournal extends "Item Journal"
{
    layout
    {
        moveafter("Posting Date"; EntryType, "Document No.", "External Document No.", "Item No.", Description, "Location Code")

        addafter("Location Code")
        {
            field("Department Code"; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'Department Code';
                ToolTip = 'Department Code';
                ApplicationArea = All;
            }
        }

        moveafter("Department Code"; "Quantity")

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

        moveafter("Pallet Quantity"; "Unit of Measure Code", "Unit Amount", "Unit Cost", "Shortcut Dimension 2 Code", "Reason Code")

        modify("Entry Type")
        {
            Visible = false;
        }

        modify(EntryType)
        {
            Visible = true;
        }

        modify("External Document No.")
        {
            Visible = true;
        }

        modify("Reason Code")
        {
            Visible = true;
        }

        modify("Price Calculation Method")
        {
            Visible = false;
        }

        modify("Bin Code")
        {
            Visible = false;
        }

        modify(Amount)
        {
            Visible = false;
        }

        modify("Discount Amount")
        {
            Visible = false;
        }

        modify("Applies-to Entry")
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
    local procedure OnValidateCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidatePallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
    end;
}