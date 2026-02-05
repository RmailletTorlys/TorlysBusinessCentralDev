pageextension 50392 TlyPhysInventoryJournal extends "Phys. Inventory Journal"
{
    layout
    {
        moveafter("Location Code"; "Unit of Measure Code")

        addafter("Qty. (Calculated)")
        {
            field("Qty. (Calculated) Case"; Rec."Qty. (Calculated) Case")
            {
                ApplicationArea = All;
                Caption = 'Qty. (Calculated) Case';
                ToolTip = 'Qty. (Calculated) Case';
                Editable = false;
            }
            field("Qty. (Calculated) Pallet"; Rec."Qty. (Calculated) Pallet")
            {
                ApplicationArea = All;
                Caption = 'Qty. (Calculated) Pallet';
                ToolTip = 'Qty. (Calculated) Pallet';
                Editable = false;
            }
        }
        addafter("Qty. (Phys. Inventory)")
        {
            field("Qty. (Phys. Inventory) Case"; Rec."Qty. (Phys. Inventory) Case")
            {
                ApplicationArea = All;
                Caption = 'Qty. (Phys. Inventory) Case';
                ToolTip = 'Qty. (Phys. Inventory) Case';
                Editable = EditCasePallet;
            }
            field("Qty. (Phys. Inventory) Pallet"; Rec."Qty. (Phys. Inventory) Pallet")
            {
                ApplicationArea = All;
                Caption = 'Qty. (Phys. Inventory) Pallet';
                ToolTip = 'Qty. (Phys. Inventory) Pallet';
                Editable = EditCasePallet;
            }
        }
        addafter("Quantity")
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                ApplicationArea = All;
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                Editable = false;
            }
            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                ApplicationArea = All;
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                Editable = false;
            }
        }
        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
        modify(ShortcutDimCode3)
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
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    procedure CheckEditCasePallet(var Rec: Record "Item Journal Line"): Boolean
    var
        Item: Record Item;
    begin
        if Rec."Item No." = '' then exit(false);
        Item.Get(Rec."Item No.");
        if Item."Compare Unit of Measure" = '' then exit(false);
        exit(true);
    end;
}