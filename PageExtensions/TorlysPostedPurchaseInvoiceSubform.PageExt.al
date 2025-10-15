pageextension 50138 PostedPurchaseInv extends "Posted Purch. Invoice Subform"
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

        moveafter("Vendor Item No."; Description)

        addafter("Description")
        {
            field("Location Code"; Rec."Location Code")
            {
                Caption = 'Location Code';
                ToolTip = 'Location Code';
                ApplicationArea = All;
            }
        }

        moveafter("Location Code"; "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
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

        addafter("Expected Departure Date")
        {
            field("Expected Receipt Date"; Rec."Expected Receipt Date")
            {
                Caption = 'Expected Receipt Date';
                ToolTip = 'Expected Receipt Date';
                ApplicationArea = All;
                Editable = true;
            }
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
                Editable = true;
            }
        }

        moveafter("Previous ETA"; "Tax Group Code", "Tax Area Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")//, ShortcutDimCode[5], ShortcutDimCode[6], ShortcutDimCode[7], ShortcutDimCode[8])

        // addafter("ShortcutDimCode[8]")
        // {
        //     field("Created By"; LookupUser.UserId(Rec.SystemCreatedBy))
        //     {
        //         Caption = 'Created By';
        //         ToolTip = 'Created By';
        //         ApplicationArea = All;
        //     }

        //     field("Created At"; Rec.SystemCreatedAt)
        //     {
        //         Caption = 'Created At';
        //         ToolTip = 'Created At';
        //         ApplicationArea = All;
        //     }

        //     field("Modified By"; LookupUser.UserId(Rec.SystemModifiedBy))
        //     {
        //         Caption = 'Modified By';
        //         ToolTip = 'Modified By';
        //         ApplicationArea = All;
        //     }

        //     field("Modified At"; Rec.SystemModifiedAt)
        //     {
        //         Caption = 'Modified At';
        //         ToolTip = 'Modified At';
        //         ApplicationArea = All;
        //     }
        // }

        modify("Tax Area Code")
        {
            Visible = true;
        }

        // modify(ShortcutDimCode[3])
        // {
        //     Visible = false;
        // }

        // modify(ShortcutDimCode[4])
        // {
        //     Visible = false;
        // }

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

        modify("Invoice Discount Amount")
        {
            Visible = false;
        }

    }

}