pageextension 50131 TlyPostedSalesShptSubform extends "Posted Sales Shpt. Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.", "Description", "Location Code", "Unit of Measure Code", Quantity)

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

        moveafter("Quantity Pallet"; "Shipment Date")

        addafter("Shipment Date")
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Visible = true;
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

            field("Unit Price"; Rec."Unit Price")
            {
                Caption = 'Unit Price';
                ToolTip = 'Unit Price';
                ApplicationArea = All;
                Visible = false;
            }

            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
                Visible = false;
            }

            field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
            {
                Caption = 'Unit Cost (LCY)';
                ToolTip = 'Unit Cost (LCY)';
                ApplicationArea = All;
                Visible = false;
            }
        }

        moveafter("Unit Cost (LCY)"; "Qty. Shipped Not Invoiced", "Quantity Invoiced")

        addafter("Quantity Invoiced")
        {
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                ApplicationArea = All;
                Visible = false;
            }

            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
                Visible = false;
            }
            field("Builder Description"; Rec."Builder Description")
            {
                Caption = 'Builder Description';
                ToolTip = 'Builder Description';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order No."; Rec."Master Project Order No.")
            {
                Caption = 'Master Project Order No.';
                ToolTip = 'Master Project Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order Line No."; Rec."Master Project Order Line No.")
            {
                Caption = 'Master Project Order Line No.';
                ToolTip = 'Master Project Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Purchasing Code"; Rec."Purchasing Code")
            {
                Caption = 'Purchasing Code';
                ToolTip = 'Purchasing Code';
                ApplicationArea = All;
            }

            field("Drop Shipment"; Rec."Drop Shipment")
            {
                Caption = 'Drop Shipment';
                ToolTip = 'Drop Shipment';
                ApplicationArea = All;
            }

            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                Caption = 'Purchase Order No.';
                ToolTip = 'Purchase Order No.';
                ApplicationArea = All;
            }

            field("Purch. Order Line No."; Rec."Purch. Order Line No.")
            {
                Caption = 'Purch. Order Line No.';
                ToolTip = 'Purch. Order Line No.';
                ApplicationArea = All;
            }

            field("Transfer Order No."; Rec."Transfer Order No.")
            {
                Caption = 'Transfer Order No.';
                ToolTip = 'Transfer Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Transfer Order Line No."; Rec."Transfer Order Line No.")
            {
                Caption = 'Transfer Line Order No.';
                ToolTip = 'Transfer Line Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Purchase Order No."; Rec."Linked Purchase Order No.")
            {
                Caption = 'Linked Purchase Order No.';
                ToolTip = 'Linked Purchase Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Purch. Order Line No."; Rec."Linked Purch. Order Line No.")
            {
                Caption = 'Linked Purch. Order Line No.';
                ToolTip = 'Linked Purch. Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Linked Transfer Order No."; Rec."Linked Transfer Order No.")
            {
                Caption = 'Linked Transfer Order No.';
                ToolTip = 'Linked Transfer Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Transfer Order Line No."; Rec."Linked Transfer Order Line No.")
            {
                Caption = 'Linked Transfer Line Order No.';
                ToolTip = 'Linked Transfer Line Order No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Created By"; LookupUserIdWithGuid(Rec.SystemCreatedBy))
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

        modify("Qty. Shipped Not Invoiced")
        {
            Visible = true;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[3]")
        {
            Visible = false;
        }


        modify("ShortcutDimCode[4]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[5]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[6]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[7]")
        {
            Visible = false;
        }

        modify("ShortcutDimCode[8]")
        {
            Visible = false;
        }

        modify("Planned Delivery Date")
        {
            Visible = false;
        }

        modify("Planned Shipment Date")
        {
            Visible = false;
        }
    }

    actions
    {
        modify(UndoShipment)
        {
            trigger OnBeforeAction()
            var
                UndoShipmentModal: Page TlyUndoShipmentModal;
                UndoComment: Text[30];
                UndoString: Text[80];
                SalesCommentLine: Record "Sales Comment Line";
                LineNo: Integer;
            begin
                UndoComment := '';
                UndoString := '';

                UndoShipmentModal.PresentModal(Rec."Document No.", Rec."No.", Rec.Quantity);
                if UndoShipmentModal.RunModal() = Action::OK then begin
                    UndoComment := UndoShipmentModal.GetUndoComment();
                    UndoString := StrSubstNo('Undo shipment done by %1 on %2 at %3. %4', UserId, WorkDate(), Time, UndoComment);
                end else begin
                    Error('You did not enter a reason for undoing this shipment');
                end;

                if UndoComment = '' then Error('You did not enter a reason for undoing this shipment');

                SalesCommentLine.Reset();
                SalesCommentLine.SetCurrentKey("Document Type", "No.");
                SalesCommentLine.SetFilter("Document Type", 'Shipment');
                SalesCommentLine.SetRange("No.", Rec."Document No.");
                if SalesCommentLine.Find('+') then LineNo := SalesCommentLine."Line No.";
                SalesCommentLine.Reset;
                SalesCommentLine.Validate("Document Type", SalesCommentLine."Document Type"::Shipment);
                SalesCommentLine.Validate("No.", Rec."Document No.");
                SalesCommentLine.Validate("Line No.", LineNo + 10000);
                SalesCommentLine.Validate(Date, WorkDate());
                SalesCommentLine.Validate("Entered By", UserId);
                SalesCommentLine.Validate(Comment, UndoString);
                SalesCommentLine.Insert();
                Commit();
            end;
        }
    }

    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;

}