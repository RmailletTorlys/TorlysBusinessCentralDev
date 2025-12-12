pageextension 50047 "TorlysSalesInvoiceSubform" extends "Sales Invoice Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.", Description, "Location Code", "Unit of Measure Code", Quantity)

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
                //     OnValidateCase(Rec, Rec);
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
                //     OnValidatePallet(Rec, Rec);
                //     CurrPage.Update(true);
                // end;
            }

            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                Caption = 'Outstanding Quantity';
                ToolTip = 'Outstanding Quantity';
                ApplicationArea = All;
            }


            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Visible = false;
            }

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Visible = false;
            }

            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Visible = false;
            }

            field("Price List"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                Visible = false;
            }
        }

        moveafter("Price List"; "Unit Price", "Line Amount")

        addafter("Line Amount")
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
            }

        }

        moveafter("Unit Cost"; "Unit Cost (LCY)")

        addafter("Unit Cost (LCY)")
        {
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

        moveafter("Quantity Invoiced"; "Tax Group Code", "Tax Area Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", ShortcutDimCode5, ShortcutDimCode8)

        addafter(ShortcutDimCode8)
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

        modify("Unit Cost (LCY)")
        {
            Visible = true;
            Editable = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Amount Including VAT")
        {
            Visible = false;
        }

        modify("Qty. to Assign")
        {
            Visible = false;
        }

        modify("Qty. Assigned")
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

        modify(ShortcutDimCode6)
        {
            Visible = false;
        }

        modify(ShortcutDimCode7)
        {
            Visible = false;
        }

        modify("TotalSalesLine.""Line Amount""")
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
        LookupUser: Codeunit "TorlysLookupUserID";
        EditCasePallet: Boolean;

    trigger OnAfterGetRecord()
    // var

    // Item: Record Item;
    begin
        // OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
        // CheckEditCasePallet(Rec);
        // Item.Get(Rec."No.");
        // if Item."Compare Unit of Measure" = '' then EditCasePallet := false;
        // if Rec."No." <> '' then EditCasePallet := false;
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterGetRecordCheckEditCasePallet(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidatePallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    // begin
    // end;

    procedure CheckEditCasePallet(var Rec: Record "Sales Line"): Boolean
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