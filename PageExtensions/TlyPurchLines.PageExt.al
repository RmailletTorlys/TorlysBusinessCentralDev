pageextension 50518 TlyPurchLines extends "Purchase Lines"
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

        moveafter("Vendor Item No."; Description, "Location Code")

        addafter("Location Code")
        {
            field("Shipment Method Code"; Rec."Shipment Method Code")
            {
                Caption = 'Shipment Method Code';
                ToolTip = 'Shipment Method Code';
                ApplicationArea = All;
            }
        }

        moveafter("Shipment Method Code"; "Unit of Measure Code", Quantity)

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

        moveafter("Expected Departure Date"; "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
                Editable = true;
            }
            field("Container No."; Rec."Container No.")
            {
                Caption = 'Container No.';
                ToolTip = 'Container No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Container No. (NAV)"; Rec."Container No. (NAV)")
            {
                Caption = 'Container No. (NAV)';
                ToolTip = 'Container No. (NAV)';
                ApplicationArea = All;
            }
            field("Booking No."; Rec."Booking No.")
            {
                Caption = 'Booking No.';
                ToolTip = 'Booking No.';
                ApplicationArea = All;
            }
        }

        moveafter("Booking No."; "Outstanding Quantity")

        addafter("Outstanding Quantity")
        {
            field("Qty. to Receive"; Rec."Qty. to Receive")
            {
                Caption = 'Qty. to Receive';
                ToolTip = 'Qty. to Receive';
                ApplicationArea = All;
                DecimalPlaces = 0 : 5;
                Editable = false;
            }

            field("Qty. to Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;
            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;
            }
            field("Quantity Received"; Rec."Quantity Received")
            {
                Caption = 'Quantity Received';
                ToolTip = 'Quantity Received';
                ApplicationArea = All;
                Editable = false;
            }
            field("Qty. Rcd. Not Invoiced"; Rec."Qty. Rcd. Not Invoiced")
            {
                Caption = 'Qty. Rcd. Not Invoiced';
                ToolTip = 'Qty. Rcd. Not Invoiced';
                ApplicationArea = All;
                Editable = false;
            }

            field("Qty. to Invoice"; Rec."Qty. to Invoice")
            {
                Caption = 'Qty. to Invoice';
                ToolTip = 'Qty. to Invoice';
                ApplicationArea = All;
                Editable = false;
            }
            field("Quantity Invoiced"; Rec."Quantity Invoiced")
            {
                Caption = 'Quantity Invoiced';
                ToolTip = 'Quantity Invoiced';
                ApplicationArea = All;
                Editable = false;
            }

            field("Tax Group Code"; Rec."Tax Group Code")
            {
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                ApplicationArea = All;
                Editable = false;
            }
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
                Editable = false;
            }

            field("Drop Shipment"; Rec."Drop Shipment")
            {
                Caption = 'Drop Shipment';
                ToolTip = 'Drop Shipment';
                ApplicationArea = All;
                Editable = false;
            }

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



        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
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

        modify("Reserved Qty. (Base)")
        {
            Visible = false;
        }
    }

    var
        QuantityRemaining: Decimal;

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Document Type", 'Order');
    end;

    trigger OnAfterGetRecord()
    begin
        QuantityRemaining := Rec.Quantity - Rec."Quantity Linked";
    end;

    var
        LookupUser: Codeunit TlyLookupUserID;
}