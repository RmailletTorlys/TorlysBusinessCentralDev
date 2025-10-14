pageextension 50040 TorlysItemJournal extends "Item Journal"
{
    layout
    {
        moveafter("Posting Date"; EntryType, "Document No.", "External Document No.", "Item No.", Description, "Location Code", "Unit of Measure Code", "Quantity")

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
                Editable = EditCasePallet;
                trigger OnValidate()
                begin
                    OnValidateCase(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                Editable = EditCasePallet;
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidatePallet(Rec, xRec);
                    CurrPage.Update(true);
                end;
            }
        }

        moveafter("Quantity Pallet"; "Unit Amount", "Unit Cost", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Reason Code")

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

    var
        EditCasePallet: Boolean;

    trigger OnAfterGetRecord()
    begin
        OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordCheckEditCasePallet(Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line"; var EditCasePallet: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidatePallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
    end;
}