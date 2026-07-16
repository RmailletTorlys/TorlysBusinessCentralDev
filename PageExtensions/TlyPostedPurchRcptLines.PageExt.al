pageextension 50528 TlyPostedPurchRcptLines extends "Posted Purchase Receipt Lines"
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

            field("Buy-from Vendor Name"; BuyFromVendorName)
            {
                Caption = 'Buy-from Vendor Name';
                ToolTip = 'Buy-from Vendor Name';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Buy-from Vendor Name"; Type, "No.")

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
            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
            }
        }

        addafter("Quantity Pallet")
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

            field("Planned Receipt Date"; Rec."Planned Receipt Date")
            {
                Caption = 'Planned Receipt Date';
                ToolTip = 'Planned Receipt Date';
                ApplicationArea = All;
            }
        }

        moveafter("Planned Receipt Date"; "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {
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

            field("Qty. Rcd. Not Invoiced"; Rec."Qty. Rcd. Not Invoiced")
            {
                Caption = 'Qty. Rcd. Not Invoiced';
                ToolTip = 'Qty. Rcd. Not Invoiced';
                ApplicationArea = All;
            }
        }

        moveafter("Qty. Rcd. Not Invoiced"; "Quantity Invoiced")

        addafter("Quantity Invoiced")
        {
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
    }

    trigger OnAfterGetRecord()
    var
        PurchHead: Record "Purch. Rcpt. Header";
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        PurchHead.Reset();
        PurchHead.SetRange("No.", Rec."Document No.");
        if PurchHead.Find('-') then begin
            ManufacturerCode := PurchHead."Manufacturer Code";
            BuyfromVendorName := PurchHead."Buy-from Vendor Name";
        end else begin
            ManufacturerCode := '';
            BuyFromVendorName := '';
        end;
    end;

    var
        LookupUserId: Codeunit TlyLookupUserID;
        ShortcutDimCode: array[8] of Code[20];
        ManufacturerCode: Code[20];
        BuyFromVendorName: Text[100];
}