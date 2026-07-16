pageextension 50529 TlyPostedPurchInvLines extends "Posted Purchase Invoice Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                Caption = 'Posting Date';
                ToolTip = 'Posting Date';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Posting Date"; "Buy-from Vendor No.")

        addafter("Buy-from Vendor No.")
        {
            field("Manufacturer Code"; ManufacturerCode)
            {
                Caption = 'Manufacturer Code';
                ToolTip = 'Manufacturer Code';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Manufacturer Code"; "Buy-from Vendor Name", Type, "No.")

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

        addafter(Description)
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

        moveafter("Quantity Pallet"; "Direct Unit Cost", "Indirect Cost %", "Unit Cost (LCY)", Amount)

        addafter("Amount")
        {
            field("Confirmation No."; Rec."Confirmation No.")
            {
                Caption = 'Confirmation No.';
                ToolTip = 'Confirmation No.';
                ApplicationArea = All;
            }
            field("Notes"; Rec."Notes")
            {
                Caption = 'Notes';
                ToolTip = 'Notes';
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
                Editable = true;
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
            field("Container No. (TPS)"; Rec."Container No. (TPS)")
            {
                Caption = 'Container No. (TPS)';
                ToolTip = 'Container No. (TPS)';
                ApplicationArea = All;
            }
            field("Container No. (NAV)"; Rec."Container No. (NAV)")
            {
                Caption = 'Container No. (NAV)';
                ToolTip = 'Container No. (NAV)';
                ApplicationArea = All;
            }
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                ApplicationArea = All;
            }
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
            }
        }

        moveafter("Tax Area Code"; "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")

        addafter("Shortcut Dimension 2 Code")
        {
            field(ShortcutDimCode4; ShortcutDimCode[4])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,4';
                ToolTip = 'Global Dimension 4 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
            }

            field(ShortcutDimCode5; ShortcutDimCode[5])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,5';
                ToolTip = 'Global Dimension 5 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
            }

            field(ShortcutDimCode6; ShortcutDimCode[6])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,6';
                ToolTip = 'Global Dimension 6 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
            }

            field(ShortcutDimCode7; ShortcutDimCode[7])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,7';
                ToolTip = 'Global Dimension 7 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
            }

            field(ShortcutDimCode8; ShortcutDimCode[8])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,8';
                ToolTip = 'Global Dimension 8 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
            }

            field("Created By"; LookupUserId.UserId(Rec.SystemCreatedBy))
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
        }

        modify("Variant Code")
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

        modify("FA Posting Type")
        {
            Visible = false;
        }

        modify("Depreciation Book Code")
        {
            Visible = false;
        }

        modify("Unit of Measure")
        {
            Visible = false;
        }

        modify("Unit Price (LCY)")
        {
            Visible = false;
        }

        modify("Amount Including VAT")
        {
            Visible = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Line Discount Amount")
        {
            Visible = false;
        }

        modify("Allow Invoice Disc.")
        {
            Visible = false;
        }

        modify("Inv. Discount Amount")
        {
            Visible = false;
        }

        modify("Appl.-to Item Entry")
        {
            Visible = false;
        }

        modify("Insurance No.")
        {
            Visible = false;
        }

        modify("Depr. until FA Posting Date")
        {
            Visible = false;
        }

        modify("Depr. Acquisition Cost")
        {
            Visible = false;
        }

        modify("Budgeted FA No.")
        {
            Visible = false;
        }

        modify("Job No.")
        {
            Visible = false;
        }
    }

    trigger OnAfterGetRecord()
    var
        PurchHead: Record "Purch. Inv. Header";
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        PurchHead.Reset();
        PurchHead.SetRange("No.", Rec."Document No.");
        if PurchHead.Find('-') then begin
            ManufacturerCode := PurchHead."Manufacturer Code";
        end else begin
            ManufacturerCode := '';
        end;
    end;

    var
        LookupUserId: Codeunit TlyLookupUserID;
        ShortcutDimCode: array[8] of Code[20];
        ManufacturerCode: Code[20];
}